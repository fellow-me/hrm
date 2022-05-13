package com.hrm.service;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hrm.dto.Response;
import com.hrm.dto.ResponseDTO;
import com.hrm.entity.Attendance;
import com.hrm.entity.WorkTime;
import com.hrm.enums.AttendanceStatusEnum;
import com.hrm.enums.BusinessStatusEnum;
import com.hrm.exception.ServiceException;
import com.hrm.mapper.AttendanceMapper;
import com.hrm.mapper.StaffMapper;
import com.hrm.mapper.WorkTimeMapper;
import com.hrm.util.DatetimeUtil;
import com.hrm.util.HutoolExcelUtil;
import com.hrm.vo.AttendanceMonthVO;
import com.hrm.vo.StaffAttendanceVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author qiujie
 * @since 2022-03-29
 */
@Service
public class AttendanceService extends ServiceImpl<AttendanceMapper, Attendance> {

    @Resource
    private AttendanceMapper attendanceMapper;

    @Resource
    private WorkTimeMapper workTimeMapper;

    @Resource
    private StaffMapper staffMapper;

    public ResponseDTO add(Attendance attendance) {
        if (save(attendance)) {
            return Response.success();
        }
        return Response.error();
    }

    public ResponseDTO deleteById(Integer id) {
        if (removeById(id)) {
            return Response.success();
        }
        return Response.error();
    }

    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO deleteBatch(List<Integer> ids) {
        if (removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.error();
    }


    public ResponseDTO edit(Attendance attendance) {
        if (updateById(attendance)) {
            return Response.success();
        }
        return Response.error();
    }


    public ResponseDTO findById(Integer id) {
        Attendance attendance = getById(id);
        if (attendance != null) {
            return Response.success(attendance);
        }
        return Response.error();
    }


    public ResponseDTO list(Integer current, Integer size, String name, String month) {
        IPage<StaffAttendanceVO> config = new Page<>(current, size);
        // 解决当搜索条件为空时，默认查询所有数据
        if (name == null) {
            name = "";
        }
        // 如果没有指明月份，就默认显示当前月份的考勤数据
        if (month == null) {
            month = DateUtil.format(new java.util.Date(), "yyyyMM");
        }
        IPage<StaffAttendanceVO> page = this.staffMapper.listStaffAttendanceVO(config, name);
        // 每页展示的数据
        List<StaffAttendanceVO> staffDeptVOList = page.getRecords();
        String[] monthDayList = DatetimeUtil.getMonthDayList(month);
        for (StaffAttendanceVO staffDeptVO : staffDeptVOList) {
            // 获取当前月的日期，格式为yyyyMMdd
            List<Attendance> attendanceList = new ArrayList<>();
            for (String day : monthDayList) {
                Attendance attendance = this.attendanceMapper.findByStaffId(staffDeptVO.getStaffId(), day);
                // 如果考勤数据不存在，就重新设置数据
                if (attendance == null) {
                    Date date = DateUtil.parse(day, "yyyyMMdd").toSqlDate();
                    Attendance temp = new Attendance();
                    // 如果是周末就休假
                    if (DateUtil.isWeekend(date)) {
                        temp.setStatus(AttendanceStatusEnum.LEAVE);
                    } else {
                        temp.setStatus(AttendanceStatusEnum.NORMAL);
                    }
                    temp.setAttendanceDate(date).setStaffId(staffDeptVO.getStaffId());
                    attendanceList.add(temp);
                } else {
                    attendanceList.add(attendance);
                }
            }
            staffDeptVO.setAttendanceList(attendanceList);
        }
        // 将响应数据填充到map中
        Map map = new HashMap();
        map.put("pages", page.getPages());
        map.put("total", page.getTotal());
        map.put("list", staffDeptVOList);
        map.put("dayNum", monthDayList.length);
        map.put("month", month);
        return Response.success(map);
    }

    /**
     * 导出员工月考勤数据
     *
     * @param response
     * @param month
     * @return
     */
    public ResponseDTO export(HttpServletResponse response, String month) throws IOException {
        List<AttendanceMonthVO> list = this.staffMapper.findAttendanceMonthVO();
        for (AttendanceMonthVO attendanceMonthVO : list) {
            // 设置迟到次数
            attendanceMonthVO.setLateTimes(this.attendanceMapper.countTimes(attendanceMonthVO.getStaffId(),
                    AttendanceStatusEnum.LATE.getCode(), month));
            // 设置早退次数
            attendanceMonthVO.setLeaveEarlyTimes(this.attendanceMapper.countTimes(attendanceMonthVO.getStaffId(),
                    AttendanceStatusEnum.LEAVE_EARLY.getCode(), month));
            // 设置旷工次数
            attendanceMonthVO.setAbsenteeismTimes(this.attendanceMapper.countTimes(attendanceMonthVO.getStaffId(),
                    AttendanceStatusEnum.ABSENTEEISM.getCode(), month));
            // 设置休假天数
            List<Date> leaveDateList = this.attendanceMapper.findLeaveDate(attendanceMonthVO.getStaffId(),
                    AttendanceStatusEnum.LEAVE.getCode(), month);
            int count = 0;
            for (Date date : leaveDateList) {
                // 不包括周末
                if (!DateUtil.isWeekend(date)) {
                    count++;
                }
            }
            attendanceMonthVO.setLeaveDays(count);
        }
        String yearMonth = month.substring(0, 4) + "年" + month.substring(4) + "月";
        HutoolExcelUtil.writeExcel(response, list, yearMonth + "考勤报表", AttendanceMonthVO.class);
        return Response.success();
    }

    /**
     * 数据导入
     *
     * @param file
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO imp(MultipartFile file) throws IOException {
        InputStream inputStream = file.getInputStream();
        List<Attendance> list = HutoolExcelUtil.readExcel(inputStream, 1, Attendance.class);
        for (Attendance attendance : list) {
            // 判断是否是周末，如果是周末就不用记录考勤情况，如果不是周末就判断员工是否请假
            if (attendance.getStaffId() == null || attendance.getAttendanceDate() == null ||
                    DateUtil.isWeekend(attendance.getAttendanceDate()) || isLeave(attendance)) {
                continue;
            } else {
                WorkTime workTime = this.workTimeMapper.findDeptWorkTimeByStaffId(attendance.getStaffId());
                if (isAbsenteeism(attendance, workTime)) {
                    attendance.setStatus(AttendanceStatusEnum.ABSENTEEISM);
                } else if (isLate(attendance, workTime)) {
                    attendance.setStatus(AttendanceStatusEnum.LATE);
                } else if (isLeaveEarly(attendance, workTime)) {
                    attendance.setStatus(AttendanceStatusEnum.LEAVE_EARLY);
                } else {
                    attendance.setStatus(AttendanceStatusEnum.NORMAL);
                }
                QueryWrapper<Attendance> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("staff_id", attendance.getStaffId()).eq("attendance_date", attendance.getAttendanceDate());
                if (!saveOrUpdate(attendance, queryWrapper)) {
                    throw new ServiceException(BusinessStatusEnum.DATA_IMPORT_ERROR);
                }
            }
        }
        return Response.success();
    }


    /**
     * 查找员工最近一次休假的日期
     *
     * @param id
     * @return
     */
    public ResponseDTO findByStaffId(Integer id) {
        QueryWrapper<Attendance> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("staff_id", id).eq("status", AttendanceStatusEnum.LEAVE.getCode()).orderBy(true, false, "attendance_date");
        List<Attendance> list = list(queryWrapper);
        if (list.size() > 0) {
            return Response.success(list.get(0));
        }
        return Response.success();
    }


    public ResponseDTO setAttendance(Attendance attendance) {
        QueryWrapper<Attendance> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("staff_id", attendance.getStaffId()).eq("attendance_date", attendance.getAttendanceDate());
        if (saveOrUpdate(attendance)) {
            return Response.success();
        }
        return Response.error();
    }


    /**
     * 是否迟到
     *
     * @param attendance
     * @param workTime
     * @return
     */
    private boolean isLate(Attendance attendance, WorkTime workTime) {
        if (DateUtil.compare(attendance.getMorStartTime(), workTime.getMorStartTime(), "HH:mm:ss") > 0) {
            return true;
        } else if (DateUtil.compare(attendance.getAftStartTime(), workTime.getAftStartTime(), "HH:mm:ss") > 0) {
            return true;
        }
        return false;
    }

    /**
     * 是否早退
     *
     * @param attendance
     * @param workTime
     * @return
     */
    private boolean isLeaveEarly(Attendance attendance, WorkTime workTime) {
        if (DateUtil.compare(attendance.getMorEndTime(), workTime.getMorEndTime(), "HH:mm:ss") < 0) {
            return true;
        } else if (DateUtil.compare(attendance.getAftEndTime(), workTime.getAftEndTime(), "HH:mm:ss") < 0) {
            return true;
        }
        return false;
    }


    /**
     * 是否旷工，如果4个打卡，有一个没打卡，就视为旷工，如果既迟到又早退，也使视为旷工
     *
     * @param attendance
     * @param workTime
     * @return
     */
    private boolean isAbsenteeism(Attendance attendance, WorkTime workTime) {
        if (attendance.getMorStartTime() == null || attendance.getMorEndTime() == null || attendance.getAftStartTime() == null || attendance.getAftEndTime() == null) {
            return true;
        }
        return isLate(attendance, workTime) && isLeaveEarly(attendance, workTime);
    }

    /**
     * 判断员工是否请假
     *
     * @param attendance
     * @return
     */
    private boolean isLeave(Attendance attendance) {
        QueryWrapper<Attendance> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("staff_id", attendance.getStaffId()).eq("attendance_date", attendance.getAttendanceDate());
        Attendance one = getOne(queryWrapper);
        if (one != null) {
            if (one.getStatus() == AttendanceStatusEnum.LEAVE) {
                return true;
            }
            return false;
        }
        return false;
    }
}




