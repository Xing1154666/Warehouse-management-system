package com.mmm.xyl.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mmm.xyl.entity.Admin;
import com.mmm.xyl.service.AdminService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author testjava
 * @since 2022-03-17
 */
@Controller
@RequestMapping("/xyl/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @ApiOperation("用户登录入口")
    @GetMapping("/login")
    public String login(
            @RequestParam("in_be") String account,
            @RequestParam("pass") String password,
            HttpServletRequest request
    ){
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("account",account).eq("password",password);
        Admin admin = adminService.getOne(queryWrapper);
        if (admin!=null){
            request.getSession().setAttribute("admin", admin);
            return "/AFirstLog.jsp";
        }
       return "/AloginFail.html";
    }

    @ApiOperation("用户注册入口")
    @PostMapping("/areGisTer")
    public String areGisTerUserName(HttpServletRequest request){
        String  account = request.getParameter("userid");
        String  password = request.getParameter("password");
        String  name = request.getParameter("name");
        String  sex = request.getParameter("sex");
        String  age = request.getParameter("age");
        String  phone = request.getParameter("phone");
        String  email = request.getParameter("email");
        String  address = request.getParameter("address");
        Admin admin = new Admin();
        admin.setAccount(account);
        admin.setPassword(password);
        admin.setName(name);
        admin.setSex(sex);
        admin.setAge(age);
        admin.setPhone(phone);
        admin.setEmail(email);
        admin.setAddress(address);
        QueryWrapper<Admin> queryWrapper = new QueryWrapper();
        queryWrapper.eq("account",account);
        Admin selectAdmin = adminService.getOne(queryWrapper);
        if (selectAdmin!=null){
            return "/AregisterFail.jsp";
        }else {
            adminService.save(admin);
            return "/ARsucess.jsp";
        }
    }

    @ApiOperation("修改用户信息功能")
    @PostMapping("/updateUser")
    public String updateUser(HttpServletRequest request){
        String  account = request.getParameter("userid");
        String  password = request.getParameter("password");
        String  name = request.getParameter("name");
        String  sex = request.getParameter("sex");
        String  age = request.getParameter("age");
        String  phone = request.getParameter("phone");
        String  email = request.getParameter("email");
        String  address = request.getParameter("address");
        Admin admin = new Admin();
        admin.setAccount(account);
        admin.setPassword(password);
        admin.setName(name);
        admin.setSex(sex);
        admin.setAge(age);
        admin.setPhone(phone);
        admin.setEmail(email);
        admin.setAddress(address);

        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("account",account);
        adminService.update(admin, queryWrapper);
        request.getSession().setAttribute("admin",admin);
        return "/AInf.jsp";
    }
}

