package com.hrm.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hrm.annotation.ExcelColumn;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

/**
 * @Author qiujie
 * @Date 2022/3/26
 * @Version 1.0
 */

@Data
public class DeptWorkTimeVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("部门id")
    private Integer id;

    @ApiModelProperty("部门编码")
    private String code;

    @ExcelColumn("部门名称")
    @ApiModelProperty("部门名称")
    private String name;

    @ExcelColumn("备注")
    @ApiModelProperty("备注")
    private String remark;

    @ApiModelProperty("父级部门id，0根部门")
    private Integer parentId;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @ApiModelProperty("创建时间")
    private Timestamp createTime;

    @ApiModelProperty("上班时间id")
    private Integer workTimeId;

    @ExcelColumn("上午上班时间")
    @JsonFormat(pattern = "HH:mm", timezone = "GMT+8")
    @ApiModelProperty("上午上班时间")
    private Timestamp morStartTime;

    @ExcelColumn("上午下班时间")
    @JsonFormat(pattern = "HH:mm", timezone = "GMT+8")
    @ApiModelProperty("上午下班时间")
    private Timestamp morEndTime;

    @ExcelColumn("下午上班时间")
    @JsonFormat(pattern = "HH:mm", timezone = "GMT+8")
    @ApiModelProperty("下午上班时间")
    private Timestamp aftStartTime;

    @ExcelColumn("下午下班时间")
    @JsonFormat(pattern = "HH:mm", timezone = "GMT+8")
    @ApiModelProperty("下午下班时间")
    private Timestamp aftEndTime;

    @ApiModelProperty("员工的总工作时长")
    private BigDecimal totalWorkTime;

    @ApiModelProperty("子部门")
    private List<DeptWorkTimeVO> children;

}
