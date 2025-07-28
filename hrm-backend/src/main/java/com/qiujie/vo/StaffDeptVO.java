package com.qiujie.vo;

import com.qiujie.annotation.ExcelColumn;
import com.qiujie.enums.GenderEnum;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.sql.Date;

/**
 * @Author qiujie
 * @Date 2022/4/9
 * @Version 1.0
 */

@Data
@Accessors(chain = true)
public class StaffDeptVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("员工id")
    private Integer id;

    @ExcelColumn("工号")
    @ApiModelProperty("员工编码")
    private String code;

    @ExcelColumn("姓名")
    @ApiModelProperty("员工姓名")
    private String name;

    @ExcelColumn("年龄")
    @ApiModelProperty("员工年龄")
    private Integer age;

    @ApiModelProperty("性别，0男，1女，默认0")
    private GenderEnum gender;

    @ExcelColumn("地址")
    @ApiModelProperty("员工家庭住址")
    private String address;

    @ApiModelProperty("部门id")
    private Integer deptId;

    @ExcelColumn("部门")
    @ApiModelProperty("部门")
    private String deptName;

    @ApiModelProperty("员工头像")
    private String avatar;

    @ExcelColumn("生日")
    @ApiModelProperty("员工生日")
    private Date birthday;

    @ExcelColumn("电话")
    @ApiModelProperty("员工电话")
    private String phone;

    @ExcelColumn("备注")
    @ApiModelProperty("员工备注")
    private String remark;


    @ApiModelProperty("员工状态，0异常，1正常")
    private Integer status;
}
