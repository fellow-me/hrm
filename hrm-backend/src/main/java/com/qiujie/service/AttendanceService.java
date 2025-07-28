package com.qiujie.service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.qiujie.util.EnumUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qiujie.dto.Response;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.entity.Attendance;
import com.qiujie.entity.Dept;
import com.qiujie.enums.AttendanceStatusEnum;
import com.qiujie.enums.BusinessStatusEnum;
import com.qiujie.exception.ServiceException;
import com.qiujie.mapper.AttendanceMapper;
import com.qiujie.mapper.DeptMapper;
import com.qiujie.mapper.StaffMapper;
import com.qiujie.util.DatetimeUtil;
import com.qiujie.util.HutoolExcelUtil;
import com.qiujie.vo.AttendanceMonthVO;
import com.qiujie.vo.StaffAttendanceVO;

import cn.hutool.core.date.DateUtil;

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

    @Autowired
    private AttendanceMapper attendanceMapper;

    @Autowired
    private DeptMapper deptMapper;

    @Autowired
    private StaffMapper staffMapper;

    @Autowired
    private DatetimeUtil datetimeUtil;

    public ResponseDTO add(Attendance attendance) {
        if (save(attendance)) {
            return Response.success();
        }
        return Response.error();
    }

    public ResponseDTO delete(Integer id) {
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

    public ResponseDTO query(Integer id) {
        Attendance attendance = getById(id);
        if (attendance != null) {
            return Response.success(attendance);
        }
        return Response.error();
    }


    public ResponseDTO list(Integer current, Integer size, String name, Integer deptId, String month) {
        IPage<StaffAttendanceVO> config = new Page<>(current, size);
        // 解决当搜索条件为空时，默认查询所有数据
        if (name == null) {
            name = "";
        }
        IPage<StaffAttendanceVO> page;
        if (deptId == null) {
            page = this.staffMapper.listStaffAttendanceVO(config, name);
        } else {
            page = this.staffMapper.listStaffDeptAttendanceVO(config, name, deptId);
        }
        // 每页展示的数据
        List<StaffAttendanceVO> staffDeptVOList = page.getRecords();
        // 如果没有指明月份，就默认显示当前月份的考勤数据
        if (month == null) {
            month = DateUtil.format(new java.util.Date(), "yyyyMM");
        }
        String[] monthDayList = this.datetimeUtil.getMonthDayList(month);
        for (StaffAttendanceVO staffDeptVO : staffDeptVOList) {
            // 获取当前月的日期，格式为yyyyMMdd
            List<HashMap<String, Object>> list = new ArrayList<>();
            for (String day : monthDayList) {
                HashMap<String, Object> map = new HashMap<>();
                Attendance attendance = this.attendanceMapper.queryByStaffIdAndDate(staffDeptVO.getStaffId(), day);
                // 如果考勤数据不存在，就重新设置数据
                if (attendance == null) {
                    Date date = DateUtil.parse(day, "yyyyMMdd").toSqlDate();
                    // 如果是周末或法定假期就休假
                    if (DateUtil.isWeekend(date) || this.datetimeUtil.isHoliday(date)) {
                        map.put("message", AttendanceStatusEnum.LEAVE.getMessage());
                        map.put("tagType", AttendanceStatusEnum.LEAVE.getTagType());
                    } else {
                        map.put("message", AttendanceStatusEnum.NORMAL.getMessage());
                        map.put("tagType", AttendanceStatusEnum.NORMAL.getTagType());
                    }
                    map.put("attendanceDate", date);
                } else {
                    map.put("message", attendance.getStatus().getMessage());
                    map.put("tagType", attendance.getStatus().getTagType());
                    map.put("attendanceDate", attendance.getAttendanceDate());
                }
                list.add(map);
            }
            staffDeptVO.setAttendanceList(list);
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
     * @param filename
     * @return
     */
    public void export(HttpServletResponse response, String month, String filename) throws IOException {
        List<AttendanceMonthVO> list = this.staffMapper.queryAttendanceMonthVO();
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
            // 设置调休的天数
            attendanceMonthVO.setTimeOffDays(this.attendanceMapper.countTimes(attendanceMonthVO.getStaffId(),
                    AttendanceStatusEnum.TIME_OFF.getCode(), month));
            // 设置休假天数
            List<Date> leaveDateList = this.attendanceMapper.queryLeaveDate(attendanceMonthVO.getStaffId(),
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
        HutoolExcelUtil.writeExcel(response, list, filename, AttendanceMonthVO.class);
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
            }
            Dept dept = this.deptMapper.queryByStaffId(attendance.getStaffId());
            if (isAbsenteeism(attendance, dept)) {
                attendance.setStatus(AttendanceStatusEnum.ABSENTEEISM);
            } else if (isLate(attendance, dept)) {
                attendance.setStatus(AttendanceStatusEnum.LATE);
            } else if (isLeaveEarly(attendance, dept)) {
                attendance.setStatus(AttendanceStatusEnum.LEAVE_EARLY);
            } else {
                attendance.setStatus(AttendanceStatusEnum.NORMAL);
            }
            QueryWrapper<Attendance> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("staff_id", attendance.getStaffId()).eq("attendance_date",
                    attendance.getAttendanceDate());
            if (!saveOrUpdate(attendance, queryWrapper)) {
                return Response.error(BusinessStatusEnum.DATA_IMPORT_ERROR);
            }
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
     * @param dept
     * @return
     */
    private boolean isLate(Attendance attendance, Dept dept) {
        if (DateUtil.compare(attendance.getMorStartTime(), dept.getMorStartTime(), "HH:mm:ss") > 0) {
            return true;
        } else if (DateUtil.compare(attendance.getAftStartTime(), dept.getAftStartTime(), "HH:mm:ss") > 0) {
            return true;
        }
        return false;
    }

    /**
     * 是否早退
     *
     * @param attendance
     * @param dept
     * @return
     */
    private boolean isLeaveEarly(Attendance attendance, Dept dept) {
        if (DateUtil.compare(attendance.getMorEndTime(), dept.getMorEndTime(), "HH:mm:ss") < 0) {
            return true;
        } else if (DateUtil.compare(attendance.getAftEndTime(), dept.getAftEndTime(), "HH:mm:ss") < 0) {
            return true;
        }
        return false;
    }

    /**
     * 是否旷工，如果4个打卡，有一个没打卡，就视为旷工，如果既迟到又早退，也使视为旷工
     *
     * @param attendance
     * @param dept
     * @return
     */
    private boolean isAbsenteeism(Attendance attendance, Dept dept) {
        if (attendance.getMorStartTime() == null || attendance.getMorEndTime() == null
                || attendance.getAftStartTime() == null || attendance.getAftEndTime() == null) {
            return true;
        }
        return isLate(attendance, dept) && isLeaveEarly(attendance, dept);
    }

    /**
     * 判断员工是否请假或调休
     *
     * @param attendance
     * @return
     */
    private boolean isLeave(Attendance attendance) {
        QueryWrapper<Attendance> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("staff_id", attendance.getStaffId()).eq("attendance_date", attendance.getAttendanceDate());
        Attendance one = getOne(queryWrapper);
        if (one != null) {
            return one.getStatus() == AttendanceStatusEnum.LEAVE || one.getStatus() == AttendanceStatusEnum.TIME_OFF;
        }
        return false;
    }

    public ResponseDTO queryAll() {
        List<Map<String, Object>> enumList = EnumUtil.getEnumList(AttendanceStatusEnum.class);
        for (Map<String, Object> map : enumList) {
            for (AttendanceStatusEnum attendanceStatusEnum : AttendanceStatusEnum.values()) {
                if (map.get("code") == attendanceStatusEnum.getCode()) {
                    map.put("tagType", attendanceStatusEnum.getTagType());
                }
            }
        }
        return Response.success(enumList);
    }

    public ResponseDTO queryByStaffIdAndDate(Integer id, String date) {
        Attendance attendance = this.attendanceMapper.queryByStaffIdAndDate(id, date.replace("-", ""));
        if (attendance != null) {
            return Response.success(attendance);
        }
        return Response.error();
    }
}
