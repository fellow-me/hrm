package com.qiujie.controller;

import com.qiujie.entity.Dept;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.service.DeptService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author qiujie
 * @since 2022-03-07
 */
@RestController
@RequestMapping("/dept")
public class DeptController {
    @Resource
    private DeptService deptService;

    @ApiOperation("新增")
    @PostMapping
    public ResponseDTO add(@RequestBody Dept dept) {
        return this.deptService.add(dept);
    }

    @ApiOperation("逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@PathVariable Integer id) {
        return this.deptService.deleteById(id);
    }

    @ApiOperation("批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@PathVariable List<Integer> ids) {
        return this.deptService.deleteBatch(ids);
    }

    @ApiOperation("编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody Dept dept) {
        return this.deptService.edit(dept);
    }

    @ApiOperation("查询")
    @GetMapping("/{id}")
    public ResponseDTO findById(@PathVariable Integer id) {
        return this.deptService.findById(id);
    }

    @ApiOperation("查询所有")
    @GetMapping("/all")
    public ResponseDTO findAll(){
        return this.deptService.findAll();
    }

    @ApiOperation("查询所有子部门")
    @GetMapping("/all/sub")
    public ResponseDTO findAllSubDept(){
        return this.deptService.findAllSubDept();
    }

    @ApiOperation("分页条件查询")
    @GetMapping
    public ResponseDTO list(@RequestParam(defaultValue = "1") Integer current, @RequestParam(defaultValue = "10") Integer size, String name) {
        return this.deptService.list(current, size, name);
    }

    @ApiOperation("数据导出接口")
    @GetMapping("/export")
    public ResponseDTO export(HttpServletResponse response) throws Exception {
        return this.deptService.export(response);
    }

    @ApiOperation("数据导入接口")
    @PostMapping("/import")
    public ResponseDTO imp(MultipartFile file) throws IOException {
        return this.deptService.imp(file);
    }

}

