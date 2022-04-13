package com.hrm.enums;


import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @Author qiujie
 * @Date 2022/3/31
 * @Version 1.0
 */

@Getter
@AllArgsConstructor
public enum AttendanceStatusEnum implements BaseEnum {

    NORMAL(0, "正常"),
    LATE(1, "迟到"),
    LEAVE_EARLY(2, "早退"),
    ABSENTEEISM(3, "旷工"),
    LEAVE(4, "休假");

    @EnumValue
    private final Integer code;
    @JsonValue
    private final String message;
}
