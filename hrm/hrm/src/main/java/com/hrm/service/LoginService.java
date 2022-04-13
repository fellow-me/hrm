package com.hrm.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hrm.dto.Response;
import com.hrm.dto.ResponseDTO;
import com.hrm.entity.Staff;
import com.hrm.enums.BusinessStatusEnum;
import com.hrm.mapper.StaffMapper;
import com.hrm.util.JWTUtil;
import com.hrm.util.MD5Util;
import com.hrm.vo.StaffDeptVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author : qiujie
 * @Date : 2022/1/30
 */

@Service
public class LoginService extends ServiceImpl<StaffMapper, Staff> {

    @Resource
    private StaffMapper staffMapper;

    public ResponseDTO login(Staff staff) {
        StaffDeptVO staffDeptVO = this.staffMapper.findStaffInfo(staff.getCode(), MD5Util.MD55(staff.getPassword()));
        if (staffDeptVO != null) {
            if (staffDeptVO.getStatus() == 1) {
                String token = JWTUtil.generateToken(staffDeptVO);
                staffDeptVO.setPassword(""); // 不传密码，保障安全性
                return Response.success(staffDeptVO, token); // 返回员工信息和token
            }
            return Response.error(BusinessStatusEnum.STAFF_STATUS_ERROR);
        }
        return Response.error("用户名或密码错误！");
    }


    public ResponseDTO findByCode(String code) {
        QueryWrapper<Staff> wrapper = new QueryWrapper<>();
        wrapper.eq("code", code);
        List<Staff> staffList = list(wrapper);
        if (staffList.size() > 0) {
            return Response.success();
        }
        return Response.error();
    }
}
