package com.hrm.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @Author qiujie
 * @Date 2022/4/5
 * @Version 1.0
 */

@Data
public class LeaveVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    @ApiModelProperty("假期名称")
    private String name;

    @ApiModelProperty("休假类型id")
    private Integer typeId;

    @ApiModelProperty("部门id")
    private Integer deptId;

    @ApiModelProperty("休假天数")
    private Integer days;

    @ApiModelProperty("0禁用，1正常，默认1")
    private Integer status;

}
