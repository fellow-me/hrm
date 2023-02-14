package com.qiujie.controller;

import com.qiujie.entity.Docs;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.service.DocsService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class DocsController {

    @Resource
    private DocsService docsService;

    @ApiOperation("新增")
    @PostMapping
    public ResponseDTO add(@RequestBody Docs docs) {
        return this.docsService.add(docs);
    }

    @ApiOperation("逻辑删除")
    @DeleteMapping("/{id}")
    public ResponseDTO deleteById(@PathVariable Integer id) {
        return this.docsService.deleteById(id);
    }

    @ApiOperation("批量逻辑删除")
    @DeleteMapping("/batch/{ids}")
    public ResponseDTO deleteBatch(@PathVariable List<Integer> ids) {
        return this.docsService.deleteBatch(ids);
    }

    @ApiOperation("编辑更新")
    @PutMapping
    public ResponseDTO edit(@RequestBody Docs docs) {
        return this.docsService.edit(docs);
    }

    @ApiOperation("查询")
    @GetMapping("/{id}")
    public ResponseDTO findById(@PathVariable Integer id) {
        return this.docsService.findById(id);
    }

    @ApiOperation("分页条件查询")
    @GetMapping
    public ResponseDTO list(@RequestParam(defaultValue = "1") Integer current, @RequestParam(defaultValue = "10") Integer size, String oldName,String staffName) {
        return this.docsService.list(current, size, oldName,staffName);
    }

    @ApiOperation("数据导出接口")
    @GetMapping("/export")
    public ResponseDTO export(HttpServletResponse response) throws IOException {
        return this.docsService.export(response);
    }

    @ApiOperation("数据导入接口")
    @PostMapping("/import")
    public ResponseDTO imp(MultipartFile file) throws IOException {
        return this.docsService.imp(file);
    }


    @ApiOperation("文件上传")
    @PostMapping("/upload")
    public ResponseDTO upload(MultipartFile file, HttpServletRequest request) throws IOException {
        return this.docsService.upload(file,request);
    }

    @ApiOperation("文件下载")
    @GetMapping("/download/{filename}")
    public ResponseDTO download(@PathVariable String filename, HttpServletResponse response) throws IOException {
        return this.docsService.download(filename, response);
    }
}
