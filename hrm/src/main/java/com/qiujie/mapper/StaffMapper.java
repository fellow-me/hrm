package com.qiujie.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.qiujie.entity.Staff;
import com.qiujie.vo.AttendanceMonthVO;
import com.qiujie.vo.StaffAttendanceVO;
import com.qiujie.vo.StaffDeptVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author qiujie
 * @since 2022-01-27
 */
public interface StaffMapper extends BaseMapper<Staff> {

    @Select("select ss.id staff_id,ss.dept_id,ss.code,ss.name,ss.phone,ss.address,sd.name dept_name from sys_staff ss inner join sys_dept sd on ss.dept_id = sd.id " +
            "where ss.is_deleted = 0 and ss.name like concat('%',#{name},'%')")
    IPage<StaffAttendanceVO> listStaffAttendanceVO(IPage<StaffAttendanceVO> config, @Param("name") String name);

    @Select("select ss.id staff_id,ss.dept_id,ss.code,ss.name,ss.phone,ss.address,sd.name dept_name from sys_staff ss inner join sys_dept sd on ss.dept_id = sd.id " +
            "where ss.is_deleted = 0 and ss.dept_id = #{deptId} and ss.name like concat('%',#{name},'%')")
    IPage<StaffAttendanceVO> listStaffDeptAttendanceVO(IPage<StaffAttendanceVO> config, @Param("name") String name,@Param("deptId") Integer deptId);

    @Select("select ss.id staff_id,ss.dept_id,ss.code,ss.name,ss.phone,ss.address,sd.name dept_name from sys_staff ss inner join sys_dept sd on ss.dept_id = sd.id where ss.is_deleted = 0")
    List<AttendanceMonthVO> findAttendanceMonthVO();

    @Select("select ss.id , ss.code, ss.name, ss.gender, ss.pwd password, ss.avatar, ss.birthday, ss.phone, ss.address, ss.remark,ss.status, ss.dept_id,sd.name dept_name from sys_staff ss left join sys_dept sd on ss.dept_id = sd.id where ss.is_deleted = 0 and ss.code = #{code} and ss.pwd = #{pwd} ")
    StaffDeptVO findStaffInfo(@Param("code") String code, @Param("pwd") String password);

    @Select("select ss.id , ss.code, ss.name, ss.gender, ss.avatar, ss.birthday, ss.phone, ss.address, ss.remark,ss.status, ss.dept_id,sd.name dept_name from sys_staff ss left join sys_dept sd on ss.dept_id = sd.id where ss.is_deleted = 0 and ss.id = #{id}")
    StaffDeptVO findInfo(@Param("id") Integer id);

    @Select("select ss.id , ss.code, ss.name, ss.gender, ss.pwd password, ss.avatar, ss.birthday, ss.phone, ss.address, ss.remark,ss.status, ss.dept_id,sd.name dept_name from sys_staff ss left join sys_dept sd on ss.dept_id = sd.id where ss.is_deleted = 0")
    List<StaffDeptVO> findStaffDeptVO();

}
