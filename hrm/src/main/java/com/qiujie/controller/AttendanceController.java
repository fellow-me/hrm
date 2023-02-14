package com.qiujie.controller;

import com.qiujie.service.AttendanceService;
import com.qiujie.entity.Attendance;

import com.qiujie.dto.ResponseDTO;
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
 * @since 2022-03-29
 */
@RestController
@RequestMapping("/attendance")
public class AttendanceController {

    @Resource
    private AttendanceService attendanceService;

    @ApiOperation("新增")
    @PostMapping
    public ResponseDTO add(@RequestBody Attendance attendance) {
        return this.attendanceService.add(attendance);
    }

    @ApiOperation("逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@PathVariable Integer id) {
        return this.attendanceService.deleteById(id);
    }

    @ApiOperation("批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@PathVariable List<Integer> ids) {
        return this.attendanceService.deleteBatch(ids);
    }

    @ApiOperation("编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody Attendance attendance) {
        return this.attendanceService.edit(attendance);
    }

    @ApiOperation("查询")
    @GetMapping("/{id}")
    public ResponseDTO findById(@PathVariable Integer id) {
        return this.attendanceService.findById(id);
    }

    @ApiOperation("分页条件查询")
    @GetMapping
    public ResponseDTO list(@RequestParam(defaultValue = "1") Integer current, @RequestParam(defaultValue = "10") Integer size, String name, Integer deptId,String month) {
        return this.attendanceService.list(current, size, name,deptId ,month);
    }

    @ApiOperation("数据导出接口")
    @GetMapping("/export/{month}")
    public ResponseDTO export(HttpServletResponse response, @PathVariable String month) throws IOException {
        return this.attendanceService.export(response, month);
    }

    @ApiOperation("数据导入接口")
    @PostMapping("/import")
    public ResponseDTO imp(MultipartFile file) throws IOException {
        return this.attendanceService.imp(file);
    }


    @ApiOperation("查询")
    @GetMapping("/staff/{id}")
    public ResponseDTO findByStaffId(@PathVariable Integer id) {
        return this.attendanceService.findByStaffId(id);
    }

    @ApiOperation("查询")
    @GetMapping("/staff/{id}/{date}")
    public ResponseDTO findByStaffIdAndDate(@PathVariable Integer id,@PathVariable String date) {
        return this.attendanceService.findByStaffIdAndDate(id,date);
    }

    @ApiOperation("编辑更新")
    @PutMapping("/set")
    public ResponseDTO setAttendance(@RequestBody Attendance attendance) {
        return this.attendanceService.setAttendance(attendance);
    }

    @ApiOperation("获取所有")
    @GetMapping("/all")
    public ResponseDTO findAll() {
        return this.attendanceService.findAll();
    }

}

