package com.hrm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hrm.entity.WorkTime;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 * 工作时间表 Mapper 接口
 * </p>
 *
 * @author qiujie
 * @since 2022-03-26
 */

public interface WorkTimeMapper extends BaseMapper<WorkTime> {

    @Select("select att.* from sys_staff ss inner join sys_dept sd on ss.dept_id = sd.id inner join att_work_time att on att.dept_id = sd.id where ss.is_deleted = 0 and ss.id = #{id} ")
    WorkTime findDeptWorkTimeByStaffId(@Param("id") Integer id);

}
