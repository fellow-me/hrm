package com.qiujie.controller;


import com.qiujie.dto.ResponseDTO;
import com.qiujie.entity.Staff;
import com.qiujie.service.StaffRoleService;
import com.qiujie.service.StaffService;
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
 * @since 2022-01-27
 */
@RestController
@RequestMapping("/staff")
@Tag(name = "员工管理", description = "员工管理接口")
public class StaffController {

    @Autowired
    private StaffService staffService;

    @Autowired
    private StaffRoleService staffRoleService;

    @Operation(summary = "新增")
    @PostMapping
    @PreAuthorize("hasAnyAuthority('system:staff:add')")
    public ResponseDTO add(@RequestBody Staff staff) {
        return this.staffService.add(staff);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyAuthority('system:staff:delete')")
    public ResponseDTO delete(@Parameter(description = "员工ID") @PathVariable Integer id) {
        return this.staffService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    @PreAuthorize("hasAnyAuthority('system:staff:delete')")
    public ResponseDTO deleteBatch(@Parameter(description = "员工ID集合") @PathVariable List<Integer> ids) {
        return this.staffService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    @PreAuthorize("hasAnyAuthority('system:staff:edit','system:staff:enable')")
    public ResponseDTO edit(@RequestBody Staff staff) {
        return this.staffService.edit(staff);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "员工ID") @PathVariable Integer id) {
        return this.staffService.query(id);
    }

    @Operation(summary = "查询员工信息")
    @GetMapping("/info/{id}")
    public ResponseDTO queryInfo(@Parameter(description = "员工ID") @PathVariable Integer id) {
        return this.staffService.queryInfo(id);
    }

    @Operation(summary = "多条件分页查询")
    @GetMapping
    @PreAuthorize("hasAnyAuthority('system:staff:list','system:staff:search')")
    public ResponseDTO list(@Parameter(description = "页码") @RequestParam(defaultValue = "1") Integer current,
                            @Parameter(description = "每页条数") @RequestParam(defaultValue = "10") Integer size,
                            @Parameter(description = "员工姓名") String name,
                            @Parameter(description = "生日") String birthday,
                            @Parameter(description = "部门ID") Integer deptId,
                            @Parameter(description = "状态") Integer status) {
        return this.staffService.list(current, size, name, birthday, deptId, status);
    }

    @Operation(summary = "数据导出接口")
    @GetMapping("/export/{filename}")
    @PreAuthorize("hasAnyAuthority('system:staff:export')")
    public void export(HttpServletResponse response,
                       @Parameter(description = "文件名") @PathVariable String filename) throws IOException {
        this.staffService.export(response, filename);
    }

    @Operation(summary = "数据导入接口")
    @PostMapping("/import")
    @PreAuthorize("hasAnyAuthority('system:staff:import')")
    public ResponseDTO imp(@Parameter(description = "导入文件") MultipartFile file) throws IOException {
        return this.staffService.imp(file);
    }

    @Operation(summary = "为员工设置角色")
    @PostMapping("/set/{id}")
    @PreAuthorize("hasAnyAuthority('system:staff:set_role')")
    public ResponseDTO setRole(@Parameter(description = "员工ID") @PathVariable Integer id,
                               @Parameter(description = "角色ID列表") @RequestBody List<Integer> roleIds) {
        return this.staffRoleService.setRole(id, roleIds);
    }

    @Operation(summary = "得到员工的角色")
    @GetMapping("/staff/{id}")
    public ResponseDTO queryByStaffId(@Parameter(description = "员工ID") @PathVariable Integer id) {
        return this.staffRoleService.queryByStaffId(id);
    }


    @Operation(summary = "检查员工的密码")
    @GetMapping("/{pwd}/{id}")
    public ResponseDTO validate(@Parameter(description = "密码") @PathVariable String pwd,
                                @Parameter(description = "员工ID") @PathVariable Integer id) {
        return this.staffService.validate(pwd, id);
    }

    @Operation(summary = "更新密码")
    @PutMapping("/reset")
    public ResponseDTO reset(@RequestBody Staff staff) {
        return this.staffService.reset(staff);
    }
}
