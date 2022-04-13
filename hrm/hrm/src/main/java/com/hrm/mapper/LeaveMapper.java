package com.hrm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hrm.entity.Leave;
import com.hrm.vo.LeaveVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 请假表 Mapper 接口
 * </p>
 *
 * @author qiujie
 * @since 2022-03-27
 */

public interface LeaveMapper extends BaseMapper<Leave> {


    @Select("select al.id,al.days,al.status,al.type_id,al.dept_id,alt.name from att_leave al inner join att_leave_type alt on al.type_id = alt.id where al.is_deleted = 0 and al.dept_id = #{id}")
    List<LeaveVO> findByDeptId(@Param("id") Integer id);

}
