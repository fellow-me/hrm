package com.hrm.controller;

import com.hrm.entity.Staff;
import com.hrm.dto.ResponseDTO;
import com.hrm.service.LoginService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

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

    /**
     * 通过账号查找员工
     * @param code
     * @return
     */
    @GetMapping("/find")
    public ResponseDTO findByCode(String code){
        return this.loginService.findByCode(code);
    }


}
