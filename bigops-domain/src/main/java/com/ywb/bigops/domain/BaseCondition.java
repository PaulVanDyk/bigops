package com.ywb.bigops.domain;

import com.ywb.bigops.common.constant.ErrorCode;
import com.ywb.bigops.common.validation.GetList;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * BaseCondition.
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public class BaseCondition implements Serializable {

    private static final long serialVersionUID = -639027626364228052L;

    private static final String SORT_DESC_DESC = "DESC";
    private static final String SORT_DESC_ASC = "ASC";

    /**
     * 当前条数索引
     */
    @NotNull(message = ErrorCode.PLANE_GETLIST_PAGEINDEX_MUST, groups = {GetList.class})
    private Integer pageIndex;

    /**
     * 每页显示条数
     */
    @NotNull(message = ErrorCode.PLANE_GETLIST_PAGESIZE_MUST, groups = {GetList.class})
    private Integer pageSize;

    /**
     * 排序字段
     */
    private String sortField;

    /**
     * 排序规则
     */
    private String sortDesc;

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getSortField() {
        return sortField;
    }

    public void setSortField(String sortField) {
        this.sortField = sortField;
    }

    public String getSortDesc() {
        return sortDesc;
    }

    public void setSortDesc(String sortDesc) {
        this.sortDesc = sortDesc;
    }
}