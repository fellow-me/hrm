package com.hrm.controller;

import com.hrm.entity.LeaveType;
import com.hrm.dto.ResponseDTO;
import com.hrm.service.LeaveTypeService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;


/**
 * <p>
 * 请假类型表 前端控制器
 * </p>
 *
 * @author qiujie
 * @since 2022-03-27
 */
@RestController
@RequestMapping("/leave-type")
public class LeaveTypeController {
    @Resource
    private LeaveTypeService leaveTypeService;

    @ApiOperation("新增")
    @PostMapping
    public ResponseDTO add(@RequestBody LeaveType leaveType) {
        return this.leaveTypeService.add(leaveType);
    }

    @ApiOperation("逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@PathVariable Integer id) {
        return this.leaveTypeService.deleteById(id);
    }

    @ApiOperation("编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody LeaveType leaveType) {
        return this.leaveTypeService.edit(leaveType);
    }

    @ApiOperation("查询")
    @GetMapping("/{id}")
    public ResponseDTO findById(@PathVariable Integer id) {
        return this.leaveTypeService.findById(id);
    }

    @ApiOperation("查询所有")
    @GetMapping("/all")
    public ResponseDTO findAll() {
        return this.leaveTypeService.findAll();
    }

}

