package com.xiruisi.service.impl;

import com.xiruisi.dao.RegisterDao;
import com.xiruisi.domain.Address;
import com.xiruisi.domain.Page;
import com.xiruisi.domain.User;
import com.xiruisi.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("registerService")
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterDao registerDao;

    @Override
    public User findUserByUsername(String username) {
        return registerDao.findUserByUsername(username);
    }

    @Override
    public User findUserByEmail(String email) {
        return registerDao.findUserByEmail(email);
    }

    @Override
    public User findUserByPhone(String phone) {
        return registerDao.findUserByPhone(phone);
    }

    @Override
    public void saveUser(User user) {
        registerDao.saveUser(user);
    }

    @Override
    public User findUserById(int user_id) {
        return registerDao.findUserById(user_id);
    }

    @Override
    public void saveAddress(Address address) {
        registerDao.saveAddress(address);
    }

    @Override
    public int getTotalUser() {
        return registerDao.getTotalUser();
    }

    @Override
    public List<User> getUserList(Page page,String username) {
        return registerDao.getUserList(page,username);
    }

    @Override
    public void deleteUser(List<Integer> ids) {
        registerDao.deleteUser(ids);
    }
}
