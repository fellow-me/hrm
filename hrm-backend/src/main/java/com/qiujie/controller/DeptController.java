package com.qiujie.controller;

import com.qiujie.entity.Dept;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.service.DeptService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.*;
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
@Tag(name = "部门管理", description = "部门管理接口")
public class DeptController {
    @Autowired
    private DeptService deptService;

    @Operation(summary = "新增")
    @PostMapping
    @PreAuthorize("hasAnyAuthority('system:department:add')")
    public ResponseDTO add(@RequestBody Dept dept) {
        return this.deptService.add(dept);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyAuthority('system:department:delete')")
    public ResponseDTO delete(@Parameter(description = "部门ID") @PathVariable Integer id) {
        return this.deptService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    @PreAuthorize("hasAnyAuthority('system:department:delete')")
    public ResponseDTO deleteBatch(@Parameter(description = "部门ID集合") @PathVariable List<Integer> ids) {
        return this.deptService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    @PreAuthorize("hasAnyAuthority('system:department:edit')")
    public ResponseDTO edit(@RequestBody Dept dept) {
        return this.deptService.edit(dept);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "部门ID") @PathVariable Integer id) {
        return this.deptService.query(id);
    }

    @Operation(summary = "查询所有")
    @GetMapping("/all")
    public ResponseDTO queryAll(){
        return this.deptService.queryAll();
    }

    @Operation(summary = "条件查询")
    @GetMapping
    @PreAuthorize("hasAnyAuthority('system:department:list','system:department:search')")
    public ResponseDTO list(@Parameter(description = "页码") @RequestParam(defaultValue = "1") Integer current,
                            @Parameter(description = "每页条数") @RequestParam(defaultValue = "10") Integer size,
                            @Parameter(description = "部门名称") String name) {
        return this.deptService.list(current, size, name);
    }

    @Operation(summary = "数据导出接口")
    @GetMapping("/export/{filename}")
    @PreAuthorize("hasAnyAuthority('system:department:export')")
    public void export(HttpServletResponse response,
                       @Parameter(description = "文件名") @PathVariable String filename) throws Exception {
        this.deptService.export(response,filename);
    }

    @Operation(summary = "数据导入接口")
    @PostMapping("/import")
    @PreAuthorize("hasAnyAuthority('system:department:import')")
    public ResponseDTO imp(@Parameter(description = "导入文件") MultipartFile file) throws IOException {
        return this.deptService.imp(file);
    }

}
