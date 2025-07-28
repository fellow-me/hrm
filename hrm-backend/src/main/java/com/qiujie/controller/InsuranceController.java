package com.qiujie.controller;

import com.qiujie.service.InsuranceService;
import com.qiujie.entity.Insurance;

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
 * @since 2022-03-23
 */
@RestController
@RequestMapping("/insurance")
@Tag(name = "社保管理", description = "社保管理接口")
public class InsuranceController {
    @Autowired
    private InsuranceService insuranceService;

    @Operation(summary = "新增")
    @PostMapping
    public ResponseDTO add(@RequestBody Insurance insurance) {
        return this.insuranceService.add(insurance);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@Parameter(description = "社保ID") @PathVariable Integer id) {
        return this.insuranceService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@Parameter(description = "社保ID集合") @PathVariable List<Integer> ids) {
        return this.insuranceService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody Insurance insurance) {
        return this.insuranceService.edit(insurance);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "社保ID") @PathVariable Integer id) {
        return this.insuranceService.query(id);
    }

    @Operation(summary = "根据员工ID查询")
    @GetMapping("/staff/{id}")
    public ResponseDTO queryByStaffId(@Parameter(description = "员工ID") @PathVariable Integer id) {
        return this.insuranceService.queryByStaffId(id);
    }

    @Operation(summary = "多条件分页查询")
    @GetMapping
    @PreAuthorize("hasAnyAuthority('money:insurance:list','money:insurance:search')")
    public ResponseDTO list(@Parameter(description = "页码") @RequestParam(defaultValue = "1") Integer current,
                            @Parameter(description = "每页条数") @RequestParam(defaultValue = "10") Integer size,
                            @Parameter(description = "员工姓名") String name,
                            @Parameter(description = "部门ID") Integer deptId){
        return this.insuranceService.list(current, size, name,deptId);
    }

    @Operation(summary = "数据导出接口")
    @GetMapping("/export/{filename}")
    @PreAuthorize("hasAnyAuthority('money:insurance:export')")
    public void export(HttpServletResponse response,
                       @Parameter(description = "文件名") @PathVariable String filename) throws IOException {
        this.insuranceService.export(response,filename);
    }

    @Operation(summary = "数据导入接口")
    @PostMapping("/import")
    @PreAuthorize("hasAnyAuthority('money:insurance:import')")
    public ResponseDTO imp(@Parameter(description = "导入文件") MultipartFile file) throws IOException {
        return this.insuranceService.imp(file);
    }

    @Operation(summary = "为员工设置社保")
    @PostMapping("/set")
    @PreAuthorize("hasAnyAuthority('money:insurance:set')")
    public ResponseDTO setInsurance(@RequestBody Insurance insurance) {
        return this.insuranceService.setInsurance(insurance);
    }
}
