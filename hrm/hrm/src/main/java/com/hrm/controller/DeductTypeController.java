package com.hrm.controller;

import com.hrm.entity.DeductType;
import com.hrm.dto.ResponseDTO;
import com.hrm.service.DeductTypeService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;


/**
 * <p>
 * 扣款类型表 前端控制器
 * </p>
 *
 * @author qiujie
 * @since 2022-03-27
 */
@RestController
@RequestMapping("/deduct-type")
public class DeductTypeController {
    @Resource
    private DeductTypeService deductTypeService;

    @ApiOperation("新增")
    @PostMapping
    public ResponseDTO add(@RequestBody DeductType deductType) {
        return this.deductTypeService.add(deductType);
    }

    @ApiOperation("逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@PathVariable Integer id) {
        return this.deductTypeService.deleteById(id);
    }

    @ApiOperation("批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@PathVariable List<Integer> ids) {
        return this.deductTypeService.deleteBatch(ids);
    }

    @ApiOperation("编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody DeductType deductType) {
        return this.deductTypeService.edit(deductType);
    }

    @ApiOperation("查询")
    @GetMapping("/{id}")
    public ResponseDTO findById(@PathVariable Integer id) {
        return this.deductTypeService.findById(id);
    }

    @ApiOperation("查询所有")
    @GetMapping("/all")
    public ResponseDTO findAll() {
        return this.deductTypeService.findAll();
    }

}

