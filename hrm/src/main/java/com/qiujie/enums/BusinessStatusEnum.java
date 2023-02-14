package com.qiujie.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.apache.poi.ss.formula.functions.T;

@Getter
@AllArgsConstructor
public enum BusinessStatusEnum implements BaseEnum<T> {

    SUCCESS(200, "成功"),
    ERROR(300, "失败"),
    FILE_NOT_EXIST(400, "文件不存在"),
    FILE_READ_ERROR(500, "文件读取失败"),
    FILE_WRITE_ERROR(600, "文件写入失败"),
    FILE_UPLOAD_ERROR(700, "文件上传失败"),
    TOKEN_NOT_EXIST(800, "token不存在，请重新登录"),
    TOKEN_INVALID(900, "token无效，请重新登录"),
    DATA_IMPORT_ERROR(1000, "数据导入失败"),
    BATCH_DELETE_ERROR(1100, "批量删除失败"),
    STAFF_NOT_EXIST(1200,"没有此员工，请重新登录"),
    STAFF_STATUS_ERROR(1300, "状态异常，请联系管理员");

    private final Integer code;
    private final String message;
}
