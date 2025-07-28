package com.qiujie.controller;

import com.qiujie.dto.ResponseDTO;
import com.qiujie.entity.Menu;
import com.qiujie.service.MenuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.*;
import java.io.IOException;
import java.util.List;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author qiujie
 * @since 2022-02-28
 */
@RestController
@RequestMapping("/menu")
@Tag(name = "菜单管理", description = "菜单管理接口")
public class MenuController {
    @Autowired
    private MenuService menuService;

    @Operation(summary = "新增")
    @PostMapping
    @PreAuthorize("hasAnyAuthority('permission:menu:add')")
    public ResponseDTO add(@RequestBody Menu menu) {
        return this.menuService.add(menu);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyAuthority('permission:menu:delete')")
    public ResponseDTO deleteById(@Parameter(description = "菜单ID") @PathVariable Integer id) {
        return this.menuService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    @PreAuthorize("hasAnyAuthority('permission:menu:delete')")
    public ResponseDTO deleteBatch(@Parameter(description = "菜单ID集合") @PathVariable List<Integer> ids) {
        return this.menuService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    @PreAuthorize("hasAnyAuthority('permission:menu:edit','permission:menu:enable')")
    public ResponseDTO edit(@RequestBody Menu menu) {
        return this.menuService.edit(menu);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "菜单ID") @PathVariable Integer id) {
        return this.menuService.query(id);
    }



    @Operation(summary = "分页条件查询")
    @GetMapping
    @PreAuthorize("hasAnyAuthority('permission:menu:list','permission:menu:search')")
    public ResponseDTO list(@Parameter(description = "页码") @RequestParam(defaultValue = "1") Integer current,
                            @Parameter(description = "每页条数") @RequestParam(defaultValue = "10") Integer size,
                            @Parameter(description = "菜单名称") String name) {
        return this.menuService.list(current, size, name);
    }

    @Operation(summary = "数据导出接口")
    @GetMapping("/export/{filename}")
    @PreAuthorize("hasAnyAuthority('permission:menu:export')")
    public void export(HttpServletResponse response,
                       @Parameter(description = "文件名") @PathVariable String filename) throws IOException {
        this.menuService.export(response,filename);
    }

    @Operation(summary = "数据导入接口")
    @PostMapping("/import")
    @PreAuthorize("hasAnyAuthority('permission:menu:import')")
    public ResponseDTO imp(@Parameter(description = "导入文件") MultipartFile file) throws IOException {
        return this.menuService.imp(file);
    }

    @Operation(summary = "查询所有")
    @GetMapping("/all")
    public ResponseDTO queryAll(){
        return this.menuService.queryAll();
    }

    @Operation(summary = "获取员工的菜单")
    @GetMapping("/staff/{id}")
    public ResponseDTO queryByStaffId(@Parameter(description = "员工ID") @PathVariable Integer id){
        return this.menuService.queryByStaffId(id);
    }

    @Operation(summary = "查询权限")
    @GetMapping("/permission/{id}")
    public ResponseDTO queryPermission(@Parameter(description = "权限ID") @PathVariable Integer id){
        return this.menuService.queryPermission(id);
    }
}
