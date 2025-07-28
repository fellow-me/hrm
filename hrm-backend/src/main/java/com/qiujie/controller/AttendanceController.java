package com.qiujie.controller;

import com.qiujie.service.AttendanceService;
import com.qiujie.entity.Attendance;

import com.qiujie.dto.ResponseDTO;
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
 * <p>
 * 前端控制器
 * </p>
 *
 * @author qiujie
 * @since 2022-03-29
 */
@RestController
@RequestMapping("/attendance")
@Tag(name = "考勤管理", description = "考勤管理接口")
public class AttendanceController {

    @Autowired
    private AttendanceService attendanceService;

    @Operation(summary = "新增")
    @PostMapping
    public ResponseDTO add(@RequestBody Attendance attendance) {
        return this.attendanceService.add(attendance);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@Parameter(description = "考勤ID") @PathVariable Integer id) {
        return this.attendanceService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@Parameter(description = "考勤ID集合") @PathVariable List<Integer> ids) {
        return this.attendanceService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody Attendance attendance) {
        return this.attendanceService.edit(attendance);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "考勤ID") @PathVariable Integer id) {
        return this.attendanceService.query(id);
    }

    @Operation(summary = "条件查询")
    @GetMapping
    @PreAuthorize("hasAnyAuthority('performance:attendance:list','performance:attendance:search')")
    public ResponseDTO list(@Parameter(description = "页码") @RequestParam(defaultValue = "1") Integer current,
                            @Parameter(description = "每页条数") @RequestParam(defaultValue = "10") Integer size,
                            @Parameter(description = "员工姓名") String name,
                            @Parameter(description = "部门ID") Integer deptId,
                            @Parameter(description = "月份") String month) {
        return this.attendanceService.list(current, size, name, deptId, month);
    }

    @Operation(summary = "数据导出接口")
    @GetMapping("/export/{month}/{filename}")
    @PreAuthorize("hasAnyAuthority('performance:attendance:export')")
    public void export(HttpServletResponse response,
                       @Parameter(description = "月份") @PathVariable String month,
                       @Parameter(description = "文件名") @PathVariable String filename) throws IOException {
        this.attendanceService.export(response, month,filename);
    }

    @Operation(summary = "数据导入接口")
    @PostMapping("/import")
    @PreAuthorize("hasAnyAuthority('performance:attendance:import')")
    public ResponseDTO imp(@Parameter(description = "导入文件") MultipartFile file) throws IOException {
        return this.attendanceService.imp(file);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}/{date}")
    public ResponseDTO queryByStaffIdAndDate(@Parameter(description = "员工ID") @PathVariable Integer id,
                                             @Parameter(description = "日期") @PathVariable String date) {
        return this.attendanceService.queryByStaffIdAndDate(id, date);
    }

    @Operation(summary = "保存或更新")
    @PutMapping("/set")
    @PreAuthorize("hasAnyAuthority('performance:attendance:set')")
    public ResponseDTO setAttendance(@RequestBody Attendance attendance) {
        return this.attendanceService.setAttendance(attendance);
    }

    @Operation(summary = "获取所有")
    @GetMapping("/all")
    public ResponseDTO queryAll() {
        return this.attendanceService.queryAll();
    }

}
