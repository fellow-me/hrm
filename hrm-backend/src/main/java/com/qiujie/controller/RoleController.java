package com.qiujie.controller;

import com.qiujie.entity.Role;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.service.RoleMenuService;
import com.qiujie.service.RoleService;
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
@RequestMapping("/role")
@Tag(name = "角色管理", description = "角色管理接口")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @Autowired
    private RoleMenuService roleMenuService;

    @Operation(summary = "新增")
    @PostMapping
    @PreAuthorize("hasAnyAuthority('permission:role:add')")
    public ResponseDTO add(@RequestBody Role role) {
        return this.roleService.add(role);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyAuthority('permission:role:delete')")
    public ResponseDTO delete(@Parameter(description = "角色ID") @PathVariable Integer id) {
        return this.roleService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    @PreAuthorize("hasAnyAuthority('permission:role:delete')")
    public ResponseDTO deleteBatch(@Parameter(description = "角色ID集合") @PathVariable List<Integer> ids) {
        return this.roleService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    @PreAuthorize("hasAnyAuthority('permission:role:edit')")
    public ResponseDTO edit(@RequestBody Role role) {
        return this.roleService.edit(role);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "角色ID") @PathVariable Integer id) {
        return this.roleService.query(id);
    }

    @Operation(summary = "查询所有")
    @GetMapping("/all")
    public ResponseDTO queryAll(){
        return this.roleService.queryAll();
    }

    @Operation(summary = "分页条件查询")
    @GetMapping
    @PreAuthorize("hasAnyAuthority('permission:role:list','permission:role:search')")
    public ResponseDTO list(@Parameter(description = "页码") @RequestParam(defaultValue = "1") Integer current,
                            @Parameter(description = "每页条数") @RequestParam(defaultValue = "10") Integer size,
                            @Parameter(description = "角色名称") String name) {
        return this.roleService.list(current, size, name);
    }

    @Operation(summary = "数据导出接口")
    @GetMapping("/export/{filename}")
    @PreAuthorize("hasAnyAuthority('permission:role:export')")
    public void export(HttpServletResponse response,
                       @Parameter(description = "文件名") @PathVariable String filename) throws IOException {
        this.roleService.export(response,filename);
    }

    @Operation(summary = "数据导入接口")
    @PostMapping("/import")
    @PreAuthorize("hasAnyAuthority('permission:role:import')")
    public ResponseDTO imp(@Parameter(description = "导入文件") MultipartFile file) throws IOException {
        return this.roleService.imp(file);
    }

    @Operation(summary = "为角色设置菜单")
    @PostMapping("/set/{id}")
    @PreAuthorize("hasAnyAuthority('permission:role:set_menu')")
    public ResponseDTO setMenu(@Parameter(description = "角色ID") @PathVariable Integer id,
                               @Parameter(description = "菜单ID列表") @RequestBody List<Integer> menuIds){
        return this.roleMenuService.setMenu(id, menuIds);
    }

    @Operation(summary = "得到角色所属的菜单")
    @GetMapping("/role/{id}")
    public ResponseDTO queryByRoleId(@Parameter(description = "角色ID") @PathVariable Integer id){
        return this.roleMenuService.queryByRoleId(id);
    }
}
