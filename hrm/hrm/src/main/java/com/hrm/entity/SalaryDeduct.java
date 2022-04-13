package com.hrm.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * <p>
 * 工资扣除表
 * </p>
 *
 * @author qiujie
 * @since 2022-03-27
 */
@Getter
@Setter
@TableName("sal_salary_deduct")
@ApiModel(value = "SalaryDeduct对象", description = "工资扣除表")
public class SalaryDeduct implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("部门id")
    @TableField("dept_id")
    private Integer deptId;

    @ApiModelProperty("扣款类型id")
    @TableField("type_id")
    private Integer typeId;

    @ApiModelProperty("时间界限")
    @TableField("time_limit")
    private Integer timeLimit;

    @ApiModelProperty("当小于时间界限时的次数界限")
    @TableField("lt_times_limit")
    private Integer ltTimesLimit;

    @ApiModelProperty("当小于时间界限且小于次数界限时的罚款")
    @TableField("ll_deduct")
    private BigDecimal llDeduct;

    @ApiModelProperty("当小于时间界限且大于次数界限时的罚款")
    @TableField("lg_deduct")
    private BigDecimal lgDeduct;

    @ApiModelProperty("当大于时间界限时的次数界限")
    @TableField("gt_times_limit")
    private Integer gtTimesLimit;

    @ApiModelProperty("当大于时间界限且大于次数界限时的罚款")
    @TableField("gl_deduct")
    private BigDecimal glDeduct;

    @ApiModelProperty("当大于时间界限且大于次数界限时的罚款")
    @TableField("gg_deduct")
    private BigDecimal ggDeduct;

    @ApiModelProperty("0分钟，1小时，2天，默认0，统计的类型，如根据天计算、小时计算、分钟计算")
    @TableField("count_type")
    private Integer countType;

    @ApiModelProperty("1启用，0禁用，默认1")
    @TableField("status")
    private Integer status;

    @ApiModelProperty("备注")
    @TableField("remark")
    private String remark;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty("创建时间")
    @TableField("create_time")
    private Timestamp createTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty("修改时间")
    @TableField("update_time")
    private Timestamp updateTime;

    @ApiModelProperty("0未删除，1已删除，默认为0")
    @TableField("is_deleted")
    @TableLogic
    private Integer deleteFlag;


}
