package com.qiujie.controller;


import com.qiujie.dto.ResponseDTO;
import com.qiujie.entity.Leave;
import com.qiujie.entity.StaffOvertime;
import com.qiujie.service.StaffOvertimeService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 * <p>
 * 员工考勤表 前端控制器
 * </p>
 *
 * @author qiujie
 * @since 2024-03-20
 */
@RestController
@RequestMapping("/staff-overtime")
public class StaffOvertimeController {
    @Resource
    private StaffOvertimeService staffOvertimeService;

    @ApiOperation("新增")
    @PostMapping
    public ResponseDTO add(@RequestBody StaffOvertime staffOvertime) {
        return this.staffOvertimeService.add(staffOvertime);
    }

    @ApiOperation("逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@PathVariable Integer id) {
        return this.staffOvertimeService.deleteById(id);
    }

    @ApiOperation("批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@PathVariable List<Integer> ids) {
        return this.staffOvertimeService.deleteBatch(ids);
    }

    @ApiOperation("编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody StaffOvertime staffOvertime) {
        return this.staffOvertimeService.edit(staffOvertime);
    }

    @ApiOperation("查询")
    @GetMapping("/{id}")
    public ResponseDTO findById(@PathVariable Integer id) {
        return this.staffOvertimeService.findById(id);
    }

    @ApiOperation("分页条件查询")
    @GetMapping
    public ResponseDTO list(@RequestParam(defaultValue = "1") Integer current, @RequestParam(defaultValue = "10") Integer size, String name, Integer deptId,String month) {
        return this.staffOvertimeService.list(current, size, name,deptId ,month);
    }

    @ApiOperation("数据导出接口")
    @GetMapping("/export/{month}/{filename}")
    public void export(HttpServletResponse response, @PathVariable String month,@PathVariable String filename) throws IOException {
         this.staffOvertimeService.export(response, month,filename);
    }

    @ApiOperation("数据导入接口")
    @PostMapping("/import")
    public ResponseDTO imp(MultipartFile file) throws IOException {
        return this.staffOvertimeService.imp(file);
    }

    @ApiOperation("查询")
    @GetMapping("/staff/{id}/{date}")
    public ResponseDTO findByStaffIdAndDate(@PathVariable Integer id,@PathVariable String date) {
        return this.staffOvertimeService.findByStaffIdAndDate(id,date);
    }


    @ApiOperation("设置加班")
    @PostMapping("/set")
    public ResponseDTO setOvertime(@RequestBody StaffOvertime staffOvertime) {
        return this.staffOvertimeService.setOvertime(staffOvertime);
    }

    @ApiOperation("查询")
    @GetMapping("/time/off/{id}")
    public ResponseDTO findTimeOffDays(@PathVariable Integer id) {
        return this.staffOvertimeService.findTimeOffDays(id);
    }

}

