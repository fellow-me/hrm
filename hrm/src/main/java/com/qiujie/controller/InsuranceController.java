package com.qiujie.controller;

import com.qiujie.entity.Staff;
import com.qiujie.service.InsuranceService;
import com.qiujie.entity.Insurance;

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
 * @since 2022-03-23
 */
@RestController
@RequestMapping("/insurance")
public class InsuranceController {
    @Resource
    private InsuranceService insuranceService;

    @ApiOperation("新增")
    @PostMapping
    public ResponseDTO add(@RequestBody Insurance insurance) {
        return this.insuranceService.add(insurance);
    }

    @ApiOperation("逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@PathVariable Integer id) {
        return this.insuranceService.deleteById(id);
    }

    @ApiOperation("批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@PathVariable List<Integer> ids) {
        return this.insuranceService.deleteBatch(ids);
    }

    @ApiOperation("编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody Insurance insurance) {
        return this.insuranceService.edit(insurance);
    }

    @ApiOperation("查询")
    @GetMapping("/{id}")
    public ResponseDTO findById(@PathVariable Integer id) {
        return this.insuranceService.findById(id);
    }

    @ApiOperation("查询")
    @GetMapping("/staff/{id}")
    public ResponseDTO findByStaffId(@PathVariable Integer id) {
        return this.insuranceService.findByStaffId(id);
    }

    @ApiOperation("多条件分页查询")
    @PostMapping("/page")
    public ResponseDTO list(@RequestParam(defaultValue = "1") Integer current, @RequestParam(defaultValue = "10") Integer size, @RequestBody Staff staff){
        return this.insuranceService.list(current, size, staff);
    }

    @ApiOperation("数据导出接口")
    @GetMapping("/export")
    public ResponseDTO export(HttpServletResponse response) throws IOException {
        return this.insuranceService.export(response);
    }

    @ApiOperation("数据导入接口")
    @PostMapping("/import")
    public ResponseDTO imp(MultipartFile file) throws IOException {
        return this.insuranceService.imp(file);
    }

    @ApiOperation("为员工设置社保")
    @PostMapping("/set")
    public ResponseDTO setInsurance(@RequestBody Insurance insurance) {
        return this.insuranceService.setInsurance(insurance);
    }
}

