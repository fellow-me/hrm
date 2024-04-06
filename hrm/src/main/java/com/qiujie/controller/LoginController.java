package com.qiujie.controller;

import com.qiujie.dto.Response;
import com.qiujie.entity.Staff;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.service.LoginService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 登录注册接口
 *
 * @Author : qiujie
 * @Date : 2022/1/30
 */
@RestController
public class LoginController {

    @Resource
    private LoginService loginService;

    @PostMapping("/login")
    public ResponseDTO login(@RequestBody Staff staff) {
        return this.loginService.login(staff);
    }


    @GetMapping("/hello")
    public ResponseDTO hello() {
        return Response.success("hello world!");
    }
}
