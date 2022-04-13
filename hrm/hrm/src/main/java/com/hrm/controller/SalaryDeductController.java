package com.hrm.controller;

import com.hrm.entity.SalaryDeduct;
import com.hrm.dto.ResponseDTO;
import com.hrm.service.SalaryDeductService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
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
public class SalaryDeductController {
    @Resource
    private SalaryDeductService salaryDeductService;

    @ApiOperation("新增")
    @PostMapping
    public ResponseDTO add(@RequestBody SalaryDeduct salaryDeduct) {
        return this.salaryDeductService.add(salaryDeduct);
    }

    @ApiOperation("逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@PathVariable Integer id) {
        return this.salaryDeductService.deleteById(id);
    }

    @ApiOperation("批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@PathVariable List<Integer> ids) {
        return this.salaryDeductService.deleteBatch(ids);
    }

    @ApiOperation("编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody SalaryDeduct salaryDeduct) {
        return this.salaryDeductService.edit(salaryDeduct);
    }

    @ApiOperation("查询")
    @GetMapping("/{id}")
    public ResponseDTO findById(@PathVariable Integer id) {
        return this.salaryDeductService.findById(id);
    }

    @ApiOperation("获取")
    @GetMapping("/{deptId}/{typeId}")
    public ResponseDTO find(@PathVariable Integer deptId, @PathVariable Integer typeId) {
        return this.salaryDeductService.find(deptId, typeId);
    }

    @ApiOperation("设置罚款")
    @PostMapping("/set")
    public ResponseDTO setSalaryDeduct(@RequestBody SalaryDeduct salaryDeduct) {
        return this.salaryDeductService.setSalaryDeduct(salaryDeduct);
    }

}

