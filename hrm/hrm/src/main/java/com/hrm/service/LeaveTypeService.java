package com.hrm.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hrm.entity.LeaveType;
import com.hrm.mapper.LeaveTypeMapper;
import com.hrm.dto.Response;
import com.hrm.dto.ResponseDTO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 请假类型表 服务类
 * </p>
 *
 * @author qiujie
 * @since 2022-03-27
 */
@Service
public class LeaveTypeService extends ServiceImpl<LeaveTypeMapper, LeaveType> {


    public ResponseDTO add(LeaveType leaveType) {
        if (save(leaveType)) {
            return Response.success();
        }
        return Response.error();
    }

    public ResponseDTO deleteById(Integer id) {
        if (removeById(id)) {
            return Response.success();
        }
        return Response.error();
    }

    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO deleteBatch(List<Integer> ids) {
        if (removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.error();
    }


    public ResponseDTO edit(LeaveType leaveType) {
        if (updateById(leaveType)) {
            return Response.success();
        }
        return Response.error();
    }


    public ResponseDTO findById(Integer id) {
        LeaveType leaveType = getById(id);
        if (leaveType != null) {
            return Response.success(leaveType);
        }
        return Response.error();
    }

    public ResponseDTO findAll() {
        List<LeaveType> list = list();
        return Response.success(list);
    }


}




