package com.xiruisi.controller;

import com.xiruisi.domain.User;
import com.xiruisi.service.RegisterService;
import com.zhenzi.sms.ZhenziSmsClient;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("all")
@Controller
@RequestMapping("register")
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    /**
     * 发送短信验证码
     * @param phoneNumber
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/sendSms")
    public @ResponseBody Map<String,String> sendSms(@RequestBody String phoneNumber, HttpServletRequest request) throws Exception {
        Map<String,String> res = new HashMap<String, String>();
        //生成随机验证码4位
        String captcha = RandomStringUtils.random(4,false,true);
        System.out.println(captcha);
        //发送到注册手机
        ZhenziSmsClient client = new ZhenziSmsClient("https://sms_developer.zhenzikj.com", "109428", "31684b62-bcfc-4f92-8956-e1ba0e16f402");
        String result = client.send(phoneNumber, "验证码: " + captcha + ",你正在注册喜瑞斯账号，验证码在5分钟内有效");
//        Map<String, Object> params = new HashMap<String, Object>();
//        params.put("phoneNumber",phoneNumber);
//        params.put("message", "验证码为: " + captcha);
//        String result = client.send(params);
        System.out.println(result);
        //验证码存入session
        request.getSession().setAttribute("captcha",captcha);
        //返回结果
        res.put("type","success");
        res.put("msg","发送成功");
        return res;
    }

    /**
     * 判断短信验证码是否正确
     * @param captcha
     * @param request
     * @return
     */
    @RequestMapping("/testSms")
    public @ResponseBody Map<String,String> testSms(@RequestBody String captcha,HttpServletRequest request){
        Map<String,String> res = new HashMap<String, String>();
        String right = (String) request.getSession().getAttribute("captcha");
        if(right == null){
            res.put("type","error");
            res.put("msg","验证码已失效，请重新发送");
            return res;
        }
        if(right.equals(captcha)){
            res.put("type","success");
            res.put("msg","验证成功");
            request.getSession().removeAttribute("captcha");
            return res;
        }else{
            res.put("type","error");
            res.put("msg","验证码错误");
            return res;
        }
    }

    /**
     * 用户名查重
     * @param username
     * @return
     */
    @RequestMapping("/checkUsername")
    public @ResponseBody Map<String,String> checkUsername(@RequestBody String username){
        Map<String,String> res = new HashMap<String, String>();
        if(registerService.findUserByUsername(username) != null){
            res.put("type","error");
            res.put("msg","用户名已被注册");
            return res;
        }
        res.put("type","success");
        res.put("msg","用户名可以用");
        return res;
    }

    /**
     * 邮箱查重
     * @param email
     * @return
     */
    @RequestMapping("/checkEmail")
    public @ResponseBody Map<String,String> checkEmail(@RequestBody String email){
        Map<String,String> res = new HashMap<String, String>();
        if(registerService.findUserByEmail(email) != null){
            res.put("type","error");
            res.put("msg","邮箱已被注册");
            return res;
        }
        res.put("type","success");
        res.put("msg","邮箱可以用");
        return res;
    }

    /**
     * 电话查重
     * @param phone
     * @return
     */
    @RequestMapping("/checkPhone")
    public @ResponseBody Map<String,String> checkPhone(@RequestBody String phone){
        Map<String,String> res = new HashMap<String, String>();
        if(registerService.findUserByPhone(phone) != null){
            res.put("type","error");
            res.put("msg","电话号码已被注册");
            return res;
        }
        res.put("type","success");
        res.put("msg","电话号码可以用");
        return res;
    }

    /**
     * 保存用户信息
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("/saveUser")
    public @ResponseBody Map<String,String> saveUser(@RequestBody User user,HttpServletRequest request){
        Map<String,String> res = new HashMap<String, String>();
        registerService.saveUser(user);
        res.put("type","success");
        res.put("msg","注册成功");
        request.getSession().removeAttribute("captcha");
        return res;
    }
}
