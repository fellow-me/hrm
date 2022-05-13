package com.hrm.exception;

import com.hrm.enums.BaseEnum;
import lombok.Getter;

/**
 * 自定义异常
 * @author
 * @date
 */
@Getter
public class ServiceException extends RuntimeException {
    private Integer code;

    public ServiceException(Integer code,String message){
        super(message);
        this.code = code;
    }

    public ServiceException(BaseEnum e){
        super(e.getMessage());
        this.code = e.getCode();
    }

}
