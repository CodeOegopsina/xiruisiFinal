package com.xiruisi.domain;

import java.io.Serializable;

/**
 * 商品分类对应实体类
 */
public class Cat implements Serializable {

    private String cat_id;
    private String cat_name;

    public String getCat_id() {
        return cat_id;
    }

    public void setCat_id(String cat_id) {
        this.cat_id = cat_id;
    }

    public String getCat_name() {
        return cat_name;
    }

    public void setCat_name(String cat_name) {
        this.cat_name = cat_name;
    }

    @Override
    public String toString() {
        return "Cat{" +
                "cat_id='" + cat_id + '\'' +
                ", cat_name='" + cat_name + '\'' +
                '}';
    }
}
