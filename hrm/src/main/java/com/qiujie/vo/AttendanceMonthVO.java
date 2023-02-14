package com.qiujie.vo;

import com.qiujie.annotation.ExcelColumn;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @Author qiujie
 * @Date 2022/4/7
 * @Version 1.0
 */

@Data
public class AttendanceMonthVO implements Serializable {


    private static final long serialVersionUID = 1L;

    @ApiModelProperty("员工id")
    private Integer staffId;

    @ApiModelProperty("部门id")
    private Integer deptId;

    @ExcelColumn("员工工号")
    @ApiModelProperty("员工工号")
    private String code;

    @ExcelColumn("员工姓名")
    @ApiModelProperty("员工姓名")
    private String name;

    @ExcelColumn("电话")
    @ApiModelProperty("电话")
    private String phone;

    @ExcelColumn("地址")
    @ApiModelProperty("地址")
    private String address;

    @ExcelColumn("部门")
    @ApiModelProperty("部门")
    private String deptName;

    @ExcelColumn("迟到次数")
    private Integer lateTimes;

    @ExcelColumn("早退次数")
    private Integer leaveEarlyTimes;

    @ExcelColumn("旷工次数")
    private Integer absenteeismTimes;

    @ExcelColumn("休假天数")
    private Integer leaveDays;
}
