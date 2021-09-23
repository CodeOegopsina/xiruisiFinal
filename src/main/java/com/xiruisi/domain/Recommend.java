package com.xiruisi.domain;

import java.io.Serializable;

public class Recommend implements Serializable {

    private int id;
    private int goods_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
    }

    @Override
    public String toString() {
        return "Recommend{" +
                "id=" + id +
                ", goods_id=" + goods_id +
                '}';
    }
}
