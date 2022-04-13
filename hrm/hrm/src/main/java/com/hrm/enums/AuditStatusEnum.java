package com.hrm.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @Author qiujie
 * @Date 2022/4/7
 * @Version 1.0
 */

@Getter
@AllArgsConstructor
public enum AuditStatusEnum implements BaseEnum {

    UNAUDITED(0, "未审核"),
    APPROVE(1, "审核通过"),
    REJECT(2, "驳回"),
    CANCEL(3, "撤销");

    @EnumValue
    private final Integer code;
    @JsonValue
    private final String message;
}
