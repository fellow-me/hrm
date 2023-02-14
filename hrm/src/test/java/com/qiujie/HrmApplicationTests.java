package com.qiujie;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.date.StopWatch;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.entity.Attendance;
import com.qiujie.entity.RoleMenu;
import com.qiujie.entity.Salary;
import com.qiujie.entity.Staff;
import com.qiujie.enums.AttendanceStatusEnum;
import com.qiujie.enums.BusinessStatusEnum;
import com.qiujie.enums.LeaveEnum;
import com.qiujie.mapper.*;
import com.qiujie.service.*;
import com.qiujie.util.DatetimeUtil;
import com.qiujie.util.EnumUtil;
import com.qiujie.util.HutoolExcelUtil;
import com.qiujie.util.MD5Util;
import com.qiujie.vo.StaffAttendanceVO;
import com.qiujie.vo.StaffDocsVO;
import com.qiujie.vo.StaffInsuranceVO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class HrmApplicationTests {

    @Autowired
    private StaffService staffService;

    @Resource
    private StaffMapper staffMapper;

    @Resource
    private RoleMenuService roleMenuService;

    @Resource
    private RoleMenuMapper roleMenuMapper;

    @Resource
    private LoginService loginService;

    @Resource
    private MenuService menuService;

    @Resource
    private InsuranceMapper insuranceMapper;

    @Resource
    private DeptMapper deptMapper;

    @Resource
    private AttendanceMapper attendanceMapper;



    @Resource
    private AttendanceService attendanceService;

    @Resource
    private SalaryService salaryService;

    @Resource
    private HomeService homeService;

    @Resource
    private DocsMapper docsMapper;


    @Resource
    private OvertimeService overtimeService;

    @Test
    void test1() {
        ResponseDTO resultDTO = new ResponseDTO();
        System.out.println(resultDTO);
    }

    @Test
    void test2() {
        ResponseDTO resultDTO;
        resultDTO = new ResponseDTO(200, "success", "ok");
        System.out.println(resultDTO);
    }

    /**
     * 测试项目路径
     */
    @Test
    void test3() {
        String path = System.getProperty("user.dir");
        System.out.println(path + "/src/main/java");
    }

    @Test
    void test4() {
        List<Character> list = new ArrayList<>();
        list.add('a');
        list.add('b');
        list.add('c');
        System.out.println(list.indexOf('a'));
        System.out.println(list.indexOf('b'));
        System.out.println(list.indexOf('c'));
        System.out.println(list.remove(1)); // list.remove(int index)返回当前删除的对象
    }

    @Test
    void test5() {
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        for (Integer integer : list) {
            System.out.println(integer);
        }
        System.out.println(list.remove(1));
        for (Integer integer : list) {
            System.out.println(integer);
        }
    }

    /**
     * 测试添加
     */
    @Test
    void test6() {
        Staff staff = new Staff();
        staff.setCode("staff_6");
        staff.setName("harden");
        staff.setPassword("010101");
        System.out.println("结果为：" + this.staffService.add(staff).getMessage());
    }

    /**
     * 测试更新
     */
    @Test
    void test7() {
        Staff staff = new Staff();
        // staff.setId(6);
        staff.setPassword("0000");
        staff.setRemark("硕士");
        System.out.println("结果为：" + this.staffService.updateById(staff));
    }

    /**
     * 测试逻辑删除
     */
    @Test
    void test8() {
        System.out.println("结果为：" + this.staffService.deleteById(5));
    }

    /**
     * 分页查询
     */
    @Test
    void test9() {
        // 构造查询条件
        QueryWrapper<Staff> wrapper = new QueryWrapper();
        wrapper.like("name", "%n%");
        // 查询指定页面的数据
        Page<Staff> page = new Page<>(1, 10);
        Page<Staff> staffPage = this.staffMapper.selectPage(page, wrapper);
        System.out.println("总页数" + staffPage.getPages());
        System.out.println("总记录数" + staffPage.getTotal());
        List<Staff> records = staffPage.getRecords();
        records.forEach(System.out::println);
    }

    @Test
    void test13() {
        Staff staff = new Staff();
        staff.setId(12);
        // System.out.println(this.staffService.getById(12));
        System.out.println(this.staffMapper.selectById(12));
    }

    @Test
    void test14() {
        QueryWrapper<RoleMenu> wrapper = new QueryWrapper<>();
        wrapper.eq("role_id", 1);
        System.out.println("结果为！" + this.roleMenuMapper.delete(wrapper));
        if (this.roleMenuService.remove(wrapper)) {
            System.out.println("删除成功！");
        } else {
            System.out.println("删除失败！");
        }
    }

    @Test
    void test15() {
        RoleMenu roleMenu = new RoleMenu();
        roleMenu.setRoleId(2);
        roleMenu.setMenuId(3);
        roleMenu.setStatus(1);
        QueryWrapper<RoleMenu> wrapper = new QueryWrapper<>();
        wrapper.eq("role_id", 2).eq("menu_id", 3);
        this.roleMenuService.saveOrUpdate(roleMenu, wrapper);
    }

    @Test
    void test16() {
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        this.menuService.getStaffMenuPlus(1);
        stopWatch.stop();
        // 统计执行时间（毫秒）
        System.out.printf("执行时长：%d 毫秒.%n", stopWatch.getTotalTimeMillis());
        // 统计执行时间（纳秒）
        System.out.printf("执行时长：%d 纳秒.%n", stopWatch.getTotalTimeNanos());
    }

    @Test
    void test17() {
        System.out.println("md5:" + MD5Util.MD5("12345"));
        System.out.println("md55:" + MD5Util.MD55("12345"));
        System.out.println(MD5Util.MD55("12345").length());
    }

    @Test
    void test19() {
        System.out.println("错误为：" + BusinessStatusEnum.SUCCESS);
    }

//    @Test
//    void test21() {
//        IPage<StaffInsuranceVO> config = new Page<>(1, 10);
//        IPage<StaffInsuranceVO> staffInsuranceVOIPage = this.insuranceMapper.listStaffInsuranceVO(config, null);
//        System.out.println(staffInsuranceVOIPage.getRecords());
//    }

    @Test
    void test22() {
        Staff staff = this.staffService.getById(8);
    }

    @Test
    void test23() {
        // IPage<DeptWorkTimeVO> config = new Page<>(1, 20);
        // IPage<DeptWorkTimeVO> deptWorkTimeVOIPage = this.deptMapper.listParentDeptWorkTimeVO(config, "");
        // System.out.println(deptWorkTimeVOIPage.getRecords());
    }

    @Test
    void test24() {
        // WorkTime workTime = this.workTimeService.getById(1);
        // System.out.println(workTime.getMorStartTime().getTime() + "  " + workTime.getMorStartTime());
        // System.out.println(workTime.getMorEndTime().getTime() + "  " + workTime.getMorEndTime());
        // float hour_diff = (float) ((workTime.getMorEndTime().getTime() - workTime.getMorStartTime().getTime())
        //         / (1000 * 60 * 60.0));
        // System.out.println("时间差：" + hour_diff);
        // BigDecimal diff = BigDecimal.valueOf(
        //         (workTime.getMorEndTime().getTime() - workTime.getMorStartTime().getTime()) / (1000 * 60 * 60.0));
        // System.out.println("时间差：" + diff);
        // System.out.println(workTime.getMorStartTime().getTime());
        // System.out.println(workTime.getMorEndTime().getTime());
        // System.out.println(workTime.getAftStartTime().getTime());
        // System.out.println(workTime.getAftEndTime().getTime());
    }

    @Test
    void test25() {
        // WorkTime workTime = this.workTimeService.getById(1);
        // System.out.println(workTime.getDeleteFlag());
    }

    @Test
    void test26() throws FileNotFoundException {
        File file = new File("C:\\Users\\asus\\Desktop\\员工考勤表.xlsx");
        InputStream inputStream = new FileInputStream(file);
        List<Attendance> list = HutoolExcelUtil.readExcel(inputStream, 1, Attendance.class);
        SimpleDateFormat dateFormat = new SimpleDateFormat("hh:mm");
        for (Attendance item : list) {
            System.out.println(dateFormat.format(item.getAttendanceDate()));
        }
    }

    @Test
    void test27() {
        for (String s : DatetimeUtil.getMonthDayList("202203")) {
            System.out.println(s);
        }
    }

    @Test
    void test28() {
        System.out.println(DateUtil.parse("20220301", "yyyyMMdd"));
    }

    @Test
    void test29() {
        QueryWrapper<Salary> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("staff_id", 1).eq("month", "202304");
        Salary one = this.salaryService.getOne(queryWrapper);
        if (one == null) {
            System.out.println("没有");
        } else {
            System.out.println("有啊");
        }
    }

    @Test
    void test30() {
        System.out.println(new Date());
    }

    @Test
    void test31() {
        System.out.println(DateUtil.thisYear());
    }

    @Test
    void test32() {
        System.out.println(DateUtil.thisMonth());
    }

    @Test
    void test33() {
        System.out.println(DateUtil.beginOfYear(new Date(System.currentTimeMillis())));
    }

    @Test
    void test34() {
        DateTime startDate = DateUtil.beginOfMonth(new Date());
        int length = DateUtil.lengthOfMonth(DateUtil.thisMonth() + 1, DateUtil.isLeapYear(DateUtil.thisYear()));
        System.out.println(DateUtil.thisMonth());
        // DateUtil.thisYear();
    }

    @Test
    void test35() {
        DateTime start = DateUtil.beginOfMonth(new Date());
        DateUtil.offsetDay(start, 1);
        DateTime end = DateUtil.endOfMonth(new Date());
        // System.out.println(start + "--------" + end);
        System.out.println(DateUtil.format(new Date(), "yyyyMM"));
    }

    @Test
    void test36() {
        ResponseDTO departmentData = this.homeService.getDepartmentData();
        System.out.println(departmentData.getData());
    }

    @Test
    void test37(){

        List<Map<String, Object>> enumList = EnumUtil.getEnumList(LeaveEnum.class);
        for (Map<String, Object> map : enumList) {
            for (AttendanceStatusEnum attendanceStatusEnum : AttendanceStatusEnum.values()) {
                if(map.get("code") == attendanceStatusEnum.getCode()){
                    map.put("tagType",attendanceStatusEnum.getTagType());
                }
            }
        }
    }

    @Test
    void test38() {
        Integer id = 1;
        String month = null;
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
                java.sql.Date date = DateUtil.parse(day, "yyyyMMdd").toSqlDate();
                if (DateUtil.isWeekend(date)) {
                    map.put("message", AttendanceStatusEnum.LEAVE.getMessage());
                    map.put("tagType", AttendanceStatusEnum.LEAVE.getTagType());
                } else {
                    map.put("message", AttendanceStatusEnum.NORMAL.getMessage());
                    map.put("tagType", AttendanceStatusEnum.NORMAL.getTagType());
                }
            } else {
                map.put("message", attendance.getStatus().getMessage());
                map.put("tagType", attendance.getStatus().getTagType());

            }
            list.add(map);
        }
        for (HashMap<String, Object> stringObjectHashMap : list) {
            System.out.println(stringObjectHashMap);
        }
    }

    @Test
    void test39(){
        Integer current = 1;Integer size = 10; String name = null; String month = null;
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
            List<HashMap<String,Object>> list = new ArrayList<>();
            for (String day : monthDayList) {
                HashMap<String,Object> map = new HashMap<>();
                Attendance attendance = this.attendanceMapper.findByStaffId(staffDeptVO.getStaffId(), day);
                // 如果考勤数据不存在，就重新设置数据
                if (attendance == null) {
                    java.sql.Date date = DateUtil.parse(day, "yyyyMMdd").toSqlDate();
                    // 如果是周末就休假
                    if (DateUtil.isWeekend(date)) {
                        map.put("message",AttendanceStatusEnum.LEAVE.getMessage());
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
            staffDeptVO.setAttendanceList(list);
        }
        // 将响应数据填充到map中
        Map map = new HashMap();
        map.put("pages", page.getPages());
        map.put("total", page.getTotal());
        map.put("list", staffDeptVOList);
        map.put("dayNum", monthDayList.length);
        map.put("month", month);
        System.out.println(map);
    }


    @Test
    void test40(){
        QueryWrapper<Attendance> queryWrapper = new QueryWrapper<>();

        queryWrapper.eq("staff_id",1).eq("attendance_date",new Date("2023-01-01"));
        Attendance attendance = this.attendanceService.getOne(queryWrapper);
        System.out.println(attendance);

    }

    @Test
    void test41(){
//        QueryWrapper<Attendance> queryWrapper = new QueryWrapper<>();
//        queryWrapper.eq("id",200);
        Staff staff = this.staffService.getById(2000);
        System.out.println(staff);

    }

//    @Test
//    void test42(){
//        IPage<StaffDocsVO> config = new Page<>(1, 10);
//        IPage<StaffDocsVO> page = this.docsMapper.listStaffDocsVO(config, "");
//        System.out.println(page.getRecords());
//    }


    @Test
    void test43(){
        ResponseDTO all = this.overtimeService.findAll();
        System.out.println(all.getData());
    }
}