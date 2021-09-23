package com.xiruisi.service;

import com.xiruisi.domain.Address;
import com.xiruisi.domain.Page;
import com.xiruisi.domain.User;

import java.util.List;

public interface RegisterService {

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    public User findUserByUsername(String username);

    /**
     * 根据邮箱查询用户
     * @param email
     * @return
     */
    public User findUserByEmail(String email);

    /**
     * 根据电话查询用户
     * @param phone
     * @return
     */
    public User findUserByPhone(String phone);

    /**
     * 保存用户注册信息
     * @param user
     */
    public void saveUser(User user);

    /**
     * 根据id查询用户名
     * @param user_id
     * @return
     */
    public User findUserById(int user_id);

    /**
     * 向用户添加收货地址
     * @param address
     */
    public void saveAddress(Address address);

    /**
     * 获取用户总条数
     * @return
     */
    public int getTotalUser();

    /**
     * 获取所有用户信息列表(需实现分页)
     * @return
     */

    public List<User> getUserList(Page page,String username);

    /**
     * 删除用户
     * @param ids
     */
    public void deleteUser(List<Integer> ids);
}
