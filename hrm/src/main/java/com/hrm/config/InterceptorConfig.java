package com.hrm.config;

import com.hrm.interceptor.JWTInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 配置拦截器
 *
 * @Author : qiujie
 * @Date : 2022/1/30
 */

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {


    /**
     * 注入到SpringBoot容器
     *
     * @return
     */
    @Bean
    public JWTInterceptor interceptor() {
        return new JWTInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(interceptor()).addPathPatterns("/**") // 拦截所有请求
                .excludePathPatterns("/login", "/find") // 放行接口
                .excludePathPatterns("/swagger-resources/**", "/webjars/**", "/v2/**", "/swagger-ui.html/**") // 放行Swagger
                .excludePathPatterns("/**/export", "/**/export/**", "/**/import") // 放行数据导入导出接口
                .excludePathPatterns("/docs/upload", "/docs/download/**") // 放行文件上传与下载接口
                .excludePathPatterns("/chat/**") // 放行websocket
                .excludePathPatterns("/login/token"); //


    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
    }


}
