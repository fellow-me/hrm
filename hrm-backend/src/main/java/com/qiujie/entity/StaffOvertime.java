package com.qiujie.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.qiujie.annotation.ExcelColumn;
import com.qiujie.enums.OvertimeEnum;
import com.qiujie.enums.OvertimeStatusEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.sql.Date;

/**
 * <p>
 * 员工考勤表
 * </p>
 *
 * @author qiujie
 * @since 2024-03-20
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("att_staff_overtime")
@Schema(description = "员工加班表")
public class StaffOvertime implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ExcelColumn("员工id")
    @Schema(description = "员工id")
    @TableField("staff_id")
    private Integer staffId;

    @ExcelColumn("上午上班时间")
    @Schema(description = "上午上班时间")
    @DateTimeFormat(pattern = "HH:mm")
    @JsonFormat(pattern = "HH:mm", timezone = "GMT+8")
    @TableField("mor_start_time")
    private Timestamp morStartTime;

    @ExcelColumn("上午下班时间")
    @Schema(description = "上午下班时间")
    @DateTimeFormat(pattern = "HH:mm")
    @JsonFormat(pattern = "HH:mm", timezone = "GMT+8")
    @TableField("mor_end_time")
    private Timestamp morEndTime;

    @ExcelColumn("下午上班时间")
    @Schema(description = "下午上班时间")
    @DateTimeFormat(pattern = "HH:mm")
    @JsonFormat(pattern = "HH:mm", timezone = "GMT+8")
    @TableField("aft_start_time")
    private Timestamp aftStartTime;

    @ExcelColumn("下午下班时间")
    @Schema(description = "下午下班时间")
    @DateTimeFormat(pattern = "HH:mm")
    @JsonFormat(pattern = "HH:mm", timezone = "GMT+8")
    @TableField("aft_end_time")
    private Timestamp aftEndTime;

    @ExcelColumn("加班日期")
    @Schema(description = "加班日期")
    @TableField("overtime_date")
    private Date overtimeDate;

    @Schema(description = "加班时长")
    @TableField("total_overtime")
    private BigDecimal totalOvertime;

    @Schema(description = "加班工资")
    @TableField("overtime_salary")
    private BigDecimal overtimeSalary;

    @Schema(description = "加班类型")
    @TableField("type_num")
    private OvertimeEnum typeNum;

    @Schema(description = "0正常，1加班，2调休")
    @TableField("status")
    private OvertimeStatusEnum status;

    @TableField("remark")
    private String remark;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "创建时间")
    @TableField("create_time")
    private Timestamp createTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "更新时间")
    @TableField("update_time")
    private Timestamp updateTime;

    @Schema(description = "逻辑删除，0未删除，1删除")
    @TableField("is_deleted")
    @TableLogic
    private Integer deleteFlag;


}
