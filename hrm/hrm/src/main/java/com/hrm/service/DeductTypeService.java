package com.hrm.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hrm.entity.DeductType;
import com.hrm.mapper.DeductTypeMapper;
import com.hrm.dto.Response;
import com.hrm.dto.ResponseDTO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 扣款类型表 服务类
 * </p>
 *
 * @author qiujie
 * @since 2022-03-27
 */
@Service
public class DeductTypeService extends ServiceImpl<DeductTypeMapper, DeductType> {


    public ResponseDTO add(DeductType deductType) {
        if (save(deductType)) {
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


    public ResponseDTO edit(DeductType deductType) {
        if (updateById(deductType)) {
            return Response.success();
        }
        return Response.error();
    }


    public ResponseDTO findById(Integer id) {
        DeductType deductType = getById(id);
        if (deductType != null) {
            return Response.success(deductType);
        }
        return Response.error();
    }


    public ResponseDTO findAll() {
        List<DeductType> list = list();
        return Response.success(list);

    }
}




