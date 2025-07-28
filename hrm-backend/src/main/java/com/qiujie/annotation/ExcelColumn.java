package com.qiujie.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @Author qiujie
 * @Date 2022/3/29
 * @Version 1.0
 */

/**
 * 声明该注解类的生命周期
 * RUNTIME表示注解保留在程序运行期间，此时可以通过反射获得定义在某个类上的所有注解。
 */
@Retention(RetentionPolicy.RUNTIME)
// 定义注解作用的元素类型
@Target(ElementType.FIELD)
public @interface ExcelColumn {

    /**
     * 列的名称
     *
     * @return
     */
    String value() default "";


}
