package com.qiujie.vo;

import com.qiujie.annotation.ExcelColumn;
import io.swagger.v3.oas.annotations.media.Schema;
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

    @Schema(description = "员工id")
    private Integer staffId;

    @Schema(description = "部门id")
    private Integer deptId;

    @ExcelColumn("员工工号")
    @Schema(description = "员工工号")
    private String code;

    @ExcelColumn("员工姓名")
    @Schema(description = "员工姓名")
    private String name;

    @ExcelColumn("电话")
    @Schema(description = "电话")
    private String phone;

    @ExcelColumn("地址")
    @Schema(description = "地址")
    private String address;

    @ExcelColumn("部门")
    @Schema(description = "部门")
    private String deptName;

    @ExcelColumn("迟到扣款")
    @Schema(description = "迟到扣款")
    private BigDecimal lateDeduct;

    @ExcelColumn("休假扣款")
    @Schema(description = "休假扣款")
    private BigDecimal leaveDeduct;

    @ExcelColumn("早退扣款")
    @Schema(description = "早退扣款")
    private BigDecimal leaveEarlyDeduct;

    @ExcelColumn("旷工扣款")
    @Schema(description = "旷工扣款")
    private BigDecimal absenteeismDeduct;

    @ExcelColumn("公积金缴纳费用")
    @Schema(description = "公积金缴纳费用")
    private BigDecimal housePay;

    @ExcelColumn("社保缴纳费用")
    @Schema(description = "社保缴纳费用")
    private BigDecimal socialPay;

    @ExcelColumn("基础工资")
    @Schema(description = "基础工资")
    private BigDecimal baseSalary;

    @ExcelColumn("加班费")
    @Schema(description = "加班费")
    private BigDecimal overtimeSalary;

    @Schema(description = "备注")
    private String remark;

    @ExcelColumn("生活补贴")
    @Schema(description = "生活补贴")
    private BigDecimal subsidy;

    @ExcelColumn("奖金")
    @Schema(description = "奖金")
    private BigDecimal bonus;

    @Schema(description = "月份")
    private String month;

    @ExcelColumn("最终工资")
    @Schema(description = "最终工资")
    private BigDecimal totalSalary;

}
