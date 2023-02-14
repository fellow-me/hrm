package com.qiujie.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.date.Quarter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.qiujie.dto.Response;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.entity.Attendance;
import com.qiujie.entity.City;
import com.qiujie.entity.Dept;
import com.qiujie.entity.Staff;
import com.qiujie.enums.AttendanceStatusEnum;
import com.qiujie.mapper.AttendanceMapper;
import com.qiujie.util.DatetimeUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author qiujie
 * @Date 2022/2/27
 * @Version 1.0
 */

@Service
public class HomeService {

    @Resource
    private StaffService staffService;

    @Resource
    private CityService cityService;

    @Resource
    private AttendanceMapper attendanceMapper;

    @Resource
    private AttendanceService attendanceService;

    @Resource
    private DeptService deptService;


    // 统计当前年份入职员工数量
    public ResponseDTO getStaffData() {
        QueryWrapper queryWrapper = new QueryWrapper<Attendance>().ge("create_time", DateUtil.thisYear() + "-01-01");
        List<Staff> list = this.staffService.list(queryWrapper);
        int q1 = 0, q2 = 0, q3 = 0, q4 = 0;
        for (Staff staff : list) {
            Quarter quarter = DateUtil.quarterEnum(staff.getCreateTime());
            // 统计每个季度的注册人数
            switch (quarter) {
                case Q1:
                    q1 += 1;
                    break;
                case Q2:
                    q2 += 1;
                    break;
                case Q3:
                    q3 += 1;
                    break;
                case Q4:
                    q4 += 1;
                    break;
                default:
                    break;
            }
        }
        return Response.success(CollUtil.newArrayList(q1, q2, q3, q4));
    }

    // 统计数据
    public ResponseDTO getCountData() {
        // 获取总员工数
        long totalNum = this.staffService.count();
        // 获取状态正常的用户数
        long normalNum = this.staffService.count(new QueryWrapper<Staff>().eq("status", 1));
        // 统计当日考勤数据
        Date datetime = new Date(System.currentTimeMillis());
        String day = DateUtil.format(datetime, "yyyy-MM-dd");
        long lateNum = this.attendanceService.count(new QueryWrapper<Attendance>().eq("attendance_date", day).eq("status", AttendanceStatusEnum.LATE.getCode()));
        long leaveEarlyNum = this.attendanceService.count(new QueryWrapper<Attendance>().eq("attendance_date", day).eq("status", AttendanceStatusEnum.LEAVE_EARLY.getCode()));
        long absenteeismNum = this.attendanceService.count(new QueryWrapper<Attendance>().eq("attendance_date", day).eq("status", AttendanceStatusEnum.ABSENTEEISM.getCode()));
        Map<String, Object> map = new HashMap<>();
        map.put("totalNum", totalNum);
        map.put("normalNum", normalNum);
        map.put("lateNum", lateNum);
        map.put("leaveEarlyNum", leaveEarlyNum);
        map.put("absenteeismNum", absenteeismNum);
        return Response.success(map);
    }

    public ResponseDTO getCityData() {
        QueryWrapper<City> queryWrapper = new QueryWrapper<>();
        queryWrapper.last("limit 5");
        List<City> list = this.cityService.list(queryWrapper);
        return Response.success(list);
    }


    /**
     * 统计员工当月的考勤信息
     * @param id 员工id
     * @param month
     * @return
     */
    public ResponseDTO getAttendanceData(Integer id, String month) {
        if (month == null || month == "") {
            month = DateUtil.format(new java.util.Date(), "yyyyMM");
        }
        String[] monthDayList = DatetimeUtil.getMonthDayList(month);
        // 考勤状态表
        List<HashMap<String,Object>> list = new ArrayList<>();
        for (String day : monthDayList) {
            HashMap<String, Object> map = new HashMap<>();
            Attendance attendance = this.attendanceMapper.findByStaffId(id, day);
            if (attendance == null) {
                Date date = DateUtil.parse(day, "yyyyMMdd").toSqlDate();
                // 如果是周末就休假
                if (DateUtil.isWeekend(date)) {
                    map.put("message", AttendanceStatusEnum.LEAVE.getMessage());
                    map.put("tagType",AttendanceStatusEnum.LEAVE.getTagType());
                } else {
                    map.put("message",AttendanceStatusEnum.NORMAL.getMessage());
                    map.put("tagType",AttendanceStatusEnum.NORMAL.getTagType());
                }
            } else {
                map.put("message",attendance.getStatus().getMessage());
                map.put("tagType",attendance.getStatus().getTagType());
            }
            list.add(map);
        }
        return Response.success(list);
    }


    // 统计各部门的人数情况
    public ResponseDTO getDepartmentData() {
        List<Dept> parentList = this.deptService.list(new QueryWrapper<Dept>().eq("parent_id", 0));
        List<Map<String, Object>> mapList = new ArrayList<>();
        for (Dept parentDept : parentList) {
            List<Dept> list = this.deptService.list(new QueryWrapper<Dept>().eq("parent_id", parentDept.getId()));
            List<Integer> ids = list.stream().map(Dept::getId).collect(Collectors.toList());
            long num = this.staffService.count(new QueryWrapper<Staff>().in("dept_id", ids));
            Map<String, Object> map = new HashMap<>();
            map.put("value", num);
            map.put("name", parentDept.getName());
            mapList.add(map);
        }
        return Response.success(mapList);
    }
}
