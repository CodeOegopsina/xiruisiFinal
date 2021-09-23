package com.xiruisi.service.impl;

import com.xiruisi.dao.SystemDao;
import com.xiruisi.domain.Carousel;
import com.xiruisi.domain.Order;
import com.xiruisi.domain.Page;
import com.xiruisi.domain.Recommend;
import com.xiruisi.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SystemServiceImpl implements SystemService {

    @Autowired
    private SystemDao systemDao;


    @Override
    public void addCarousel(String image) {
        systemDao.addCarousel(image);
    }

    @Override
    public void updateCarousel(Carousel carousel) {
        systemDao.updateCarousel(carousel);
    }

    @Override
    public void deleteCarousel(List<Integer> ids) {
        systemDao.deleteCarousel(ids);
    }

    @Override
    public Carousel findCarouselById(int id) {
        return systemDao.findCarouselById(id);
    }

    @Override
    public Recommend findRecommendById(int id) {
        return systemDao.findRecommendById(id);
    }

    @Override
    public void updateRecommend(Recommend recommend) {
        systemDao.updateRecommend(recommend);
    }

    @Override
    public int getOrderCount(Map<String, Object> queryMap) {
        return systemDao.getOrderCount(queryMap);
    }

    @Override
    public List<Order> getOrderList(Map<String, Object> queryMap, Page page) {
        return systemDao.getOrderList(queryMap,page);
    }

    @Override
    public void deleteOrder(List<Integer> ids) {
        systemDao.deleteOrder(ids);
    }
}
