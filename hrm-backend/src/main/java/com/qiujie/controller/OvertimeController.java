package com.qiujie.controller;

import com.qiujie.entity.Overtime;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.enums.OvertimeEnum;
import com.qiujie.service.OvertimeService;
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
 * 加班表 前端控制器
 * </p>
 *
 * @author qiujie
 * @since 2022-03-28
 */
@RestController
@RequestMapping("/overtime")
@Tag(name = "加班管理", description = "加班管理接口")
public class OvertimeController {
    @Autowired
    private OvertimeService overtimeService;

    @Operation(summary = "新增")
    @PostMapping
    public ResponseDTO add(@RequestBody Overtime overtime) {
        return this.overtimeService.add(overtime);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@Parameter(description = "加班ID") @PathVariable Integer id) {
        return this.overtimeService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@Parameter(description = "加班ID集合") @PathVariable List<Integer> ids) {
        return this.overtimeService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody Overtime overtime) {
        return this.overtimeService.edit(overtime);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "加班ID") @PathVariable Integer id) {
        return this.overtimeService.query(id);
    }

    @Operation(summary = "获取")
    @GetMapping("/{deptId}/{typeNum}")
    public ResponseDTO queryByDeptIdAndTypeNum(@Parameter(description = "部门ID") @PathVariable Integer deptId,
                                               @Parameter(description = "类型编号") @PathVariable String typeNum) {
        return this.overtimeService.queryByDeptIdAndTypeNum(deptId,typeNum);
    }

    @Operation(summary = "设置加班")
    @PostMapping("/set")
    @PreAuthorize("hasAnyAuthority('system:department:setting')")
    public ResponseDTO setOvertime(@RequestBody Overtime overtime) {
        return this.overtimeService.setOvertime(overtime);
    }

    @Operation(summary = "获取所有")
    @GetMapping("/all")
    public ResponseDTO queryAll() {
        return this.overtimeService.queryAll();
    }

}
