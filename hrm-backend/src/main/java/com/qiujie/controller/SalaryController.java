package com.qiujie.controller;

import com.qiujie.entity.Salary;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.service.SalaryService;
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
 * @since 2022-04-06
 */
@RestController
@RequestMapping("/salary")
@Tag(name = "工资管理", description = "工资管理接口")
public class SalaryController {

    @Autowired
    private SalaryService salaryService;

    @Operation(summary = "新增")
    @PostMapping
    public ResponseDTO add(@RequestBody Salary salary) {
        return this.salaryService.add(salary);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@Parameter(description = "工资ID") @PathVariable Integer id) {
        return this.salaryService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@Parameter(description = "工资ID集合") @PathVariable List<Integer> ids) {
        return this.salaryService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody Salary salary) {
        return this.salaryService.edit(salary);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "工资ID") @PathVariable Integer id) {
        return this.salaryService.query(id);
    }

    @Operation(summary = "分页条件查询")
    @GetMapping
    @PreAuthorize("hasAnyAuthority('money:salary:list','money:salary:search')")
    public ResponseDTO list(@Parameter(description = "页码") @RequestParam(defaultValue = "1") Integer current,
                            @Parameter(description = "每页条数") @RequestParam(defaultValue = "10") Integer size,
                            @Parameter(description = "员工姓名") String name,
                            @Parameter(description = "部门ID") Integer deptId,
                            @Parameter(description = "月份") String month) {
        return this.salaryService.list(current, size, name, deptId, month);
    }

    @Operation(summary = "数据导出接口")
    @GetMapping("/export/{month}/{filename}")
    @PreAuthorize("hasAnyAuthority('money:salary:export')")
    public void export(HttpServletResponse response,
                       @Parameter(description = "月份") @PathVariable String month,
                       @Parameter(description = "文件名") @PathVariable String filename) throws IOException {
        this.salaryService.export(response, month,filename);
    }

    @Operation(summary = "数据导入接口")
    @PostMapping("/import")
    @PreAuthorize("hasAnyAuthority('money:salary:import')")
    public ResponseDTO imp(@Parameter(description = "导入文件") MultipartFile file) throws IOException {
        return this.salaryService.imp(file);
    }

    @Operation(summary = "设置工资")
    @PostMapping("/set")
    @PreAuthorize("hasAnyAuthority('money:salary:set')")
    public ResponseDTO setSalary(@RequestBody Salary salary) {
        return this.salaryService.setSalary(salary);
    }


}
