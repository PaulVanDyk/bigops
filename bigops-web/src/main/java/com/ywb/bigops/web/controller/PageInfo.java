package com.ywb.bigops.web.controller;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by Erlei Chen on 2016/8/29.
 */
public class PageInfo<T> implements Serializable {
    private static final long serialVersionUID = -6714972256655581295L;

    private int draw;
    private int start;
    private int length;
    private int recordsTotal;
    private int recordsFiltered;
    private Date timestamp;
    private List<T> data;
    private Object extend;

    public PageInfo() {

    }

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public int getRecordsFiltered() {
        if (recordsFiltered == 0) {
            return recordsTotal;
        }
        return recordsFiltered;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public Date getTimestamp() {
        return new Date();
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public Object getExtend() {
        return extend;
    }

    public void setExtend(Object extend) {
        this.extend = extend;
    }
}
