package com.xiruisi.dao;

import com.xiruisi.domain.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.w3c.dom.ls.LSInput;

import java.util.List;
import java.util.Map;

@Repository
public interface GoodsDao {

    /**
     * 查询商品分类信息
     * @return
     */
    public List<Cat> getCatList();

    /**
     * 添加商品
     * @param goods
     * @return
     */
    public int saveGoods(Goods goods);

    /**
     * 查询所有商品
     * @return
     */
    public List<Goods> getGoodsList(@Param("page") Page<Goods> page,@Param("queryMap") Map<String,Object> queryMap);

    /**
     * 根据id查询商品
     * @param goods_id
     * @return
     */
    public Goods findGoodsById(int goods_id);

    /**
     * 根据cat_id查询商品
     * @param cat_id
     * @return
     */
    public List<Goods> findGoodsByCatId(@Param("cat_id") int cat_id, @Param("page") Page<Goods> page);

    /**
     * 根据cat_id查询cat_name
     * @param cat_id
     * @return
     */
    public Cat findCatNameByCatId(int cat_id);

    /**
     * 查询商品条数(可以指定商品的cat_id)
     * @return
     */
    public int findGoodsTotal(Map<String,Object> queryMap);

    /**
     * 查询一类商品数量
     * @return
     */
    public int findGoodsTotalByCatId(int cat_id);

    /**
     * 修改商品信息
     * @param goods
     * @return
     */
    public int updateGoods(Goods goods);

    /**
     * 删除商品
     * @param ids
     */
    public void deleteGoods(List<Integer> ids);

    /**
     * 添加购物车
     * @param user_id
     * @param goods_id
     * @return
     */
    public int addCart(@Param("user_id") int user_id,@Param("goods_id") int goods_id);

    /**
     * 查询购物车有无goods_id商品
     */
    public Cart findCartById(@Param("goods_id") int goods_id,@Param("user_id") int user_id);

    /**
     * 修改商品数量
     */
    public void updateCartNumber(@Param("goods_id") int goods_id,@Param("count") int count);

    /**
     * 查询购物车商品
     * @return
     */
    public List<Cart> findAllCart(int user_id);

    /**
     * 删除购物车数据
     * @param goods_id
     */
    public void deleteCart(@Param("goods_id") int goods_id,@Param("user_id") int user_id);

    /**
     * 修改购物车属性
     */
    public void updateCart(Cart cart);

    /**
     * 根据购物车生成订单数组
     */
    public List<Cart> findAllChecked(int user_id);

    /**
     * 保存收货地址
     */
    public void saveAddress(Address address);

    /**
     * 修改收货地址
     * @param address
     */
    public void updateAddress(Address address);

    /**
     * 根据user_id 查询地址
     * @param user_id
     * @return
     */
    public Address findAddressByUserId(int user_id);

    /**
     * 根据address_id 查询地址
     * @param address_id
     * @return
     */
    public Address findAddressByAddressId(int address_id);

    /**
     * 根据realName 查询地址
     * @param realName
     * @return
     */
    public Address findAddressByRealName(String realName);

    /**
     * 查询指定用户收藏商品
     * @param user_id
     * @param page
     * @return
     */
    public List<Collect> findAllCollect(@Param("user_id") int user_id,@Param("page") Page page);

    /**
     * 收藏商品
     * @param user_id
     * @param goods_id
     */
    public void collectGoods(@Param("user_id") int user_id,@Param("goods_id") int goods_id);

    /**
     * 根据用户名和商品id查询收藏
     * @return
     */
    public Collect findCollectByGoodsIdAndUserId(@Param("user_id") int user_id,@Param("goods_id") int goods_id);

    /**
     * 根据collect_id删除收藏
     * @param collect_id
     */
    public void deleteCollect(int collect_id);

    /**
     * 获取某用户收藏所有商品
     * @param user_id
     * @return
     */
    public int getTotalCollect(int user_id);

    /**
     * 根据商品名模糊搜索
     * @param goods_name
     * @return
     */
    public List<Goods> findByGoodsName(@Param("goods_name") String goods_name,@Param("page") Page page);

    /**
     * 查询搜索商品的数量
     * @param goods_name
     * @return
     */
    public int getCountsByGoodsName(String goods_name);

    /**
     * 获取猜你喜欢商品信息
     * @return
     */
    public List<Integer> getGuessLike();

    /**
     * 获取轮播图数据
     * @return
     */
    public List<Carousel> getImage();

    /**
     * 获取推荐商品信息
     * @return
     */
    public List<Recommend> getRecommond();



}
