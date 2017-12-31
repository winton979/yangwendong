package com.nymph.adminuser.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.Version;
import java.io.Serializable;

/**
 * <p>
 * 后台组织机构表
 * </p>
 *
 * @author winton
 * @since 2017-12-31
 */
@TableName("bbt_admin_org")
public class BbtAdminOrg extends Model<BbtAdminOrg> {

    private static final long serialVersionUID = 1L;

    /**
     * SID
     */
	@TableId(value="SID", type= IdType.AUTO)
	private Long sid;
    /**
     * PSID
     */
	@TableField("PSID")
	private Long psid;
    /**
     * 机构名称
     */
	@TableField("ORG_NAME")
	private String orgName;
    /**
     * 层级
     */
	@TableField("LEVEL")
	private Integer level;
    /**
     * 创建人
     */
	@TableField("CREATED_BY")
	private Long createdBy;
    /**
     * 创建日期
     */
	@TableField("CREATED_DT")
	private Date createdDt;
    /**
     * 版本
     */
	@TableField("VERSION")
	private Integer version;
    /**
     * 更新人
     */
	@TableField("UPDATED_BY")
	private Long updatedBy;
    /**
     * 更新日期
     */
	@TableField("UPDATED_DT")
	private Date updatedDt;
    /**
     * 属性
     */
	@TableField("ORG_ATTRVALUE")
	private String orgAttrvalue;
    /**
     * 是否启用 0:禁用 1:启用
     */
	@TableField("ENABLED")
	private Integer enabled;


	public Long getSid() {
		return sid;
	}

	public void setSid(Long sid) {
		this.sid = sid;
	}

	public Long getPsid() {
		return psid;
	}

	public void setPsid(Long psid) {
		this.psid = psid;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
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

	public String getOrgAttrvalue() {
		return orgAttrvalue;
	}

	public void setOrgAttrvalue(String orgAttrvalue) {
		this.orgAttrvalue = orgAttrvalue;
	}

	public Integer getEnabled() {
		return enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	public static final String TABLE_FIELD_SID = "SID";

	public static final String TABLE_FIELD_PSID = "PSID";

	public static final String TABLE_FIELD_ORG_NAME = "ORG_NAME";

	public static final String TABLE_FIELD_LEVEL = "LEVEL";

	public static final String TABLE_FIELD_CREATED_BY = "CREATED_BY";

	public static final String TABLE_FIELD_CREATED_DT = "CREATED_DT";

	public static final String TABLE_FIELD_VERSION = "VERSION";

	public static final String TABLE_FIELD_UPDATED_BY = "UPDATED_BY";

	public static final String TABLE_FIELD_UPDATED_DT = "UPDATED_DT";

	public static final String TABLE_FIELD_ORG_ATTRVALUE = "ORG_ATTRVALUE";

	public static final String TABLE_FIELD_ENABLED = "ENABLED";

	@Override
	protected Serializable pkVal() {
		return this.sid;
	}

	@Override
	public String toString() {
		return "BbtAdminOrg{" +
			", sid=" + sid +
			", psid=" + psid +
			", orgName=" + orgName +
			", level=" + level +
			", createdBy=" + createdBy +
			", createdDt=" + createdDt +
			", version=" + version +
			", updatedBy=" + updatedBy +
			", updatedDt=" + updatedDt +
			", orgAttrvalue=" + orgAttrvalue +
			", enabled=" + enabled +
			"}";
	}
}
