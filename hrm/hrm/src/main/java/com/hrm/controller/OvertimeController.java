package com.hrm.controller;

import com.hrm.entity.Overtime;
import com.hrm.dto.ResponseDTO;
import com.hrm.service.OvertimeService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
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
public class OvertimeController {
    @Resource
    private OvertimeService overtimeService;

    @ApiOperation("新增")
    @PostMapping
    public ResponseDTO add(@RequestBody Overtime overtime) {
        return this.overtimeService.add(overtime);
    }

    @ApiOperation("逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@PathVariable Integer id) {
        return this.overtimeService.deleteById(id);
    }

    @ApiOperation("批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@PathVariable List<Integer> ids) {
        return this.overtimeService.deleteBatch(ids);
    }

    @ApiOperation("编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody Overtime overtime) {
        return this.overtimeService.edit(overtime);
    }

    @ApiOperation("查询")
    @GetMapping("/{id}")
    public ResponseDTO findById(@PathVariable Integer id) {
        return this.overtimeService.findById(id);
    }

    @ApiOperation("获取")
    @GetMapping("/{deptId}/{typeId}")
    public ResponseDTO find(@PathVariable Integer deptId, @PathVariable Integer typeId) {
        return this.overtimeService.find(deptId, typeId);
    }

    @ApiOperation("设置加班")
    @PostMapping("/set")
    public ResponseDTO setOvertime(@RequestBody Overtime overtime) {
        return this.overtimeService.setOvertime(overtime);
    }

}

