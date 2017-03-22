package com.ywb.bigops.domain.organization;

import java.io.Serializable;
import java.util.Date;

/**
 * OrganizationDomain.
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public class OrganizationDomain implements Serializable {

    private static final long serialVersionUID = 6819204753007606217L;

    private Integer oid;
    private String oname;
    private Integer pid;
    private Date createTime;
    private Date updateTime;
    private Integer status;

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getOname() {
        return oname;
    }

    public void setOname(String oname) {
        this.oname = oname;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}