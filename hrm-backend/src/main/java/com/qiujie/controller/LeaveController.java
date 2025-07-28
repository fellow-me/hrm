package com.qiujie.controller;

import com.qiujie.entity.Leave;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.service.LeaveService;
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
 * 请假表 前端控制器
 * </p>
 *
 * @author qiujie
 * @since 2022-03-27
 */
@RestController
@RequestMapping("/leave")
@Tag(name = "请假管理", description = "请假管理接口")
public class LeaveController {
    @Autowired
    private LeaveService leaveService;

    @Operation(summary = "新增")
    @PostMapping
    public ResponseDTO add(@RequestBody Leave leave) {
        return this.leaveService.add(leave);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@Parameter(description = "请假ID") @PathVariable Integer id) {
        return this.leaveService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@Parameter(description = "请假ID集合") @PathVariable List<Integer> ids) {
        return this.leaveService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody Leave leave) {
        return this.leaveService.edit(leave);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "请假ID") @PathVariable Integer id) {
        return this.leaveService.query(id);
    }


    @Operation(summary = "获取")
    @GetMapping("/{deptId}/{typeNum}")
    public ResponseDTO queryByDeptIdAndTypeNum(@Parameter(description = "部门ID") @PathVariable Integer deptId,
                                               @Parameter(description = "类型编号") @PathVariable Integer typeNum) {
        return this.leaveService.queryByDeptIdAndTypeNum(deptId, typeNum);
    }

    @Operation(summary = "设置假期")
    @PostMapping("/set")
    @PreAuthorize("hasAnyAuthority('system:department:setting')")
    public ResponseDTO setLeave(@RequestBody Leave leave) {
        return this.leaveService.setLeave(leave);
    }


    @Operation(summary = "查询")
    @GetMapping("/dept/{id}")
    public ResponseDTO queryByDeptId(@Parameter(description = "部门ID") @PathVariable Integer id) {
        return this.leaveService.queryByDeptId(id);
    }

    @Operation(summary = "获取所有")
    @GetMapping("/all")
    public ResponseDTO queryAll() {
        return this.leaveService.queryAll();
    }

}
