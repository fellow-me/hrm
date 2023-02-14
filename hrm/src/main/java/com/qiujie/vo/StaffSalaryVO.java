package com.qiujie.vo;

import com.qiujie.annotation.ExcelColumn;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @Author qiujie
 * @Date 2022/4/8
 * @Version 1.0
 */

@Data
@Accessors(chain = true)
public class StaffSalaryVO implements Serializable {

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

    @ExcelColumn("迟到扣款")
    @ApiModelProperty("迟到扣款")
    private BigDecimal lateDeduct;

    @ExcelColumn("休假扣款")
    @ApiModelProperty("休假扣款")
    private BigDecimal leaveDeduct;

    @ExcelColumn("早退扣款")
    @ApiModelProperty("早退扣款")
    private BigDecimal leaveEarlyDeduct;

    @ExcelColumn("旷工扣款")
    @ApiModelProperty("旷工扣款")
    private BigDecimal absenteeismDeduct;

    @ExcelColumn("公积金缴纳费用")
    @ApiModelProperty("公积金缴纳费用")
    private BigDecimal housePay;

    @ExcelColumn("社保缴纳费用")
    @ApiModelProperty("社保缴纳费用")
    private BigDecimal socialPay;

    @ExcelColumn("基础工资")
    @ApiModelProperty("基础工资")
    private BigDecimal baseSalary;

    @ApiModelProperty("加班费")
    private BigDecimal overtimeSalary;

    @ApiModelProperty("备注")
    private String remark;

    @ExcelColumn("生活补贴")
    @ApiModelProperty("生活补贴")
    private BigDecimal subsidy;

    @ExcelColumn("奖金")
    @ApiModelProperty("奖金")
    private BigDecimal bonus;

    @ApiModelProperty("月份")
    private String month;

    @ExcelColumn("最终工资")
    @ApiModelProperty("最终工资")
    private BigDecimal totalSalary;

}
