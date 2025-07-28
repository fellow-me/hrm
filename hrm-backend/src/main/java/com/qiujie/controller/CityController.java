package com.qiujie.controller;

import com.qiujie.entity.City;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.service.CityService;
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
@RequestMapping("/city")
@Tag(name = "参保城市管理", description = "参保城市管理接口")
public class CityController {
    @Autowired
    private CityService cityService;

    @Operation(summary = "新增")
    @PostMapping
    @PreAuthorize("hasAnyAuthority('money:city:add')")
    public ResponseDTO add(@RequestBody City city) {
        return this.cityService.add(city);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyAuthority('money:city:delete')")
    public ResponseDTO delete(@Parameter(description = "城市ID") @PathVariable Integer id) {
        return this.cityService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    @PreAuthorize("hasAnyAuthority('money:city:delete')")
    public ResponseDTO deleteBatch(@Parameter(description = "城市ID集合") @PathVariable List<Integer> ids) {
        return this.cityService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    @PreAuthorize("hasAnyAuthority('money:city:edit')")
    public ResponseDTO edit(@RequestBody City city) {
        return this.cityService.edit(city);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "城市ID") @PathVariable Integer id) {
        return this.cityService.query(id);
    }

    @Operation(summary = "查询所有")
    @GetMapping("/all")
    public ResponseDTO queryAll() {
        return this.cityService.queryAll();
    }

    @Operation(summary = "条件查询")
    @GetMapping
    @PreAuthorize("hasAnyAuthority('money:city:list','money:city:search')")
    public ResponseDTO list(@Parameter(description = "页码") @RequestParam(defaultValue = "1") Integer current,
                            @Parameter(description = "每页条数") @RequestParam(defaultValue = "10") Integer size,
                            @Parameter(description = "城市名称") String name) {
        return this.cityService.list(current, size, name);
    }


    @Operation(summary = "数据导出接口")
    @GetMapping("/export/{filename}")
    @PreAuthorize("hasAnyAuthority('money:city:export')")
    public void export(HttpServletResponse response,
                       @Parameter(description = "文件名") @PathVariable String filename) throws IOException {
        this.cityService.export(response, filename);
    }

    @Operation(summary = "数据导入接口")
    @PostMapping("/import")
    @PreAuthorize("hasAnyAuthority('money:city:import')")
    public ResponseDTO imp(@Parameter(description = "导入文件") MultipartFile file) throws IOException {
        return this.cityService.imp(file);
    }


}
