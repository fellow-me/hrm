package com.hrm.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hrm.dto.Response;
import com.hrm.dto.ResponseDTO;
import com.hrm.entity.Dept;
import com.hrm.mapper.DeptMapper;
import com.hrm.util.HutoolExcelUtil;
import com.hrm.vo.DeptWorkTimeVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author qiujie
 * @since 2022-03-07
 */
@Service
public class DeptService extends ServiceImpl<DeptMapper, Dept> {

    @Resource
    private DeptMapper deptMapper;

    public ResponseDTO add(Dept dept) {
        if (save(dept)) {
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


    public ResponseDTO edit(Dept dept) {
        if (updateById(dept)) {
            return Response.success();
        }
        return Response.error();
    }

    /**
     * 查找所有部门
     *
     * @return
     */
    public ResponseDTO findAll() {
        List<Dept> list = list();
        // 为父级部门设置子部门
        return Response.success(setSubDept(list));
    }

    public ResponseDTO findById(Integer id) {
        Dept dept = getById(id);
        if (dept != null) {
            return Response.success(dept);
        }
        return Response.error();
    }


    public ResponseDTO list(Integer current, Integer size, String name) {
        IPage<DeptWorkTimeVO> config = new Page<>(current, size);
        if (name == null) {
            name = "";
        }
        IPage<DeptWorkTimeVO> page = this.deptMapper.listParentDeptWorkTimeVO(config, name);
        // 查询所有菜单
        List<DeptWorkTimeVO> list = this.deptMapper.findSubDeptWorkTimeVO();
        // 父级部门
        List<DeptWorkTimeVO> parentList = page.getRecords();
        for (DeptWorkTimeVO parentDept : parentList) {
            // 设置子部门
            List<DeptWorkTimeVO> subList = list.stream().filter(dept -> dept.getParentId() == parentDept.getId()).collect(Collectors.toList());
            parentDept.setChildren(subList);
        }
        // 将响应数据填充到map中
        Map map = new HashMap();
        map.put("pages", page.getPages());
        map.put("total", page.getTotal());
        map.put("list", page.getRecords());
        return Response.success(map);
    }

    /**
     * 数据导出
     *
     * @param response
     * @return
     */
    public ResponseDTO export(HttpServletResponse response) throws Exception {
        List<DeptWorkTimeVO> list = this.deptMapper.findSubDeptWorkTimeVO();
        HutoolExcelUtil.writeExcel(response, list, "部门数据", DeptWorkTimeVO.class);
        return Response.success();
    }

    /**
     * 数据导入
     *
     * @param file
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO imp(MultipartFile file) throws IOException {
        InputStream inputStream = file.getInputStream();
        List<Dept> list = HutoolExcelUtil.readExcel(inputStream, 1, Dept.class);
        // IService接口中的方法.批量插入数据
        if (saveBatch(list)) {
            return Response.success();
        }
        return Response.error();
    }


    /**
     * 为父级部门设置子部门，使用流来处理数据，并返回父级部门
     *
     * @param list
     * @return
     */
    public List<Dept> setSubDept(List<Dept> list) {
        // 父级菜单
        List<Dept> parentList = list.stream().parallel()
                .filter(dept -> dept.getParentId() == 0).collect(Collectors.toList());
        for (Dept parentDept : parentList) {
            // 子菜单
            List<Dept> subList = list.stream().parallel()
                    .filter(dept -> dept.getParentId() == parentDept.getId()).collect(Collectors.toList());
            parentDept.setChildren(subList);
        }
        return parentList;
    }

    /**
     * 得到所有的子部门
     *
     * @return
     */
    public ResponseDTO findAllSubDept() {
        QueryWrapper<Dept> wrapper = new QueryWrapper<>();
        wrapper.ne("parent_id", 0);
        List<Dept> list = list(wrapper);
        return Response.success(list);
    }
}




