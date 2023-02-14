package com.qiujie.controller;


import com.qiujie.entity.Staff;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.service.StaffRoleService;
import com.qiujie.service.StaffService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author qiujie
 * @since 2022-01-27
 */
@RestController
@RequestMapping("/staff")
public class StaffController {

    @Resource
    private StaffService staffService;

    @Resource
    private StaffRoleService staffRoleService;

    @ApiOperation("新增")
    @PostMapping
    public ResponseDTO add(@RequestBody Staff staff){
        return this.staffService.add(staff);
    }

    @ApiOperation("逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO deleteById(@PathVariable Integer id){
        return this.staffService.deleteById(id);
    }

    @ApiOperation("批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@PathVariable List<Integer> ids){
        return this.staffService.deleteBatch(ids);
    }

    @ApiOperation("编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody Staff staff){
        return this.staffService.edit(staff);
    }

    @ApiOperation("查询")
    @GetMapping("/{id}")
    public ResponseDTO findById(@PathVariable Integer id){
        return this.staffService.findById(id);
    }

    @ApiOperation("查询员工信息")
    @GetMapping("/info/{id}")
    public ResponseDTO findInfoById(@PathVariable Integer id){
        return this.staffService.findInfoById(id);
    }

    @ApiOperation("多条件分页查询")
    @PostMapping("/page")
    public ResponseDTO list(@RequestParam(defaultValue = "1") Integer current, @RequestParam(defaultValue = "10") Integer size, @RequestBody Staff staff){
        return this.staffService.list(current, size, staff);
    }

    @ApiOperation("数据导出接口")
    @GetMapping("/export")
    public ResponseDTO export(HttpServletResponse response) throws IOException {
        return this.staffService.export(response);
    }

    @ApiOperation("数据导入接口")
    @PostMapping("/import")
    public ResponseDTO imp(MultipartFile file) throws IOException {
        return this.staffService.imp(file);
    }

    @ApiOperation("为员工设置角色")
    @PostMapping("/role/{staffId}")
    public ResponseDTO setRole(@PathVariable Integer staffId, @RequestBody List<Integer> roleIds){
        return this.staffRoleService.setRole(staffId, roleIds);
    }

    @ApiOperation("得到员工的角色")
    @GetMapping("/role/{staffId}")
    public ResponseDTO getRole(@PathVariable Integer staffId){
        return this.staffRoleService.getRole(staffId);
    }


    @ApiOperation("检查员工的密码")
    @GetMapping("/check/{pwd}/{id}")
    public ResponseDTO checkPassword(@PathVariable String pwd,@PathVariable Integer id){
        return this.staffService.checkPassword(pwd,id);
    }

    @ApiOperation("更新密码")
    @PutMapping("/pwd")
    public ResponseDTO updatePassword(@RequestBody Staff staff){
        return this.staffService.updatePassword(staff);
    }
}

