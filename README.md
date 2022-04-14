---
title: 基于Spring Boot的人力资源管理系统
excerpt: hrm是一个前后端分离的人力资源管理系统，实现了员工管理、社保管理、薪资管理、考勤管理、请假审批等模块的功能。
categories: 
- 项目
tags:
- Spring Boot
- Vue
- ElemenutUI
- JWT
index_img: 
- https://images.wallpaperscraft.com/image/single/laptop_dj_equipment_212416_1920x1080.jpg
banner_img:
- https://images.wallpaperscraft.com/image/single/laptop_dj_equipment_212416_1920x1080.jpg
---

### 项目介绍

#### 项目背景

在如今这个人才需求量大的时代，各方企业为了永葆企业的活力与生机，在不断开拓进取的同时，又广泛纳用人才，为企业的长久发展奠定了基础。于是，各个企业与部门机构，都不可避免地会接触到人力资源管理的问题。

在企业初见规模，团队逐渐成型时，企业对于人才的选拔和管理是尤为重要的。良好的内部管理能够让企业在市场上快速树立口碑和声誉，更有利于企业未来的发展，而人力资源管理系统对企业的管理能够起到如虎添翼的作用，随着团队的不断扩大，传统的人力资源管理模式开始吃力，并且效率低下。为了降低劳动力成本，提高工作效率，一个人力资源管理平台就有了出现的必要。([项目地址](https://github.com/fellow-me/hrm))

#### 技术栈

1. 前端

   Vue、Axios、ElementUI、Vue-Router、Vuex、ECharts

2. 后端

   Spring Boot、JWT、MyBatis-Plus、MySQL、poi

### 系统设计

#### 业务用例

![业务用例图](https://image-qiu.oss-cn-hangzhou.aliyuncs.com/img/20220413211427.png)

超级管理员拥有对所有菜单的访问权限，进行一系列的管理操作。而普通员工只能进行查看和修改个人信息，以及修改密码，请假。另外超级管理员可以为普通员工分配一些角色，进而改变员工的访问权限。

#### 功能结构

<img src="https://image-qiu.oss-cn-hangzhou.aliyuncs.com/img/20220413212517.png" alt="人力资源管理系统" style="zoom: 67%;" />

本系统主要分四个模块，分别是系统管理和权限管理、薪资管理、考勤管理，系统管理主要用于日常事务管理管理，权限管理，用于控制员工的访问权限，薪资管理主要是对员工的五险一金以及社保数据的修改和添加，考勤管理主要是对员工的日常打卡进行记录和统计。

### 系统展示

#### 首页

![首页](https://image-qiu.oss-cn-hangzhou.aliyuncs.com/img/20220413215121.png)

首页主要展示当前登录员工的一些基本信息，员工当前月的考勤数据，以及当日员工迟到、早退、旷工等情况。

#### 请假

![请假](https://image-qiu.oss-cn-hangzhou.aliyuncs.com/img/20220413215255.png)

在请假面板中，员工可以进行请假。在左侧的请假记录中查看以往的请假记录，或对当前未被审核的申请进行撤销。

![审批](https://image-qiu.oss-cn-hangzhou.aliyuncs.com/img/20220413215849.png)

管理员可以对员工的请假进行审批，比如通过或驳回。员工申请请假之后，等待管理员进行审批，如管理员审批通过，则将员工休假时间段的考勤状态设置为休假。

#### 五险一金

![五险一金](https://image-qiu.oss-cn-hangzhou.aliyuncs.com/img/20220413220101.png)

![image-20220413220251044](https://image-qiu.oss-cn-hangzhou.aliyuncs.com/img/20220413220251.png)

社保模块主要展示了员工的社保情况，可以对员工的社保进行调整。

#### 工资管理

![工资管理](https://image-qiu.oss-cn-hangzhou.aliyuncs.com/img/20220413220313.png)

显示员工当月的工资情况，以及当月的考勤罚款情况。可以导出员工当月的工资报表。

#### 考勤管理

![考勤管理](https://image-qiu.oss-cn-hangzhou.aliyuncs.com/img/20220413220741.png)

考勤管理实现了考勤数据的批量导入与导出，以及员工考勤状态的查询和修改。

![考勤数据导入模板](https://image-qiu.oss-cn-hangzhou.aliyuncs.com/img/20220413222133.png)

通过导入员工的考勤记录表，系统就会根据员工所在部门规定的上班时间进行比对，判断员工是否迟到、早退、旷工。（这是数据导入的模板，需要按照此格式填写数据。系统只会读取上下班时间的时间部分，系统以考勤日期作为打卡日期）。

另外，介绍一下考勤规制：

* 若考勤日期对应的是周末，则不判读员工考勤状态，默认为休假。
* 若考勤日期对应的是员工请假的日期，则员工考勤状态设为休假。
* 若员工的四个打卡时间，只要有一个为空，则员工考勤状态设为旷工。
* 若员工既迟到又早退，则员工考勤状态设为旷工。
* 若员工迟到，则员工考勤状态设为迟到。
* 若员工早退，则员工考勤状态设为早退。
* 若不是以上任何情况，则员工考勤状态设为正常。

### 项目搭建

#### 项目配置

1. 前端

   在.env文件中

   ```xml
   # 修改端口号，此端口号与在application.yml中配置的端口号相同
   VUE_APP_PORT = 8888
   ```

2. 后端

   在`application.yml`中进行相关的配置

   ```xml
   # 这是后端项目的运行端口，可自行修改
   server:
     port: 8888
   
   # 修改数据源，若MySql数据库版本较低，此处应该是com.mysql.jdbc.Driver
   driver-class-name: com.mysql.cj.jdbc.Driver
   
   # 因为此项目涉及到了文件上传与下载，此路径用来存储上传的文件。
   files:
     upload:
       path: E:/project/idea/hrm/file/ # 修改为自己的路径
   ```

#### 项目启动

1. 新建数据库，将数据库文件执行

2. 克隆代码到本地，在vue-elementui-hrm目录下

   ```bash
   # 下载依赖
   npm install 
   
   # 启动
   npm run serve
   ```

3. 启动后端项目

4. 项目启动成功之后，访问http://localhost:8080/login

   账号：admin
   密码：123




