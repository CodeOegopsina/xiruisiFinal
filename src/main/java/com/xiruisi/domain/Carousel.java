package com.xiruisi.domain;

import java.io.Serializable;

public class Carousel implements Serializable {

    private int c_id;
    private String c_img;

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getC_img() {
        return c_img;
    }

    public void setC_img(String c_img) {
        this.c_img = c_img;
    }

    @Override
    public String toString() {
        return "Carousel{" +
                "c_id=" + c_id +
                ", c_img='" + c_img + '\'' +
                '}';
    }
}
