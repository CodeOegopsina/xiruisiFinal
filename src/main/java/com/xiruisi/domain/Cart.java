package com.xiruisi.domain;

/**
 * 购物车实体类
 */
public class Cart {

    private int cart_id;
    private User user;
    private Goods goods;
    private int number;
    private int isChecked;

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getIsChecked() {
        return isChecked;
    }

    public void setIsChecked(int isChecked) {
        this.isChecked = isChecked;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cart_id=" + cart_id +
                ", user=" + user +
                ", goods=" + goods +
                ", number=" + number +
                ", isChecked=" + isChecked +
                '}';
    }
}
