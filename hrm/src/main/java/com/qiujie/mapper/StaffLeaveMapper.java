package com.qiujie.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.qiujie.entity.StaffLeave;
import com.qiujie.vo.StaffLeaveVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author qiujie
 * @since 2022-04-05
 */
public interface StaffLeaveMapper extends BaseMapper<StaffLeave> {


    @Select("select * from att_staff_leave where is_deleted = 0 and staff_id = #{id}")
    IPage<StaffLeave> listStaffLeaveByStaffId(IPage<StaffLeave> config, @Param("id") Integer id);

    /**
     * 不显示撤销的请假申请
     *
     * @param config
     * @param name
     * @return
     */
    @Select("select asl.*,ss.code,ss.name ,ss.phone,sd.name dept_name from att_staff_leave asl inner join sys_staff ss on asl.staff_id = ss.id " +
            "inner join sys_dept sd on ss.dept_id = sd.id " +
            "where asl.is_deleted = 0 and asl.status != #{status} and ss.name like concat('%',#{name},'%')")
    IPage<StaffLeaveVO> listStaffLeaveVO(IPage<StaffLeaveVO> config,@Param("status") Integer status, @Param("name") String name);

    @Select("select asl.*,ss.code,ss.name ,ss.phone,sd.name dept_name from att_staff_leave asl inner join sys_staff ss on asl.staff_id = ss.id " +
            "inner join sys_dept sd on ss.dept_id = sd.id " +
            "where asl.is_deleted = 0 and ss.dept_id = #{deptId} and asl.status != #{status} and ss.name like concat('%',#{name},'%')")
    IPage<StaffLeaveVO> listStaffDeptLeaveVO(IPage<StaffLeaveVO> config,@Param("status") Integer status, @Param("name") String name,@Param("deptId") Integer deptId);

}
