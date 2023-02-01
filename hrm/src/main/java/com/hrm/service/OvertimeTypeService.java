package com.hrm.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hrm.entity.OvertimeType;
import com.hrm.mapper.OvertimeTypeMapper;
import com.hrm.dto.Response;
import com.hrm.dto.ResponseDTO;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 加班类型表 服务类
 * </p>
 *
 * @author qiujie
 * @since 2022-03-28
 */
@Service
public class OvertimeTypeService extends ServiceImpl<OvertimeTypeMapper, OvertimeType> {


    public ResponseDTO add(OvertimeType overtimeType) {
        if (save(overtimeType)) {
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


    public ResponseDTO edit(OvertimeType overtimeType) {
        if (updateById(overtimeType)) {
            return Response.success();
        }
        return Response.error();
    }


    public ResponseDTO findById(Integer id) {
        OvertimeType overtimeType = getById(id);
        if (overtimeType != null) {
            return Response.success(overtimeType);
        }
        return Response.error();
    }


    public ResponseDTO findAll() {
        List<OvertimeType> list = list();
        return Response.success(list);
    }
}




