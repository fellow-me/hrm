package com.hrm.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hrm.entity.Overtime;
import com.hrm.mapper.OvertimeMapper;
import com.hrm.dto.Response;
import com.hrm.dto.ResponseDTO;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 加班表 服务类
 * </p>
 *
 * @author qiujie
 * @since 2022-03-28
 */
@Service
public class OvertimeService extends ServiceImpl<OvertimeMapper, Overtime> {


    public ResponseDTO add(Overtime overtime) {
        if (save(overtime)) {
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

    public ResponseDTO deleteBatch(List<Integer> ids) {
        if (removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.error();
    }


    public ResponseDTO edit(Overtime overtime) {
        if (updateById(overtime)) {
            return Response.success();
        }
        return Response.error();
    }


    public ResponseDTO findById(Integer id) {
        Overtime overtime = getById(id);
        if (overtime != null) {
            return Response.success(overtime);
        }
        return Response.error();
    }

    public ResponseDTO find(Integer deptId, Integer typeId) {
        QueryWrapper<Overtime> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("dept_id", deptId).eq("type_id", typeId);
        Overtime overtime = getOne(queryWrapper);
        if (overtime != null) {
            return Response.success(overtime);
        }
        return Response.error();
    }


    public ResponseDTO setOvertime(Overtime overtime) {
        QueryWrapper<Overtime> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("dept_id", overtime.getDeptId()).eq("type_id", overtime.getTypeId());
        if (saveOrUpdate(overtime, queryWrapper)) {
            return Response.success();
        }
        return Response.error();
    }


}




