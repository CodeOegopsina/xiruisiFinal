package com.xiruisi.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.xiruisi.config.AlipayConfig;
import com.xiruisi.domain.*;
import com.xiruisi.service.GoodsService;
import com.xiruisi.service.PayService;
import com.xiruisi.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@SuppressWarnings("all")
@Controller
@RequestMapping("/pay")
public class PayController {

    @Autowired
    private PayService payService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private RegisterService registerService;

    /**
     * 前往支付界面
     * @return
     */
    @RequestMapping("toPay")
    public @ResponseBody String toPay(@RequestParam(value = "orderNum") String orderNum,
                 @RequestParam(value = "totalPrice") String totalPrice,
                 @RequestParam(value = "subject") String subject,
                 @RequestParam(value = "addressId") int addressId,
                 @RequestParam(value = "username") String username){

        //在订单中添加收货地址
        payService.addAddress(orderNum,addressId);

        //删除购物车信息
        List<Cart> allChecked = goodsService.findAllChecked(registerService.findUserByUsername(username).getUser_id());
        if(allChecked != null){
            for (Cart cart : allChecked) {
                goodsService.deleteCart(cart.getGoods().getGoods_id(),registerService.findUserByUsername(username).getUser_id());
            }
        }
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        String orderNum1=null;
        String totalPrice1=null;
        String subject1= null;
        try {
            orderNum1 = new String(orderNum.getBytes("ISO-8859-1"),"UTF-8");
            totalPrice1 = new String(totalPrice.getBytes("ISO-8859-1"),"UTF-8");
            subject1 = new String("Cypress Order".getBytes("ISO-8859-1"),"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        alipayRequest.setBizContent("{\"out_trade_no\":\""+ orderNum1 +"\","
                + "\"total_amount\":\""+ totalPrice1 +"\","
                + "\"subject\":\""+ subject1 +"\","
                + "\"body\":\"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        String result = null;
        try {
            result = alipayClient.pageExecute(alipayRequest).getBody();
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping("/paySuccess")
    public String paySuccess(@RequestParam(value = "out_trade_no") String out_trade_no){
        List<Order> orderByOrderNums= payService.findOrderByOrderNum(out_trade_no);
        for (Order orderByOrderNum : orderByOrderNums) {
            //修改订单成功时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String paid_time = sdf.format(new Date());
            orderByOrderNum.setPaid_time(paid_time);
            orderByOrderNum.setOrder_status(1);
            //保存订单
            payService.updateOrder(orderByOrderNum);
            //商品数量-1
            Goods goods = goodsService.findGoodsById(orderByOrderNum.getGoods().getGoods_id());
            goods.setGoods_number(goods.getGoods_number() - 1);
            goodsService.updateGoods(goods);
        }
        return "pay/paySuccess";
    }

    @RequestMapping("/deleteOrder")
    public ModelAndView deleteOrder(@RequestParam(value = "username") String username,
                                    @RequestParam(value = "currentPage") int currentPage,
                                    @RequestParam(value = "order_id") int order_id){
        ModelAndView modelAndView = new ModelAndView();
        payService.deleteOrder(order_id);
        if(username == null || username == ""){
            modelAndView.setViewName("system/login");
            return modelAndView;
        }
        //查询所有订单信息，封装对象
        List<Order> allOrderByAddressId = null;
        try {
            allOrderByAddressId = payService.findAllOrderByAddressId(registerService.findUserByUsername(username).getAddress().getAddress_id());
        } catch (Exception e) {
            modelAndView.setViewName("home/home_index");
            return modelAndView;
        }
        //将订单对象分装为展示对象
        List<OrderToShow> orderToShows = new ArrayList<OrderToShow>();
        String order_num = null;
        for (Order order : allOrderByAddressId) {
            OrderToShow orderToShow = new OrderToShow();
            /*来判断order_num出现过没有*/
            if(orderToShows.isEmpty()){
                orderToShow.setOrder_num(order.getOrder_num());
                orderToShow.setPaid_time(order.getPaid_time());
                List<Order> orders = new ArrayList<Order>();
                orders.add(order);
                orderToShow.setOrders(orders);
                orderToShows.add(orderToShow);
                order_num = order.getOrder_num();
            }else{
                if(order.getOrder_num().equals(order_num)){
                    for (OrderToShow toShow : orderToShows) {
                        if(toShow.getOrder_num().equals(order.getOrder_num())){
                            toShow.getOrders().add(order);
                        }
                    }
                }else{
                    orderToShow.setOrder_num(order.getOrder_num());
                    orderToShow.setPaid_time(order.getPaid_time());
                    List<Order> orders = new ArrayList<Order>();
                    orders.add(order);
                    orderToShow.setOrders(orders);
                    orderToShows.add(orderToShow);
                    order_num = order.getOrder_num();
                }
            }
        }
        //对orderToShows进行分页？？
        Page<OrderToShow> page = new Page<OrderToShow>();
        int totalCount = orderToShows.size();
        page.setTotalCount(totalCount);
        int pageSizes = 3;
        page.setPageSizes(pageSizes);
        page.setCurrentPage(currentPage);
        int totalPage = totalCount%pageSizes == 0? totalCount/pageSizes : totalCount/pageSizes + 1;
        page.setTotalPage(totalPage);
        int startPage = (currentPage-1)*pageSizes;
        //设置每页数据
        List<OrderToShow> list = new ArrayList<OrderToShow>();
        for(int i = startPage;i<startPage+pageSizes;i++){
            if(i>=totalCount){
                break;
            }
            list.add(orderToShows.get(i));
        }
        page.setList(list);
        //
        modelAndView.addObject("page",page);
        modelAndView.setViewName("home/home_index");
        return modelAndView;
    }

    @RequestMapping("/confirmOrder")
    public ModelAndView confirmOrder(@RequestParam(value = "username") String username,
                                     @RequestParam(value = "currentPage") int currentPage,
                                     @RequestParam(value = "out_trade_no") String out_trade_no){
        ModelAndView modelAndView = new ModelAndView();
        List<Order> orderByOrderNums= payService.findOrderByOrderNum(out_trade_no);
        for (Order orderByOrderNum : orderByOrderNums) {
            //修改订单状态为完成
            orderByOrderNum.setOrder_status(3);
            payService.updateOrder(orderByOrderNum);
        }
        if(username == null || username == ""){
            modelAndView.setViewName("system/login");
            return modelAndView;
        }
        //查询所有订单信息，封装对象
        List<Order> allOrderByAddressId = payService.findAllOrderByStatus(registerService.findUserByUsername(username).getAddress().getAddress_id(),2);
        List<OrderToShow> orderToShows = new ArrayList<OrderToShow>();
        String order_num = null;
        for (Order order : allOrderByAddressId) {
            OrderToShow orderToShow = new OrderToShow();
            /*来判断order_num出现过没有*/
            if(orderToShows.isEmpty()){
                orderToShow.setOrder_num(order.getOrder_num());
                orderToShow.setPaid_time(order.getPaid_time());
                List<Order> orders = new ArrayList<Order>();
                orders.add(order);
                orderToShow.setOrders(orders);
                orderToShows.add(orderToShow);
                order_num = order.getOrder_num();
            }else{
                if(order.getOrder_num().equals(order_num)){
                    for (OrderToShow toShow : orderToShows) {
                        if(toShow.getOrder_num().equals(order.getOrder_num())){
                            toShow.getOrders().add(order);
                        }
                    }
                }else{
                    orderToShow.setOrder_num(order.getOrder_num());
                    orderToShow.setPaid_time(order.getPaid_time());
                    List<Order> orders = new ArrayList<Order>();
                    orders.add(order);
                    orderToShow.setOrders(orders);
                    orderToShows.add(orderToShow);
                    order_num = order.getOrder_num();
                }
            }
        }
        Page<OrderToShow> page = new Page<OrderToShow>();
        int totalCount = orderToShows.size();
        page.setTotalCount(totalCount);
        int pageSizes = 3;
        page.setPageSizes(pageSizes);
        page.setCurrentPage(currentPage);
        int totalPage = totalCount%pageSizes == 0? totalCount/pageSizes : totalCount/pageSizes + 1;
        page.setTotalPage(totalPage);
        int startPage = (currentPage-1)*pageSizes;
        //设置每页数据
        List<OrderToShow> list = new ArrayList<OrderToShow>();
        for(int i = startPage;i<startPage+pageSizes;i++){
            if(i>=totalCount){
                break;
            }
            list.add(orderToShows.get(i));
        }
        page.setList(list);
        //
        modelAndView.addObject("page",page);
        modelAndView.setViewName("home/home_order_receive");
        return modelAndView;
    }
}
