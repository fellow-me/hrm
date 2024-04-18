package com.qiujie.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qiujie.dto.Response;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.entity.Staff;
import com.qiujie.entity.StaffDetails;
import com.qiujie.entity.ValidateCode;
import com.qiujie.mapper.StaffMapper;
import com.qiujie.util.JwtUtil;
import com.qiujie.util.RedisUtil;
import com.qiujie.util.ValidateCodeUtil;
import com.qiujie.vo.StaffDeptVO;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

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

    @Resource
    private RedisUtil redisUtil;

    public ResponseDTO login(Staff staff,String validateCode) {
        // 校验验证码
        String codeInRedis = (String) redisUtil.get("validate:code");
        if(codeInRedis == null){
            return Response.error("验证码不存在！");
        }
        LocalDateTime expireTime = LocalDateTime.parse(redisUtil.get("expire:time").toString());
        if(ValidateCodeUtil.isExpire(expireTime)){
            return Response.error("验证码过期！");
        }
        if (!codeInRedis.equals(validateCode)) {
            return Response.error("验证码错误！");
        }
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

    public void getValidateCode(HttpServletResponse response) throws IOException {
        ValidateCode validateCode = ValidateCodeUtil.generateValidateCode();
        redisUtil.set("validate:code", validateCode.getCode());
        redisUtil.set("expire:time",validateCode.getExpireTime().toString());
        ImageIO.write(validateCode.getImage(), "jpeg", response.getOutputStream());
    }
}
