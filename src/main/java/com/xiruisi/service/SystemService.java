package com.xiruisi.service;

import com.xiruisi.domain.Carousel;
import com.xiruisi.domain.Order;
import com.xiruisi.domain.Page;
import com.xiruisi.domain.Recommend;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SystemService {

    /**
     * 添加轮播图信息
     * @param image
     */
    public void addCarousel(String image);

    /**
     * 更新轮播图信息
     * @param carousel
     */
    public void updateCarousel(Carousel carousel);

    /**
     * 删除轮播图信息
     * @param ids
     */
    public void deleteCarousel(List<Integer> ids);

    /**
     * 根据id查找轮播图
     * @param id
     * @return
     */
    public Carousel findCarouselById(int id);

    /**
     * 根据id推荐商品
     * @param id
     * @return
     */
    public Recommend findRecommendById(int id);

    /**
     * 更新推荐信息
     * @param recommend
     */
    public void updateRecommend(Recommend recommend);

    /**
     * 获取订单总数
     * @param queryMap
     */
    public int getOrderCount(Map<String,Object> queryMap);

    /**
     * 分页查询订单
     * @param queryMap
     * @param page
     * @return
     */
    public List<Order> getOrderList(Map<String,Object> queryMap,Page page);

    /**
     * 删除订单
     * @param ids
     */
    public void deleteOrder(List<Integer> ids);

}
