package com.xiruisi.domain;

import java.util.List;

public class Page<T> {

    private int totalCount;//总记录数
    private int totalPage;//总页数
    private int currentPage;//当前页码
    private int pageSizes;//rows 每显示的条数
    private int startPage;//每次查询开始

    private List<T> list ;//每页显示的数据集合

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSizes() {
        return pageSizes;
    }

    public void setPageSizes(int pageSizes) {
        this.pageSizes = pageSizes;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    @Override
    public String toString() {
        return "Page{" +
                "totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", currentPage=" + currentPage +
                ", pageSizes=" + pageSizes +
                ", startPage=" + startPage +
                ", list=" + list +
                '}';
    }
}
