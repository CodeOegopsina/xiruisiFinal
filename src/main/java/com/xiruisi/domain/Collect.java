package com.xiruisi.domain;

import java.io.Serializable;

public class Collect implements Serializable {

    private int collect_id;
    private User user;
    private Goods goods;

    public int getCollect_id() {
        return collect_id;
    }

    public void setCollect_id(int collect_id) {
        this.collect_id = collect_id;
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

    @Override
    public String toString() {
        return "Collect{" +
                "collect_id=" + collect_id +
                ", user=" + user +
                ", goods=" + goods +
                '}';
    }
}
