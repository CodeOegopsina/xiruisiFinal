package com.xiruisi.service.impl;

import com.xiruisi.dao.GoodsDao;
import com.xiruisi.domain.*;
import com.xiruisi.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsDao goodsDao;

    @Override
    public List<Cat> getCatList() {
        return goodsDao.getCatList();
    }

    @Override
    public int saveGoods(Goods goods) {
        return goodsDao.saveGoods(goods);
    }

    @Override
    public List<Goods> getGoodsList(Page<Goods> page,Map<String,Object> queryMap) {
        return goodsDao.getGoodsList(page,queryMap);
    }

    @Override
    public Goods findGoodsById(int goods_id) {
        return goodsDao.findGoodsById(goods_id);
    }

    @Override
    public List<Goods> findGoodsByCatId(int cat_id,Page<Goods> page) {
        return goodsDao.findGoodsByCatId(cat_id,page);
    }

    @Override
    public Cat findCatNameByCatId(int cat_id) {
        return goodsDao.findCatNameByCatId(cat_id);
    }

    @Override
    public int findGoodsTotal(Map<String,Object> queryMap) {
        return goodsDao.findGoodsTotal(queryMap);
    }

    @Override
    public int findGoodsTotalByCatId(int cat_id) {
        return goodsDao.findGoodsTotalByCatId(cat_id);
    }

    @Override
    public int updateGoods(Goods goods) {
        return goodsDao.updateGoods(goods);
    }

    @Override
    public void deleteGoods(List<Integer> ids) {
        goodsDao.deleteGoods(ids);
    }

    @Override
    public int addCart(int user_id, int goods_id) {
        return goodsDao.addCart(user_id,goods_id);
    }

    @Override
    public Cart findCartById(int goods_id,int user_id) {
        return goodsDao.findCartById(goods_id,user_id);
    }

    @Override
    public void updateCartNumber(int goods_id,int count) {
        goodsDao.updateCartNumber(goods_id,count);
    }

    @Override
    public List<Cart> findAllCart(int user_id) {
        return goodsDao.findAllCart(user_id);
    }

    @Override
    public void deleteCart(int goods_id,int user_id) {
        goodsDao.deleteCart(goods_id,user_id);
    }

    @Override
    public void updateCart(Cart cart) {
        goodsDao.updateCart(cart);
    }

    @Override
    public List<Cart> findAllChecked(int user_id) {
        return goodsDao.findAllChecked(user_id);
    }

    @Override
    public void saveAddress(Address address) {
        goodsDao.saveAddress(address);
    }

    @Override
    public Address findAddressByUserId(int user_id) {
        return goodsDao.findAddressByUserId(user_id);
    }

    @Override
    public void updateAddress(Address address) {
        goodsDao.updateAddress(address);
    }

    @Override
    public Address findAddressByAddressId(int address_id) {
        return goodsDao.findAddressByAddressId(address_id);
    }

    @Override
    public Address findAddressByRealName(String realName) {
        return goodsDao.findAddressByRealName(realName);
    }


    @Override
    public List<Collect> findAllCollect(int user_id, Page page) {
        return goodsDao.findAllCollect(user_id,page);
    }

    @Override
    public void collectGoods(int user_id, int goods_id) {
        goodsDao.collectGoods(user_id,goods_id);
    }

    @Override
    public Collect findCollectByGoodsIdAndUserId(int user_id, int goods_id) {
        return goodsDao.findCollectByGoodsIdAndUserId(user_id,goods_id);
    }

    @Override
    public void deleteCollect(int collect_id) {
        goodsDao.deleteCollect(collect_id);
    }

    @Override
    public int getTotalCollect(int user_id) {
        return goodsDao.getTotalCollect(user_id);
    }

    @Override
    public List<Goods> findByGoodsName(String goods_name,Page page) {
        return goodsDao.findByGoodsName(goods_name,page);
    }

    @Override
    public int getCountsByGoodsName(String goods_name) {
        return goodsDao.getCountsByGoodsName(goods_name);
    }

    @Override
    public List<Integer> getGuessLike() {
        return goodsDao.getGuessLike();
    }

    @Override
    public List<Carousel> getImage() {
        return goodsDao.getImage();
    }

    @Override
    public List<Recommend> getRecommond() {
        return goodsDao.getRecommond();
    }
}
