package com.qiujie.controller;

import com.qiujie.entity.Docs;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.service.DocsService;
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
 * 文件上传接口
 *
 * @Author qiujie
 * @Date 2022/2/24
 * @Version 1.0
 */

@RestController
@RequestMapping("/docs")
@Tag(name = "文件管理", description = "文件管理接口")
public class DocsController {

    @Autowired
    private DocsService docsService;

    @Operation(summary = "新增")
    @PostMapping
    public ResponseDTO add(@RequestBody Docs docs) {
        return this.docsService.add(docs);
    }

    @Operation(summary = "逻辑删除")
    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyAuthority('system:docs:delete')")
    public ResponseDTO delete(@Parameter(description = "文件ID") @PathVariable Integer id) {
        return this.docsService.delete(id);
    }

    @Operation(summary = "批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    @PreAuthorize("hasAnyAuthority('system:docs:delete')")
    public ResponseDTO deleteBatch(@Parameter(description = "文件ID集合") @PathVariable List<Integer> ids) {
        return this.docsService.deleteBatch(ids);
    }

    @Operation(summary = "编辑更新")
    @PutMapping
    @PreAuthorize("hasAnyAuthority('system:docs:edit')")
    public ResponseDTO edit(@RequestBody Docs docs) {
        return this.docsService.edit(docs);
    }

    @Operation(summary = "查询")
    @GetMapping("/{id}")
    public ResponseDTO query(@Parameter(description = "文件ID") @PathVariable Integer id) {
        return this.docsService.query(id);
    }

    @Operation(summary = "分页条件查询")
    @GetMapping
    @PreAuthorize("hasAnyAuthority('system:docs:list','system:docs:search')")
    public ResponseDTO list(@Parameter(description = "页码") @RequestParam(defaultValue = "1") Integer current,
                            @Parameter(description = "每页条数") @RequestParam(defaultValue = "10") Integer size,
                            @Parameter(description = "原文件名") String oldName,
                            @Parameter(description = "员工姓名") String staffName) {
        return this.docsService.list(current, size, oldName, staffName);
    }

    @Operation(summary = "数据导出接口")
    @GetMapping("/export/{filename}")
    @PreAuthorize("hasAnyAuthority('system:docs:export')")
    public void export(HttpServletResponse response,
                       @Parameter(description = "文件名") @PathVariable String filename) throws IOException {
        this.docsService.export(response,filename);
    }

    @Operation(summary = "数据导入接口")
    @PostMapping("/import")
    @PreAuthorize("hasAnyAuthority('system:docs:import')")
    public ResponseDTO imp(@Parameter(description = "导入文件") MultipartFile file) throws IOException {
        return this.docsService.imp(file);
    }


    @Operation(summary = "文件上传")
    @PostMapping("/upload/{id}")
    @PreAuthorize("hasAnyAuthority('system:docs:upload')")
    public ResponseDTO upload(@Parameter(description = "上传文件") MultipartFile file,
                              @Parameter(description = "员工ID") @PathVariable Integer id) throws IOException {
        return this.docsService.upload(file, id);
    }

    @Operation(summary = "文件下载")
    @GetMapping("/download/{filename}")
    @PreAuthorize("hasAnyAuthority('system:docs:download')")
    public void download(@Parameter(description = "文件名") @PathVariable String filename,
                         HttpServletResponse response) throws IOException {
        this.docsService.download(filename, response);
    }

    @Operation(summary = "头像下载")
    @GetMapping("/avatar/{filename}")
    public void getAvatar(@Parameter(description = "文件名") @PathVariable String filename,
                          HttpServletResponse response) throws IOException {
        this.docsService.download(filename, response);
    }
}
