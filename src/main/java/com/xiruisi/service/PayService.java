package com.xiruisi.service;

import com.xiruisi.domain.Order;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

public interface PayService {

    /**
     * 保存一条订单信息
     * @param order
     */
    public void saveOrder(Order order);

    /**
     * 向订单表添加收货地址
     * @param address_id
     */
    public void addAddress(String orderNum,int address_id);

    /**
     * 根据订单号查询订单
     * @param orderNum
     * @return
     */
    public List<Order> findOrderByOrderNum(String orderNum);

    /**
     * 修改订单信息
     * @param order
     */
    public void updateOrder(Order order);

    /**
     * 删除订单
     * @param order_id
     * @return
     */
    public void deleteOrder(int order_id);


    /**
     * 根据收货地址查询所有订单
     * @param address_id
     * @return
     */
    public List<Order> findAllOrderByAddressId(int address_id);

    /**
     * 根据订单状态查询订单
     * @param address_id
     * @param order_status
     * @return
     */
    public List<Order> findAllOrderByStatus(int address_id,int order_status);

    /**
     * 根据Id查询订单
     * @param id
     * @return
     */
    public Order findOrderById(int id);
}
