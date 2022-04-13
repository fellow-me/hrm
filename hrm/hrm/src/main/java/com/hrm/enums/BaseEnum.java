package com.hrm.enums;

/**
 * 通用枚举接口
 * @Author qiujie
 * @Date 2022/3/21
 * @Version 1.0
 */
public interface BaseEnum {
    /**
     * 获取编号
     * @return
     */
    Integer getCode();

    /**
     * 消息内容
     * @return
     */
    String getMessage();
}
