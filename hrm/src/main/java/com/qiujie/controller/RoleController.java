package com.qiujie.controller;

import com.qiujie.entity.Role;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.service.RoleMenuService;
import com.qiujie.service.RoleService;
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
 * @since 2022-02-28
 */
@RestController
@RequestMapping("/role")
public class RoleController {
    @Resource
    private RoleService roleService;

    @Resource
    private RoleMenuService roleMenuService;

    @ApiOperation("新增")
    @PostMapping
    public ResponseDTO add(@RequestBody Role role) {
        return this.roleService.add(role);
    }

    @ApiOperation("逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@PathVariable Integer id) {
        return this.roleService.deleteById(id);
    }

    @ApiOperation("批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@PathVariable List<Integer> ids) {
        return this.roleService.deleteBatch(ids);
    }

    @ApiOperation("编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody Role role) {
        return this.roleService.edit(role);
    }

    @ApiOperation("查询")
    @GetMapping("/{id}")
    public ResponseDTO findById(@PathVariable Integer id) {
        return this.roleService.findById(id);
    }

    @ApiOperation("查询所有")
    @GetMapping("/all")
    public ResponseDTO findAll(){
        return this.roleService.findAll();
    }

    @ApiOperation("分页条件查询")
    @GetMapping
    public ResponseDTO list(@RequestParam(defaultValue = "1") Integer current, @RequestParam(defaultValue = "10") Integer size, String name) {
        return this.roleService.list(current, size, name);
    }

    @ApiOperation("数据导出接口")
    @GetMapping("/export")
    public ResponseDTO export(HttpServletResponse response) throws IOException {
        return this.roleService.export(response);
    }

    @ApiOperation("数据导入接口")
    @PostMapping("/import")
    public ResponseDTO imp(MultipartFile file) throws IOException {
        return this.roleService.imp(file);
    }

    @ApiOperation("为角色设置菜单")
    @PostMapping("/menu/{roleId}")
    public ResponseDTO setMenu(@PathVariable Integer roleId, @RequestBody List<Integer> menuIds){
        return this.roleMenuService.setMenu(roleId, menuIds);
    }

    @ApiOperation("得到角色所属的菜单")
    @GetMapping("/menu/{roleId}")
    public ResponseDTO getMenu(@PathVariable Integer roleId){
        return this.roleMenuService.getMenu(roleId);
    }
}

