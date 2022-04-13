package com.hrm.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum BusinessStatusEnum implements BaseEnum {

    SUCCESS(200, "成功"),
    ERROR(300, "失败"),
    DATA_ERROR(400, "获取数据失败"),
    NOT_EXIST(500, "不存在"),
    FILE_READ_ERROR(600, "文件读取失败"),
    FILE_WRITE_ERROR(700, "文件写入失败"),
    FILE_UPLOAD_ERROR(800, "文件上传失败"),
    TOKEN_NOT_EXIST(900, "token不存在，请重新登录"),
    TOKEN_INVALID(1000, "token无效，请重新登录"),
    DATA_IMPORT_ERROR(1100, "数据导入失败"),
    BATCH_DELETE_ERROR(1200, "批量删除失败"),
    STAFF_STATUS_ERROR(10000, "状态异常，请联系管理员");

    private final Integer code;
    private final String message;
}
