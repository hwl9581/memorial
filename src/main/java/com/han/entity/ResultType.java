package com.han.entity;

import com.alibaba.fastjson.JSON;
import lombok.Data;

/**
 * @ClassName ResultType
 * @Description TODO
 * @Author HanWL
 * @Since 2020/4/30 0030 18:25
 */
@Data
public class ResultType {

    private Integer code;
    private String msg;
    private Object data;

    public ResultType(Integer code, String msg, Object data){
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public ResultType(Integer code, String msg){
        this.code = code;
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "ResultType{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }

    public static String toJsonString(Integer code, String msg, Object data){
        ResultType resultType = new ResultType(code, msg, data);
        return JSON.toJSONString(resultType);
    }

    public static String toJsonString(Integer code, String msg){
        ResultType resultType = new ResultType(code, msg);
        return JSON.toJSONString(resultType);
    }

}
