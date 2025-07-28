package com.qiujie.controller;

import com.qiujie.entity.Staff;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.service.LoginService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * 登录注册接口
 *
 * @Author : qiujie
 * @Date : 2022/1/30
 */
@RestController
public class LoginController {

    @Autowired
    private LoginService loginService;

    @PostMapping("/login/{validateCode}")
    public ResponseDTO login(@RequestBody Staff staff, @PathVariable String validateCode) {
        return this.loginService.login(staff, validateCode);
    }

    @GetMapping("/validate/code")
    public void getValidateCode(HttpServletResponse response) throws IOException {
        this.loginService.getValidateCode(response);
    }
}
