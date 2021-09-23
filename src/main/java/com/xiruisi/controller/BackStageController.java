package com.xiruisi.controller;

import com.xiruisi.domain.*;
import com.xiruisi.service.GoodsService;
import com.xiruisi.service.PayService;
import com.xiruisi.service.RegisterService;
import com.xiruisi.service.SystemService;
import com.xiruisi.util.SnowFlake;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("all")
@Controller
@RequestMapping("/backStage")
public class BackStageController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private RegisterService registerService;

    @Autowired
    private SystemService systemService;

    @Autowired
    private PayService payService;

    /**
     * 显示欢迎界面
     * @return
     */
    @RequestMapping("/welcome")
    public String welcome(){
        return "backstage/welcome";
    }

    /**
     * 显示商品详情
     * @return
     */
    @RequestMapping("/goods_detail")
    public ModelAndView goodsList(@RequestParam(value = "pageSizes") int pageSizes,
                                  @RequestParam(value = "currentPage") int currentPage,
                                  @RequestParam(value = "goods_name",defaultValue = "") String goods_name,
                                  @RequestParam(value = "cat_id",defaultValue = "") String cat_id){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("backstage/goods_detail_crud");
        Map<String,Object> queryMap = new HashMap<String, Object>();
        queryMap.put("goods_name","%"+goods_name+"%");
        queryMap.put("cat_id",cat_id == ""?0:cat_id);
        //查询商品记录数
        int totalCount = goodsService.findGoodsTotal(queryMap);
        //设置分页插件
        Page<Goods> page = new Page<Goods>();
        page.setPageSizes(pageSizes);
        page.setCurrentPage(currentPage);
        page.setTotalCount(totalCount);
        int totalPage = totalCount%pageSizes == 0 ? totalCount/pageSizes : totalCount/pageSizes+1;
        page.setTotalPage(totalPage);
        //计算开始的页数
        int startPage = (currentPage-1) * pageSizes;
        page.setStartPage(startPage);
        List<Goods> goodsList = goodsService.getGoodsList(page,queryMap);
        page.setList(goodsList);
        modelAndView.addObject("goodsList",goodsList);
        modelAndView.addObject("page",page);
        modelAndView.addObject("goods_name",goods_name);
        modelAndView.addObject("cat_id",cat_id);
        return modelAndView;
    }

    /**
     * 商品添加界面显示
     * @return
     */
    @RequestMapping("/goods_add")
    public String goods_add(){
        return "backstage/goods/goods_add";
    }

    /**
     * 商品修改界面显示
     * @return
     */
    @RequestMapping("/goods_update")
    public ModelAndView goods_update(@RequestParam(value = "goods_id") int goods_id){
        ModelAndView modelAndView = new ModelAndView();
        //根据id查询商品信息
        Goods goodsById = goodsService.findGoodsById(goods_id);
        modelAndView.addObject("goods",goodsById);
        modelAndView.setViewName("backstage/goods/goods_update");
        return modelAndView;
    }

    /**
     * 查询用户信息
     * @param pageSizes
     * @param currentPage
     * @param searchName
     * @return
     */
    @RequestMapping("/user_detail")
    public ModelAndView userList(@RequestParam(value = "pageSizes") int pageSizes,
                                 @RequestParam(value = "currentPage") int currentPage,
                                 @RequestParam(value = "username",defaultValue = "") String searchName){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("backstage/user/user");
        //查询用户总条数
        int totalCount =registerService.getTotalUser();
        //设置分页插件
        Page page = new Page();
        page.setTotalCount(totalCount);
        page.setCurrentPage(currentPage);
        page.setPageSizes(pageSizes);
        int totalPage = totalCount % pageSizes == 0 ? totalCount/pageSizes : totalCount/pageSizes + 1;
        page.setTotalPage(totalPage);
        int startPage = (currentPage - 1) * pageSizes;
        page.setStartPage(startPage);
        List<User> userList = registerService.getUserList(page,"%"+searchName+"%");
        page.setList(userList);
        modelAndView.addObject("page",page);
        return modelAndView;
    }

    /**
     * 查询轮播图信息
     * @return
     */
    @RequestMapping("/carousel_detail")
    public ModelAndView carouselList(){
        ModelAndView modelAndView = new ModelAndView();
        //查询轮播图信息
        List<Carousel> carousels = goodsService.getImage();
        modelAndView.addObject("carousels",carousels);
        modelAndView.setViewName("backstage/indexSetting/carousel");
        return modelAndView;
    }

    /**
     * 跳转轮播图添加界面
     * @return
     */
    @RequestMapping("/carouselAdd")
    public String carouselAdd(){
        return "backstage/indexSetting/carousel_add";
    }

    /**
     * 添加轮播图信息
     * @param image
     * @return
     */
    @RequestMapping("/carousel_add")
    public @ResponseBody Map<String,String> carousel_add(@RequestParam(value = "image") String image){
        Map<String,String> res = new HashMap<String, String>();
        //调用service完成添加
        systemService.addCarousel(image);
        res.put("type","success");
        res.put("msg","轮播图信息添加成功");
        return res;
    }

    /**
     * 删除轮播图信息
     */
    @RequestMapping("/carousel_delete")
    public @ResponseBody Map<String,String> carousel_delete(@RequestBody List<Integer> ids){
        Map<String,String> res = new HashMap<String, String>();
        //调用service完成删除
        systemService.deleteCarousel(ids);
        res.put("type","success");
        res.put("msg","轮播图信息删除成功");
        return res;
    }

    /**
     * 跳转轮播图修改界面
     * @param id
     * @return
     */
    @RequestMapping("/carouselUpdate")
    public ModelAndView carouselUpdate(@RequestParam(value = "id") int id){
        ModelAndView modelAndView = new ModelAndView();
        Carousel carouselById = systemService.findCarouselById(id);
        modelAndView.addObject("carousel",carouselById);
        modelAndView.setViewName("backstage/indexSetting/carousel_update");
        return modelAndView;
    }

    /**
     * 修改轮播图
     * @param carousel
     * @return
     */
    @RequestMapping("/carousel_update")
    public @ResponseBody Map<String,String> carouselUpdate(@RequestBody Carousel carousel){
        Map<String,String> res = new HashMap<>();
        //直接修改 后期再添加数据检验
        systemService.updateCarousel(carousel);
        res.put("type","success");
        res.put("msg","添加成功");
        return res;
    }

    /**
     * 跳转推荐修改界面
     * @param id
     * @return
     */
    @RequestMapping("/recommendUpdate")
    public ModelAndView recommendUpdate(@RequestParam(value = "id") int id){
        ModelAndView modelAndView = new ModelAndView();
        Recommend recommendById = systemService.findRecommendById(id);
        modelAndView.addObject("recommend",recommendById);
        modelAndView.setViewName("backstage/indexSetting/recommend_update");
        return modelAndView;
    }

    /**
     * 修改推荐
     * @param carousel
     * @return
     */
    @RequestMapping("/recommend_update")
    public @ResponseBody Map<String,String> recommendUpdate(@RequestBody Recommend recommend){
        Map<String,String> res = new HashMap<>();
        //直接修改 后期再添加数据检验
        systemService.updateRecommend(recommend);
        res.put("type","success");
        res.put("msg","修改成功");
        return res;
    }

    /**
     * 查询推荐信息
     * @return
     */
    @RequestMapping("/recommond_detail")
    public ModelAndView recommendList(){
        ModelAndView modelAndView = new ModelAndView();
        //查询推荐信息
        List<Recommend> recommond = goodsService.getRecommond();
        modelAndView.addObject("recommend",recommond);
        modelAndView.setViewName("backstage/indexSetting/recommond");
        return modelAndView;
    }


    @RequestMapping("/getOrderList")
    public ModelAndView getOrderList(@RequestParam(value = "order_status") int order_status,
                                    @RequestParam(value = "order_num",defaultValue = "") String order_num,
                                    @RequestParam(value = "realName",defaultValue = "") String realName,
                                    @RequestParam(value = "currentPage") int currentPage,
                                    @RequestParam(value = "pageSizes") int pageSizes
                                    ){

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("order_num",order_num);
        modelAndView.addObject("realName",realName);
        Map<String,Object> queryMap  = new HashMap<String, Object>();
        queryMap.put("order_num",order_num);
        //根据真实姓名查询地址id
        System.out.println(realName);
        if(realName.length() != 0){
            int address_id = goodsService.findAddressByRealName(realName).getAddress_id();
            queryMap.put("address_id",address_id);
        }else{
            queryMap.put("address_id",0);
        }
        queryMap.put("order_status",order_status);
        //设置分页参数
        Page page = new Page();
        page.setCurrentPage(currentPage);
        page.setPageSizes(pageSizes);
        int totaoCount = systemService.getOrderCount(queryMap);
        page.setTotalCount(totaoCount);
        int totalPage = totaoCount%pageSizes == 0? totaoCount/pageSizes : totaoCount/pageSizes + 1;
        page.setTotalPage(totalPage);
        int startpage = (currentPage - 1) * pageSizes;
        page.setStartPage(startpage);
        List<Order> orderList = systemService.getOrderList(queryMap,page);
        page.setList(orderList);

        modelAndView.addObject("page",page);
        if(order_status == 0){
            modelAndView.setViewName("backstage/order/pay");
        }else if(order_status == 1){
            modelAndView.setViewName("backstage/order/send");
        }else if(order_status == 2){
            modelAndView.setViewName("backstage/order/receive");
        }else{
            modelAndView.setViewName("backstage/order/success");
        }
        return modelAndView;
    }

    /**
     * 删除订单
     * @param ids
     */
    @RequestMapping("/orderDelete")
    public @ResponseBody Map<String,String> orderDelete(@RequestBody List<Integer> ids){
        Map<String,String> res = new HashMap<>();
        //删除
        systemService.deleteOrder(ids);
        res.put("type","success");
        res.put("msg","删除成功");
        return res;
    }

    /**
     * 跳转发货弹窗
     * @return
     */
    @RequestMapping("/send")
    public ModelAndView send(@RequestParam(value = "ids") int ids){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("backstage/order/send_send");
        Order orderById = payService.findOrderById(ids);
        modelAndView.addObject("order",orderById);
        //随机生成物流号
        SnowFlake snowFlake = new SnowFlake(1, 1);
        String logistics_id = String.valueOf(snowFlake.nextId());
        //现在的时间转为字符串
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String now_time = sdf.format(new Date());
        modelAndView.addObject("now",now_time);
        modelAndView.addObject("logistics_id",logistics_id);
        return modelAndView;
    }

    @RequestMapping("/sendOrder")
    public @ResponseBody Map<String,String> sendOrder(@RequestParam(value = "id") int id){
        Map<String,String> res = new HashMap<>();
        //直接修改 后期再添加数据检验
        Order orderById = payService.findOrderById(id);
        orderById.setOrder_status(2);
        payService.updateOrder(orderById);
        res.put("type","success");
        res.put("msg","发货成功");
        return res;
    }

}
