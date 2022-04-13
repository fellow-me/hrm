package com.hrm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * activiti默认集成了Spring Security，配置此项设置Spring Security不自动装配
 */


@MapperScan("com.hrm.mapper")
@SpringBootApplication
@EnableTransactionManagement // 事务
public class HrmApplication {
    public static void main(String[] args) {
        SpringApplication.run(HrmApplication.class, args);
    }
}
