package com.qiujie.controller;

import com.qiujie.service.StaffLeaveService;
import com.qiujie.entity.StaffLeave;

import com.qiujie.dto.ResponseDTO;
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
 * @since 2022-04-05
 */
@RestController
@RequestMapping("/staff-leave")
@Tag(name = "员工请假管理", description = "员工请假管理接口")
public class StaffLeaveController {

    @Autowired
    private StaffLeaveService staffLeaveService;

    @Operation(summary = "新增")
    @PostMapping
    public ResponseDTO add(@RequestBody StaffLeave staffLeave) {
        return this.staffLeaveService.add(staffLeave);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO delete(@Parameter(description = "请假ID") @PathVariable Integer id) {
        return this.staffLeaveService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@Parameter(description = "请假ID集合") @PathVariable List<Integer> ids) {
        return this.staffLeaveService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody StaffLeave staffLeave) {
        return this.staffLeaveService.edit(staffLeave);
    }


    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "请假ID") @PathVariable Integer id) {
        return this.staffLeaveService.query(id);
    }


    /**
     *
     * @param current
     * @param size
     * @param name
     * @param deptId
     * @param code 用户工号
     * @return
     */
    @Operation(summary = "分页条件查询")
    @GetMapping
    @PreAuthorize("hasAnyAuthority('performance:leave:list','performance:leave:search')")
    public ResponseDTO list(@Parameter(description = "页码") @RequestParam(defaultValue = "1") Integer current,
                            @Parameter(description = "每页条数") @RequestParam(defaultValue = "10") Integer size,
                            @Parameter(description = "员工姓名") String name,
                            @Parameter(description = "部门ID") Integer deptId,
                            @Parameter(description = "用户工号") String code) {
        return this.staffLeaveService.list(current, size, name,deptId,code);
    }

    @Operation(summary = "数据导出接口")
    @GetMapping("/export/{filename}")
    @PreAuthorize("hasAnyAuthority('performance:leave:export')")
    public void export(HttpServletResponse response,
                       @Parameter(description = "文件名") @PathVariable String filename) throws IOException {
        this.staffLeaveService.export(response,filename);
    }

    @Operation(summary = "数据导入接口")
    @PostMapping("/import")
    @PreAuthorize("hasAnyAuthority('performance:leave:import')")
    public ResponseDTO imp(@Parameter(description = "导入文件") MultipartFile file) throws IOException {
        return this.staffLeaveService.imp(file);
    }

    @Operation(summary = "分页")
    @GetMapping("/staff")
    public ResponseDTO queryByStaffId(@Parameter(description = "页码") @RequestParam(defaultValue = "1") Integer current,
                                      @Parameter(description = "每页条数") @RequestParam(defaultValue = "10") Integer size,
                                      @Parameter(description = "员工ID") Integer id) {
        return this.staffLeaveService.queryByStaffId(current, size, id);
    }

    @Operation(summary = "获取所有")
    @GetMapping("/all")
    public ResponseDTO queryAll() {
        return this.staffLeaveService.queryAll();
    }

    @Operation(summary = "申请请假")
    @PostMapping("/apply/{code}")
    public ResponseDTO apply(@RequestBody StaffLeave staffLeave,
                             @Parameter(description = "员工工号") @PathVariable String code) {
        return this.staffLeaveService.apply(staffLeave,code);
    }

    @Operation(summary = "拾取请假任务")
    @PostMapping("/claim/{code}")
    @PreAuthorize("hasAnyAuthority('performance:leave:claim')")
    public ResponseDTO claim(@RequestBody StaffLeave staffLeave,
                             @Parameter(description = "员工工号") @PathVariable String code) {
        return this.staffLeaveService.claim(staffLeave,code);
    }

    @Operation(summary = "归还请假任务")
    @PostMapping("/revert/{code}")
    public ResponseDTO revert(@RequestBody StaffLeave staffLeave,
                              @Parameter(description = "员工工号") @PathVariable String code) {
        return this.staffLeaveService.revert(staffLeave,code);
    }


    @Operation(summary = "完成任务")
    @PostMapping("/complete/{code}")
    public ResponseDTO complete(@RequestBody StaffLeave staffLeave,
                                @Parameter(description = "员工工号") @PathVariable String code) {
        return this.staffLeaveService.complete(staffLeave,code);
    }

    @Operation(summary = "撤销请假")
    @PostMapping("/cancel")
    public ResponseDTO cancel(@RequestBody StaffLeave staffLeave){
        return this.staffLeaveService.cancel(staffLeave);
    }
}
