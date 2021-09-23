package com.xiruisi.controller;


import com.xiruisi.domain.*;
import com.xiruisi.service.GoodsService;
import com.xiruisi.service.PayService;
import com.xiruisi.service.RegisterService;
import com.xiruisi.util.SnowFlake;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.*;

@SuppressWarnings("all")
@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private RegisterService registerService;

    @Autowired
    private PayService payService;

    /**
     * 获取index需要加载的信息
     * @return
     */
    @RequestMapping("/catList")
    public ModelAndView getCatList(){
        ModelAndView modelAndView = new ModelAndView();
        /*加载商品分类信息*/
        List<Cat> getCatList = goodsService.getCatList();
        modelAndView.addObject("catList",getCatList);

        /*加载猜你喜欢信息*/
        List<Goods> guessLike = new ArrayList<Goods>();
        List<Integer> goodsIds = goodsService.getGuessLike();
        for (Integer goodsId : goodsIds) {
            guessLike.add(goodsService.findGoodsById(goodsId));
        }

        /*加载轮播图*/
        List<Carousel>  images = goodsService.getImage();

        modelAndView.addObject("image",images);
        modelAndView.addObject("likes",guessLike);
        modelAndView.setViewName("system/index");
        return modelAndView;
    }

    /**
     * 添加商品
     * @param goods
     * @return
     */
    @RequestMapping("/goodsAdd")
    public @ResponseBody Map<String,String> goodsAdd(@RequestBody Goods goods){
        Map<String,String> res = new HashMap<>();
        //直接保存 后期再添加数据检验
        if(goodsService.saveGoods(goods) == 1){
            res.put("type","success");
            res.put("msg","添加成功");
            return res;
        }
        res.put("type","error");
        res.put("msg","添加失败吗，请联系管理员");
        return res;
    }

    /**
     * 修改商品信息
     * @param goods
     * @return
     */
    @RequestMapping("/goodsUpdate")
    public @ResponseBody Map<String,String> goodsUpdate(@RequestBody Goods goods){
        Map<String,String> res = new HashMap<>();
        //直接修改 后期再添加数据检验
        goodsService.updateGoods(goods);
        res.put("type","success");
        res.put("msg","添加成功");
        return res;
    }

    /**
     * 删除
     * @param ids
     */
    @RequestMapping("/goodsDelete")
    public @ResponseBody Map<String,String> goodsDelete(@RequestBody List<Integer> ids){
        Map<String,String> res = new HashMap<>();
        //删除
        goodsService.deleteGoods(ids);
        res.put("type","success");
        res.put("msg","添加成功");
        return res;
    }


    /**
     * 商品详情页面
     * @param goods_id
     * @return
     */
    @RequestMapping("goodsDetail")
    public ModelAndView goods_detail(@RequestParam(value = "goods_id") int goods_id){
        ModelAndView modelAndView = new ModelAndView();
        //根据id查询商品
        Goods goods = goodsService.findGoodsById(goods_id);
        modelAndView.addObject("goods",goods);
        modelAndView.setViewName("system/goods_detail");
        return modelAndView;
    }

    /**
     * 商品列表页面
     */
    @RequestMapping("goodsList")
    public ModelAndView goods_list(@RequestParam(value = "cat_id") int cat_id,
                                   @RequestParam(value = "currentPage") int currentPage){
        ModelAndView modelAndView = new ModelAndView();
        //设置分页内容
        Page<Goods> page = new Page<Goods>();
        page.setCurrentPage(currentPage);
        //查询该类商品总条数
        int totalCount = goodsService.findGoodsTotalByCatId(cat_id);
        page.setTotalCount(totalCount);
        int pageSizes = 12;
        page.setPageSizes(pageSizes);
        page.setTotalPage(totalCount/pageSizes==0?totalCount/pageSizes:totalCount/pageSizes+1);
        page.setStartPage((currentPage-1)*pageSizes);
        //根据cat_id查询商品
        List<Goods> goodsByCatId = goodsService.findGoodsByCatId(cat_id,page);
        page.setList(goodsByCatId);
        modelAndView.addObject("page",page);
        modelAndView.addObject("goodsByCatId",goodsByCatId);
        modelAndView.addObject("cat",goodsService.findCatNameByCatId(cat_id));
        modelAndView.setViewName("system/goods_list");
        return modelAndView;
    }

    /**
     * 添加商品到购物车
     * @param userName
     * @param goods_id
     * @return
     */
    @RequestMapping("/addCart")
    public ModelAndView addCart(@RequestParam(value = "userName") String userName,
                          @RequestParam(value = "goods_id") int goods_id){
        ModelAndView modelAndView = new ModelAndView();
        if(StringUtils.isEmpty(userName)){
            modelAndView.setViewName("system/login");
            return modelAndView;
        }
        //根据userName 查到id
        int user_id = registerService.findUserByUsername(userName).getUser_id();
        //根据商品id查询商品
        Goods goodsById = goodsService.findGoodsById(goods_id);
        modelAndView.addObject("goods",goodsById);
        modelAndView.setViewName("system/success_cart");
        //判断购物车中有没有这个商品，有的话数量加1
        Cart cartById = goodsService.findCartById(goods_id,user_id);
        if(cartById != null){
            //修改数量为+1 goods_id
            goodsService.updateCartNumber(goods_id,1);
            return modelAndView;
        }
        //默认选中，默认数量为1 加入购物车
        int result = goodsService.addCart(user_id, goods_id);
        return modelAndView;
    }

    /**
     * 跳转购物车界面
     * @return
     */
    @RequestMapping("/toCart")
    public ModelAndView toCart(@RequestParam(value = "username") String username){
        ModelAndView modelAndView = new ModelAndView();
        if(StringUtils.isEmpty(username)){
            modelAndView.setViewName("system/login");
            return modelAndView;
        }
        //查询所有购物车信息
        List<Cart> allCart = goodsService.findAllCart(registerService.findUserByUsername(username).getUser_id());
        modelAndView.addObject("cart",allCart);
        modelAndView.setViewName("system/cart");
        return modelAndView;
    }

    /**
     * 购物车数量+1操作
     * @param //当前商品数量
     * @return
     */
    @RequestMapping("/cartNumberPlus")
    public ModelAndView cartNumberPlus(@RequestParam(value = "goods_id") int goods_id,
                                       @RequestParam(value = "username") String username){
        ModelAndView modelAndView = new ModelAndView();
        goodsService.updateCartNumber(goods_id,1);
        getCart(modelAndView,registerService.findUserByUsername(username).getUser_id());
        return modelAndView;
    }

    //封装查询购物车方法
    void getCart(ModelAndView modelAndView,int user_id){
        List<Cart> allCart = goodsService.findAllCart(user_id);
        modelAndView.addObject("cart",allCart);
        modelAndView.setViewName("system/cart");
    }

    /**
     * 商品数量+1
     * @param goods_id
     * @return
     */
    @RequestMapping("/cartNumberMin")
    public ModelAndView cartNumberMin(@RequestParam(value = "goods_id") int goods_id,
                                      @RequestParam(value = "username") String username){
        ModelAndView modelAndView = new ModelAndView();
        //判断为0调用删除方法
        Cart cartById = goodsService.findCartById(goods_id,registerService.findUserByUsername(username).getUser_id());
        if(cartById.getNumber() == 1){
            //调用删除方法
            goodsService.deleteCart(goods_id,registerService.findUserByUsername(username).getUser_id());
            getCart(modelAndView,registerService.findUserByUsername(username).getUser_id());
            return modelAndView;
        }
        goodsService.updateCartNumber(goods_id,-1);
        getCart(modelAndView,registerService.findUserByUsername(username).getUser_id());
        return modelAndView;
    }

    /**
     * 商品数量-1
     * @param goods_id
     * @return
     */
    @RequestMapping("/deleteCart")
    public ModelAndView deleteCart(@RequestParam(value = "goods_id") int goods_id,
                                   @RequestParam(value = "username") String username){
        ModelAndView modelAndView = new ModelAndView();
        goodsService.deleteCart(goods_id,registerService.findUserByUsername(username).getUser_id());
        getCart(modelAndView,registerService.findUserByUsername(username).getUser_id());
        return modelAndView;
    }

    /**
     * 获取订单商品列表
     * @param goods_id
     * @return
     */
    @RequestMapping("/isChecked")
    public @ResponseBody Map<String,Object> isChecked(@RequestParam(value = "goods_id") int goods_id,
                                                      @RequestParam(value = "username") String username){
        Map<String,Object> res = new HashMap<String, Object>();
        Cart cartById = goodsService.findCartById(goods_id,registerService.findUserByUsername(username).getUser_id());
        if(cartById.getIsChecked() == 1){
            cartById.setIsChecked(0);
        }else{
            cartById.setIsChecked(1);
        }
        //修改cart
        goodsService.updateCart(cartById);
        //计算修改后的总价
        List<Cart> allChecked = goodsService.findAllChecked(registerService.findUserByUsername(username).getUser_id());
        double totalPrice = 0;
        for (Cart cart : allChecked) {
            totalPrice += cart.getGoods().getGoods_price() * cart.getNumber();
        }
        res.put("totalPrice",totalPrice);
        res.put("type","success");
        return res;
    }

    /**
     * 跳转订单界面
     * @return
     */
    @RequestMapping("/getOrder")
    public ModelAndView getOrder(@RequestParam(value = "username") String username){
        ModelAndView modelAndView = new ModelAndView();
        //选择商品数据
        List<Cart> allChecked = goodsService.findAllChecked(registerService.findUserByUsername(username).getUser_id());
        modelAndView.addObject("goods",allChecked);
        modelAndView.setViewName("system/getOrder");
        //计算总数和总价格
        int totalNum = 0;
        double totalPrice = 0;
        Order order = new Order();
        //生成订单号
        SnowFlake snowFlake = new SnowFlake(1, 1);
        String order_num = String.valueOf(snowFlake.nextId());
        //保存商品id list
        for (Cart cart : allChecked) {
            //在数据库订单表添加数据
            //需要支付和实际支付
            double order_amount = cart.getGoods().getGoods_price() * cart.getNumber();
            Goods goods = cart.getGoods();
            int buy_counts = cart.getNumber();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String create_time = sdf.format(new Date());
            order.setOrder_num(order_num);
            order.setOrder_amount(order_amount);
            order.setPaid_amount(order_amount);
            order.setGoods(goods);
            order.setBuy_counts(buy_counts);
            order.setCreate_time(create_time);
            //持久化到数据库
            payService.saveOrder(order);
            totalNum += cart.getNumber();
            totalPrice += cart.getGoods().getGoods_price() * cart.getNumber();
            //删除购物车信息
        }
        modelAndView.addObject("totalNum",totalNum);
        modelAndView.addObject("totalPrice",totalPrice);
        modelAndView.addObject("orderNum",order_num);
        //user_id查询收货地址
        Address addressByUserId = goodsService.findAddressByUserId(registerService.findUserByUsername(username).getUser_id());
        modelAndView.addObject("address",addressByUserId);
        return modelAndView;
    }

    @RequestMapping("/saveAddress")
    public @ResponseBody Map<String,String> saveAddress(@RequestParam(value = "username") String username,
                                          @RequestParam(value = "realName") String realName,
                                          @RequestParam(value = "address") String address,
                                          @RequestParam(value = "phone") String phone){
        Map<String,String> res = new HashMap<String, String>();
        //根据username查询id
        int user_id = registerService.findUserByUsername(username).getUser_id();
        //判断该用户有无收货地址
        Address addressByUserId = goodsService.findAddressByUserId(user_id);
        Address address1 = new Address();
        address1.setUser_id(user_id);
        address1.setAddress(address);
        address1.setPhone(phone);
        address1.setRealName(realName);
        if(addressByUserId != null){
            //走修改流程
            goodsService.updateAddress(address1);
            //在user表里也修改数据
            registerService.saveAddress(goodsService.findAddressByUserId(user_id));
            res.put("type","success");
            res.put("msg","修改收货地址成功");
            return res;
        }
        //将详细保存到数据库
        goodsService.saveAddress(address1);
        //在user表中也修改数据
        registerService.saveAddress(goodsService.findAddressByUserId(user_id));
        res.put("type","success");
        res.put("msg","添加收货地址成功");
        return res;
    }


    /*收藏相关操作*/

    @RequestMapping("/collectGoods")
    public @ResponseBody Map<String,String> collectGoods(@RequestParam(value = "goods_id") int goods_id,
                                                         @RequestParam(value = "username") String username){
        Map<String,String> res = new HashMap<String, String>();
        //查询有无该商品
        Collect collectByGoodsIdAndUserId = goodsService.findCollectByGoodsIdAndUserId(registerService.findUserByUsername(username).getUser_id(), goods_id);
        if(collectByGoodsIdAndUserId == null){
            //无 添加 返回
            goodsService.collectGoods(registerService.findUserByUsername(username).getUser_id(),goods_id);
            res.put("msg","添加成功");
            return res;
        }
        //有 直接返回
        res.put("msg","商品已经在你的收藏中");
        return res;
    }

    @RequestMapping("/toCollect")
    public ModelAndView toCollect(@RequestParam(value = "username") String username,
                                           @RequestParam(value = "currentPage") int currentPage){
        ModelAndView modelAndView = new ModelAndView();
        Page<Collect> page = new Page<>();
        int totalCount = goodsService.getTotalCollect(registerService.findUserByUsername(username).getUser_id());
        page.setTotalCount(totalCount);
        int pageSizes = 8;
        page.setPageSizes(pageSizes);
        int totalPage = totalCount%pageSizes == 0 ? totalCount/pageSizes: totalCount/pageSizes + 1;
        page.setTotalPage(totalPage);
        page.setCurrentPage(currentPage);
        int startPage = (currentPage - 1) * pageSizes;
        page.setStartPage(startPage);
        List<Collect> allCollect = goodsService.findAllCollect(registerService.findUserByUsername(username).getUser_id(), page);
        page.setList(allCollect);
        modelAndView.addObject("page",page);
        modelAndView.setViewName("home/home_collect");
        return modelAndView;
    }

    @RequestMapping("/deleteCollect")
    public ModelAndView deleteCollect(@RequestParam(value = "goods_id") int goods_id,
                                @RequestParam(value = "username") String username,
                                      @RequestParam(value = "currentPage") int currentPage){
        goodsService.deleteCollect(goodsService.findCollectByGoodsIdAndUserId(registerService.findUserByUsername(username).getUser_id(),goods_id).getCollect_id());
        ModelAndView modelAndView = new ModelAndView();
        Page<Collect> page = new Page<>();
        int totalCount = goodsService.getTotalCollect(registerService.findUserByUsername(username).getUser_id());
        page.setTotalCount(totalCount);
        int pageSizes = 8;
        page.setPageSizes(pageSizes);
        int totalPage = totalCount%pageSizes == 0 ? totalCount/pageSizes: totalCount/pageSizes + 1;
        page.setTotalPage(totalPage);
        page.setCurrentPage(currentPage);
        int startPage = (currentPage - 1) * pageSizes;
        page.setStartPage(startPage);
        List<Collect> allCollect = goodsService.findAllCollect(registerService.findUserByUsername(username).getUser_id(), page);
        page.setList(allCollect);
        modelAndView.addObject("page",page);
        modelAndView.setViewName("home/home_collect");
        return modelAndView;
    }

    @RequestMapping("/searchGoods")
    public ModelAndView searchGoods(@RequestParam(value = "goods_name") String goods_name,
                                    @RequestParam(value = "currentPage") int currentPage){
        ModelAndView modelAndView = new ModelAndView();
        Page<Goods> page = new Page<>();
        int totalCount = goodsService.getCountsByGoodsName("%"+goods_name+"%");
        page.setTotalCount(totalCount);
        int pageSizes = 8;
        page.setPageSizes(pageSizes);
        int totalPage = totalCount%pageSizes == 0?totalCount/pageSizes:totalCount/pageSizes + 1;
        page.setTotalPage(totalPage);
        page.setCurrentPage(currentPage);
        int startPage = (currentPage - 1) * pageSizes;
        page.setStartPage(startPage);
        List<Goods> goods = goodsService.findByGoodsName("%"+goods_name+"%",page);
        page.setList(goods);
        modelAndView.addObject("page",page);
        modelAndView.setViewName("system/goods_search");
        modelAndView.addObject("searchName",goods_name);
        return modelAndView;
    }

}