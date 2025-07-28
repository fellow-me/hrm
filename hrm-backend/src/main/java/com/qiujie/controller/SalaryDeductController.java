package com.qiujie.controller;

import com.qiujie.entity.SalaryDeduct;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.service.SalaryDeductService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.*;
import java.util.List;


/**
 * <p>
 * 工资扣除表 前端控制器
 * </p>
 *
 * @author qiujie
 * @since 2022-03-27
 */
@RestController
@RequestMapping("/salary-deduct")
@Tag(name = "工资扣除管理", description = "工资扣除管理接口")
public class SalaryDeductController {
    @Autowired
    private SalaryDeductService salaryDeductService;

    @Operation(summary = "新增")
    @PostMapping
    public ResponseDTO add(@RequestBody SalaryDeduct salaryDeduct) {
        return this.salaryDeductService.add(salaryDeduct);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@Parameter(description = "工资扣除ID") @PathVariable Integer id) {
        return this.salaryDeductService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@Parameter(description = "工资扣除ID集合") @PathVariable List<Integer> ids) {
        return this.salaryDeductService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody SalaryDeduct salaryDeduct) {
        return this.salaryDeductService.edit(salaryDeduct);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "工资扣除ID") @PathVariable Integer id) {
        return this.salaryDeductService.query(id);
    }

    @Operation(summary = "获取")
    @GetMapping("/{deptId}/{typeNum}")
    public ResponseDTO queryByDeptIdAndTypeNum(@Parameter(description = "部门ID") @PathVariable Integer deptId,
                                               @Parameter(description = "类型编号") @PathVariable Integer typeNum) {
        return this.salaryDeductService.queryByDeptIdAndTypeNum(deptId, typeNum);
    }

    @Operation(summary = "设置罚款")
    @PostMapping("/set")
    @PreAuthorize("hasAnyAuthority('system:department:setting')")
    public ResponseDTO setSalaryDeduct(@RequestBody SalaryDeduct salaryDeduct) {
        return this.salaryDeductService.setSalaryDeduct(salaryDeduct);
    }

    @Operation(summary = "获取所有")
    @GetMapping("/all")
    public ResponseDTO queryAll() {
        return this.salaryDeductService.queryAll();
    }

}
