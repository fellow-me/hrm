package com.qiujie.util;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.rules.DateType;

import java.util.Collections;

public class CodeGenerator {
    public static void main(String[] args) {
        DataSourceConfig dataSourceConfig = new DataSourceConfig
                .Builder("jdbc:mysql://localhost:3306/hrm?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2b8", "root", "123456")
                .typeConvert(new MySqlTypeConvert()) // 数据库字段类型转换
                .build();

        // 全局配置
        GlobalConfig globalConfig = new GlobalConfig.Builder()
                .fileOverride() // 覆盖已生成的文件
                .outputDir("C:\\Users\\asus\\Desktop\\code\\java")  // 输出路径为当前项目的/src/main/java目录下
                .author("qiujie")
                .enableSwagger() // 便于生成Api文档
                .dateType(DateType.SQL_PACK) // 使用java.sql.Timestamp
                .commentDate("yyyy-MM-dd")
                .build();

        // 配置包名
        PackageConfig packageConfig = new PackageConfig.Builder()
                .parent("com.hrm")
                .entity("entity")
                .service("service")
                .serviceImpl("service.impl")
                .mapper("mapper")
                .controller("controller")
                .pathInfo(Collections.singletonMap(OutputFile.mapperXml, "C:\\Users\\asus\\Desktop\\code\\mapper")) // 设置mapperXml生成路径
                .build();

        StrategyConfig strategyConfig = new StrategyConfig.Builder()
                .addTablePrefix("sys_", "per_", "soc_", "sal_", "att_", "act_re_", "sal_") // 根据表名生成实体名，去除指定的表前缀
                .addInclude("sal_salary")
                .entityBuilder() // 1. entity策略配置
                .enableLombok()
                .enableTableFieldAnnotation() // 生成字段注解
                .logicDeleteColumnName("is_deleted") // 指明逻辑删除字段
//                .addTableFills(new Column("create_time", FieldFill.INSERT)) // 插入时自动填入时间
//                .addTableFills(new Property("updateTime", FieldFill.INSERT_UPDATE)) // 插入或更新时自动填入时间
                .idType(IdType.AUTO) // 主键自增
                .enableChainModel() // 链式
                .mapperBuilder() // 2. mapper策略配置
                .superClass(BaseMapper.class) // 设置父类
                .serviceBuilder() // 3. service策略配置
                .formatServiceFileName("%sService") // 如果不设置，则默认为I%sService
                .controllerBuilder() // 4. controller策略配置
                .enableRestStyle() //  开启@RestController
                .enableHyphenStyle() // 开启驼峰转连字符
                .build();

        new AutoGenerator(dataSourceConfig)
                .global(globalConfig)
                .packageInfo(packageConfig)
                .strategy(strategyConfig)
                .execute(); // 执行
    }
}
