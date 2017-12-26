package com.nymph.adminuser.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 后台用户角色表
 * </p>
 *
 * @author winton
 * @since 2017-12-26
 */
@TableName("bbt_admin_role")
public class BbtAdminRole extends Model<BbtAdminRole> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	@TableId(value="SID", type= IdType.AUTO)
	private Long sid;
    /**
     * 角色编码
     */
	@TableField("ROLE_CODE")
	private String roleCode;
    /**
     * 角色描述
     */
	@TableField("ROLE_DESC")
	private String roleDesc;
    /**
     * 状态(0:不可用,1:可用)
     */
	@TableField("STATUS")
	private Integer status;
    /**
     * 创建者
     */
	@TableField("CREATED_BY")
	private Long createdBy;
    /**
     * 创建时间
     */
	@TableField("CREATED_DT")
	private Date createdDt;
    /**
     * 版本
     */
	@TableField("VERSION")
	private Integer version;
    /**
     * 更新者
     */
	@TableField("UPDATED_BY")
	private Long updatedBy;
    /**
     * 更新时间
     */
	@TableField("UPDATED_DT")
	private Date updatedDt;


	public Long getSid() {
		return sid;
	}

	public void setSid(Long sid) {
		this.sid = sid;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDt() {
		return createdDt;
	}

	public void setCreatedDt(Date createdDt) {
		this.createdDt = createdDt;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public Long getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(Long updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Date getUpdatedDt() {
		return updatedDt;
	}

	public void setUpdatedDt(Date updatedDt) {
		this.updatedDt = updatedDt;
	}

	@Override
	protected Serializable pkVal() {
		return this.sid;
	}

	@Override
	public String toString() {
		return "BbtAdminRole{" +
			", sid=" + sid +
			", roleCode=" + roleCode +
			", roleDesc=" + roleDesc +
			", status=" + status +
			", createdBy=" + createdBy +
			", createdDt=" + createdDt +
			", version=" + version +
			", updatedBy=" + updatedBy +
			", updatedDt=" + updatedDt +
			"}";
	}
}
