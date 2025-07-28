package com.qiujie.vo;

import com.qiujie.annotation.ExcelColumn;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @Author qiujie
 * @Date 2022/3/23
 * @Version 1.0
 */

@Data
public class StaffInsuranceVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "员工id")
    private Integer staffId;

    @Schema(description = "城市id")
    private Integer cityId;

    @Schema(description = "社保id")
    private Integer insuranceId;

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

    @ExcelColumn("公积金基数")
    @Schema(description = "公积金基数")
    private BigDecimal houseBase;

    @ExcelColumn("公积金个人缴纳比例")
    @Schema(description = "公积金个人缴纳比例")
    private BigDecimal perHouseRate;

    @ExcelColumn("公积金个人缴纳费用")
    @Schema(description = "公积金个人缴纳费用")
    private BigDecimal perHousePay;

    @ExcelColumn("公积金企业缴纳比例")
    @Schema(description = "公积金企业缴纳比例")
    private BigDecimal comHouseRate;

    @ExcelColumn("公积金企业缴纳费用")
    @Schema(description = "公积金企业缴纳费用")
    private BigDecimal comHousePay;

    @ExcelColumn("公积金备注")
    @Schema(description = "公积金备注")
    private String houseRemark;

    @ExcelColumn("社保基数")
    @Schema(description = "社保基数")
    private BigDecimal socialBase;

    @ExcelColumn("社保企业缴纳费用")
    @Schema(description = "社保企业缴纳费用")
    private BigDecimal comSocialPay;

    @ExcelColumn("社保个人缴纳费用")
    @Schema(description = "社保个人缴纳费用")
    private BigDecimal perSocialPay;

    @ExcelColumn("工伤保险企业缴纳比例")
    @Schema(description = "工伤保险企业缴纳比例")
    private BigDecimal comInjuryRate;

    @ExcelColumn("社保备注")
    @Schema(description = "社保备注")
    private String socialRemark;


}
