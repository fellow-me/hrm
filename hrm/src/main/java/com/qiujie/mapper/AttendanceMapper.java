package com.qiujie.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qiujie.entity.Attendance;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.sql.Date;
import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author qiujie
 * @since 2022-03-29
 */

public interface AttendanceMapper extends BaseMapper<Attendance> {


    @Select("select * from att_attendance where is_deleted = 0 and staff_id = #{id} and date_format(attendance_date,'%Y%m%d') = #{day}")
    Attendance findByStaffId(@Param("id") Integer id, @Param("day") String day);

    /**
     * 统计员工迟到、早退、旷工的次数
     *
     * @param id     员工id
     * @param status
     * @param month  月份
     * @return
     */
    @Select("select count(*) from att_attendance where is_deleted = 0 and staff_id = #{id} and status = #{status} and date_format(attendance_date,'%Y%m') = #{month} ")
    Integer countTimes(@Param("id") Integer id, @Param("status") Integer status, @Param("month") String month);


    /**
     * 查找员工休假的日期
     *
     * @param id
     * @param month
     * @return
     */
    @Select("select attendance_date from att_attendance where is_deleted = 0 and staff_id = #{id} and status=#{status} and date_format(attendance_date,'%Y%m') = #{month} ")
    List<Date> findLeaveDate(@Param("id") Integer id, @Param("status") Integer status, @Param("month") String month);

}
