package com.xiruisi.controller;

import com.xiruisi.domain.Address;
import com.xiruisi.domain.Order;
import com.xiruisi.domain.OrderToShow;
import com.xiruisi.domain.Page;
import com.xiruisi.service.GoodsService;
import com.xiruisi.service.PayService;
import com.xiruisi.service.RegisterService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("all")
@Controller
@RequestMapping("/system")
public class SystemController {

    @Autowired
    private PayService payService;

    @Autowired
    private RegisterService registerService;

    @Autowired
    private GoodsService goodsService;

    /**
     * 跳转到注册界面
     * @return
     */
    @RequestMapping("/register")
    public String register(){
        return "system/register";
    }

    /**
     * 跳转到首页
     * @return
     */
    @RequestMapping("/index")
    public String index(){
        return "system/index";
    }
    /**
     * 跳转到普通登录界面
     * @return
     */
    @RequestMapping("/login")
    public String login(){
        return "system/login";
    }

    /**
     * 跳转到短信验证登录界面
     * @return
     */
    @RequestMapping("/login_sms")
    public String login_sms(){
        return "system/login_sms";
    }

    /**
     * 前往后台登录
     */
    @RequestMapping("/toBackStageLogin")
    public String toBackStageLogin(){
        return "backstage/login";
    }
    /**
     * 进入后台面板
     */
    @RequestMapping("/toBackStage")
    public String toBackStage(){
        return "backstage/backstage";
    }

    @RequestMapping("/toHome")
    public ModelAndView toHome(@RequestParam(value = "username") String username,
                               @RequestParam(value = "currentPage") int currentPage){
        ModelAndView modelAndView = new ModelAndView();
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

    @RequestMapping("/toOrderList")
    public ModelAndView toPay(@RequestParam(value = "username") String username,
                              @RequestParam(value = "order_status") int order_status,
                              @RequestParam(value = "currentPage") int currentPage){
        ModelAndView modelAndView = new ModelAndView();
        if(username == null || username == ""){
            modelAndView.setViewName("system/login");
            return modelAndView;
        }
        //查询所有订单信息，封装对象
        List<Order> allOrderByAddressId = payService.findAllOrderByStatus(registerService.findUserByUsername(username).getAddress().getAddress_id(),order_status);
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
        if(order_status == 0){
            modelAndView.setViewName("home/home_order_pay");
            return modelAndView;
        }else if(order_status == 1){
            modelAndView.setViewName("home/home_order_send");
            return modelAndView;
        }else{
            modelAndView.setViewName("home/home_order_receive");
            return modelAndView;
        }
    }

    @RequestMapping("/toOrderDetail")
    public ModelAndView toOrderDetail(@RequestParam(value = "orderNum") String orderNum){
        ModelAndView modelAndView = new ModelAndView();
        //查询出来再封装为toshow对象
        List<Order> orderByOrderNum = payService.findOrderByOrderNum(orderNum);
        List<OrderToShow> orderToShows = new ArrayList<OrderToShow>();
        String order_num = null;
        for (Order order : orderByOrderNum) {
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
        modelAndView.addObject("order",orderToShows.get(0));
        modelAndView.setViewName("home/home_order_detail");
        //计算订单总价格
        double totalPrice = 0;
        for (Order order : orderByOrderNum) {
            totalPrice += order.getPaid_amount();
        }
        modelAndView.addObject("totalPrice",totalPrice);
        return modelAndView;
    }

    @RequestMapping("/toAddress")
    public ModelAndView toAddress(@RequestParam(value = "username") String username){
        ModelAndView modelAndView = new ModelAndView();
        if(username == null || username == ""){
            modelAndView.setViewName("system/login");
            return modelAndView;
        }
        Address address = goodsService.findAddressByUserId(registerService.findUserByUsername(username).getUser_id());
        modelAndView.addObject("address",address);
        modelAndView.setViewName("home/home_address");
        return modelAndView;
    }

    /**
     * 前往正在开发界面
     * @return
     */
    @RequestMapping("/toDeveloping")
    public String toDeveloping(){
        return "error/developing";
    }
}
