package com.xiruisi.domain;

import java.io.Serializable;
import java.util.List;

/**
 * 订单实体类
 */
public class OrderToShow implements Serializable {

    private String order_num;
    private String paid_time;
    private List<Order> orders;


    public String getOrder_num() {
        return order_num;
    }

    public void setOrder_num(String order_num) {
        this.order_num = order_num;
    }

    public String getPaid_time() {
        return paid_time;
    }

    public void setPaid_time(String paid_time) {
        this.paid_time = paid_time;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    @Override
    public String toString() {
        return "OrderToShow{" +
                "order_num='" + order_num + '\'' +
                ", paid_time='" + paid_time + '\'' +
                ", orders=" + orders +
                '}';
    }
}
