package com.xiruisi.domain;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

/**
 * 订单实体类
 */
public class Order implements Serializable {

    private int id;
    private String order_num;
    private int order_status;
    private double order_amount;
    private double paid_amount;
    private Goods goods;
    private int buy_counts;
    private String create_time;
    private String paid_time;
    Address address;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrder_num() {
        return order_num;
    }

    public void setOrder_num(String order_num) {
        this.order_num = order_num;
    }

    public int getOrder_status() {
        return order_status;
    }

    public void setOrder_status(int order_status) {
        this.order_status = order_status;
    }

    public double getOrder_amount() {
        return order_amount;
    }

    public void setOrder_amount(double order_amount) {
        this.order_amount = order_amount;
    }

    public double getPaid_amount() {
        return paid_amount;
    }

    public void setPaid_amount(double paid_amount) {
        this.paid_amount = paid_amount;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public int getBuy_counts() {
        return buy_counts;
    }

    public void setBuy_counts(int buy_counts) {
        this.buy_counts = buy_counts;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getPaid_time() {
        return paid_time;
    }

    public void setPaid_time(String paid_time) {
        this.paid_time = paid_time;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", order_num='" + order_num + '\'' +
                ", order_status=" + order_status +
                ", order_amount=" + order_amount +
                ", paid_amount=" + paid_amount +
                ", goods=" + goods +
                ", buy_counts=" + buy_counts +
                ", create_time='" + create_time + '\'' +
                ", paid_time='" + paid_time + '\'' +
                ", address=" + address +
                '}';
    }
}
