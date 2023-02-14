package com.qiujie.vo;

import com.qiujie.annotation.ExcelColumn;
import com.qiujie.enums.PayStatusEnum;
import io.swagger.annotations.ApiModelProperty;
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

    @ApiModelProperty("员工id")
    private Integer staffId;

    @ApiModelProperty("城市id")
    private Integer cityId;

    @ApiModelProperty("社保id")
    private Integer insuranceId;

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

    @ExcelColumn("公积金基数")
    @ApiModelProperty("公积金基数")
    private BigDecimal houseBase;

    @ExcelColumn("公积金个人缴纳比例")
    @ApiModelProperty("公积金个人缴纳比例")
    private BigDecimal perHouseRate;

    @ExcelColumn("公积金个人缴纳费用")
    @ApiModelProperty("公积金个人缴纳费用")
    private BigDecimal perHousePay;

    @ExcelColumn("公积金企业缴纳比例")
    @ApiModelProperty("公积金企业缴纳比例")
    private BigDecimal comHouseRate;

    @ExcelColumn("公积金企业缴纳费用")
    @ApiModelProperty("公积金企业缴纳费用")
    private BigDecimal comHousePay;

    @ExcelColumn("公积金备注")
    @ApiModelProperty("公积金备注")
    private String houseRemark;

    @ExcelColumn("社保基数")
    @ApiModelProperty("社保基数")
    private BigDecimal socialBase;

    @ExcelColumn("社保企业缴纳费用")
    @ApiModelProperty("社保企业缴纳费用")
    private BigDecimal comSocialPay;

    @ExcelColumn("社保个人缴纳费用")
    @ApiModelProperty("社保个人缴纳费用")
    private BigDecimal perSocialPay;

    @ExcelColumn("工伤保险企业缴纳比例")
    @ApiModelProperty("工伤保险企业缴纳比例")
    private BigDecimal comInjuryRate;

    @ExcelColumn("社保备注")
    @ApiModelProperty("社保备注")
    private String socialRemark;

    @ApiModelProperty("0未支付，1已支付，2支付失败")
    private PayStatusEnum status;

}
