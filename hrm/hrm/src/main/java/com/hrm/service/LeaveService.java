package com.hrm.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hrm.entity.Leave;
import com.hrm.mapper.LeaveMapper;
import com.hrm.dto.Response;
import com.hrm.dto.ResponseDTO;
import com.hrm.vo.LeaveVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 请假表 服务类
 * </p>
 *
 * @author qiujie
 * @since 2022-03-27
 */
@Service
public class LeaveService extends ServiceImpl<LeaveMapper, Leave> {


    @Resource
    private LeaveMapper leaveMapper;


    public ResponseDTO add(Leave leave) {
        if (save(leave)) {
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


    public ResponseDTO edit(Leave leave) {
        if (updateById(leave)) {
            return Response.success();
        }
        return Response.error();
    }


    public ResponseDTO findById(Integer id) {
        Leave leave = getById(id);
        if (leave != null) {
            return Response.success(leave);
        }
        return Response.error();
    }

    public ResponseDTO find(Integer deptId, Integer typeId) {
        QueryWrapper<Leave> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("dept_id", deptId).eq("type_id", typeId);
        Leave leave = getOne(queryWrapper);
        if (leave != null) {
            return Response.success(leave);
        }
        return Response.error();
    }


    public ResponseDTO setLeave(Leave leave) {
        QueryWrapper<Leave> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("dept_id", leave.getDeptId()).eq("type_id", leave.getTypeId());
        if (saveOrUpdate(leave, queryWrapper)) {
            return Response.success();
        }
        return Response.error();
    }


    public ResponseDTO findByDeptId(Integer id) {
        List<LeaveVO> list = this.leaveMapper.findByDeptId(id);
        return Response.success(list);
    }
}




