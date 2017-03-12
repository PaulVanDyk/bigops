package com.ywb.bigops.web.controller;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by dream on 2016/9/1.
 */
public class JsonData<T> implements Serializable {

    public final static String SUCCESS = "success";
    public final static int SUCCESS_INT = 1;
    public final static String FAILED = "failed";
    public final static int FAILED_INT = 0;

    private String method;
    private String datetime;
    private Object status;
    private String errorCode;
    private String errorMessage;
    private T data;

    public JsonData(Object status) {
        this.status = status;
        SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
        this.datetime = format.format(new Date());
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public Object getStatus() {
        return status;
    }

    public void setStatus(Object status) {
        this.status = status;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
