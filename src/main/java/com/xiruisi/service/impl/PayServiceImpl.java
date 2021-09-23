package com.xiruisi.service.impl;

import com.xiruisi.dao.PayDao;
import com.xiruisi.domain.Order;
import com.xiruisi.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Service("payService")
public class PayServiceImpl implements PayService {

    @Autowired
    private PayDao payDao;

    @Override
    public void saveOrder(Order order) {
        payDao.saveOrder(order);
    }

    @Override
    public void addAddress(String orderNum,int address_id) {
        payDao.addAddress(orderNum,address_id);
    }

    @Override
    public List<Order> findOrderByOrderNum(String orderNum) {
        return payDao.findOrderByOrderNum(orderNum);
    }

    @Override
    public void updateOrder(Order order) {
        payDao.updateOrder(order);
    }

    @Override
    public void deleteOrder(int order_id) {
        payDao.deleteOrder(order_id);
    }

    @Override
    public List<Order> findAllOrderByAddressId(int address_id) {
        return payDao.findAllOrderByAddressId(address_id);
    }

    @Override
    public List<Order> findAllOrderByStatus(int address_id, int order_status) {
        return payDao.findAllOrderByStatus(address_id,order_status);
    }

    @Override
    public Order findOrderById(int id) {
        return payDao.findOrderById(id);
    }
}
