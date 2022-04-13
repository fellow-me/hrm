package com.hrm.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hrm.entity.WorkTime;
import com.hrm.enums.BusinessStatusEnum;
import com.hrm.exception.ServiceException;
import com.hrm.mapper.WorkTimeMapper;
import com.hrm.dto.Response;
import com.hrm.dto.ResponseDTO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * <p>
 * 工作时间表 服务类
 * </p>
 *
 * @author qiujie
 * @since 2022-03-26
 */
@Service
public class WorkTimeService extends ServiceImpl<WorkTimeMapper, WorkTime> {


    public ResponseDTO add(WorkTime workTime) {
        if (save(workTime)) {
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


    public ResponseDTO edit(WorkTime workTime) {
        if (updateById(workTime)) {
            return Response.success();
        }
        return Response.error();
    }


    public ResponseDTO findById(Integer id) {
        WorkTime workTime = getById(id);
        if (workTime != null) {
            return Response.success(workTime);
        }
        return Response.error();
    }


    public ResponseDTO setWorkTime(WorkTime workTime) {
        workTime.setTotalWorkTime(calculateTotalWorkTime(workTime));
        QueryWrapper<WorkTime> queryWrapper = new QueryWrapper();
        queryWrapper.eq("dept_id", workTime.getDeptId());
        if (saveOrUpdate(workTime, queryWrapper)) {
            return Response.success();
        }
        throw new ServiceException(BusinessStatusEnum.ERROR);
    }


    // 计算员工每天的上班时间
    public BigDecimal calculateTotalWorkTime(WorkTime workTime) {
        long morDiff = workTime.getMorEndTime().getTime() - workTime.getMorStartTime().getTime();
        long aftDiff = workTime.getAftEndTime().getTime() - workTime.getAftStartTime().getTime();
        BigDecimal totalWorkTime = BigDecimal.valueOf((morDiff + aftDiff) / (1000 * 60 * 60.0)); // 此处除数一定要是浮点数类型
        return totalWorkTime;
    }
}




