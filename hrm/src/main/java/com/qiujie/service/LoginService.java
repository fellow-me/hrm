package com.qiujie.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qiujie.dto.Response;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.entity.Staff;
import com.qiujie.entity.StaffDetails;
import com.qiujie.mapper.StaffMapper;
import com.qiujie.util.JwtUtil;
import com.qiujie.vo.StaffDeptVO;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Author : qiujie
 * @Date : 2022/1/30
 */

@Service
public class LoginService extends ServiceImpl<StaffMapper, Staff> {

    @Resource
    private StaffMapper staffMapper;

    @Resource
    private AuthenticationManager authenticationManager;

    public ResponseDTO login(Staff staff) {
        // AuthenticationManager authenticationManager进行用户认证
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken =
                new UsernamePasswordAuthenticationToken(staff.getCode(), staff.getPassword());
        Authentication authenticate = authenticationManager.authenticate(usernamePasswordAuthenticationToken);
        // 认证失败框架会抛出异常
        // 认证通过
        StaffDetails staffDetails = (StaffDetails) authenticate.getPrincipal();
        String token = JwtUtil.generateToken(staffDetails);
        StaffDeptVO staffDeptVO = this.staffMapper.queryByCode(staffDetails.getUsername());
        return Response.success(staffDeptVO, token);
    }

}
