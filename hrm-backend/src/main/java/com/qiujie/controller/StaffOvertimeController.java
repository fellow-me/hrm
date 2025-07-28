package com.qiujie.controller;


import com.qiujie.dto.ResponseDTO;
import com.qiujie.entity.StaffOvertime;
import com.qiujie.service.StaffOvertimeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;


/**
 *
 * @author qiujie
 * @since 2024-03-20
 */
@RestController
@RequestMapping("/staff-overtime")
@Tag(name = "员工加班管理", description = "员工加班管理接口")
public class StaffOvertimeController {
    @Autowired
    private StaffOvertimeService staffOvertimeService;

    @Operation(summary = "新增")
    @PostMapping
    public ResponseDTO add(@RequestBody StaffOvertime staffOvertime) {
        return this.staffOvertimeService.add(staffOvertime);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@Parameter(description = "加班ID") @PathVariable Integer id) {
        return this.staffOvertimeService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@Parameter(description = "加班ID集合") @PathVariable List<Integer> ids) {
        return this.staffOvertimeService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody StaffOvertime staffOvertime) {
        return this.staffOvertimeService.edit(staffOvertime);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "加班ID") @PathVariable Integer id) {
        return this.staffOvertimeService.query(id);
    }

    @Operation(summary = "分页条件查询")
    @GetMapping
    @PreAuthorize("hasAnyAuthority('performance:overtime:list','performance:overtime:search')")
    public ResponseDTO list(@Parameter(description = "页码") @RequestParam(defaultValue = "1") Integer current,
                            @Parameter(description = "每页条数") @RequestParam(defaultValue = "10") Integer size,
                            @Parameter(description = "员工姓名") String name,
                            @Parameter(description = "部门ID") Integer deptId,
                            @Parameter(description = "月份") String month) {
        return this.staffOvertimeService.list(current, size, name,deptId ,month);
    }

    @Operation(summary = "数据导出接口")
    @GetMapping("/export/{month}/{filename}")
    @PreAuthorize("hasAnyAuthority('performance:overtime:export')")
    public void export(HttpServletResponse response,
                       @Parameter(description = "月份") @PathVariable String month,
                       @Parameter(description = "文件名") @PathVariable String filename) throws IOException {
        this.staffOvertimeService.export(response, month,filename);
    }

    @Operation(summary = "数据导入接口")
    @PostMapping("/import")
    @PreAuthorize("hasAnyAuthority('performance:overtime:import')")

    public ResponseDTO imp(@Parameter(description = "导入文件") MultipartFile file) throws IOException {
        return this.staffOvertimeService.imp(file);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}/{date}")
    public ResponseDTO queryByStaffIdAndDate(@Parameter(description = "员工ID") @PathVariable Integer id,
                                             @Parameter(description = "日期") @PathVariable String date) {
        return this.staffOvertimeService.queryByStaffIdAndDate(id,date);
    }


    @Operation(summary = "设置加班")
    @PostMapping("/set")
    @PreAuthorize("hasAnyAuthority('performance:overtime:set')")
    public ResponseDTO setOvertime(@RequestBody StaffOvertime staffOvertime) {
        return this.staffOvertimeService.setOvertime(staffOvertime);
    }

    @Operation(summary = "查询调休天数")
    @GetMapping("/time/off/{id}")
    public ResponseDTO queryTimeOffDaysByStaffId(@Parameter(description = "员工ID") @PathVariable Integer id) {
        return this.staffOvertimeService.queryTimeOffDaysByStaffId(id);
    }

}
