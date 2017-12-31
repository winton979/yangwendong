package com.nymph.adminuser.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.Version;
import java.io.Serializable;

/**
 * <p>
 * 后台用户信息表
 * </p>
 *
 * @author winton
 * @since 2017-12-31
 */
@TableName("bbt_admin_user")
public class BbtAdminUser extends Model<BbtAdminUser> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	@TableId(value="SID", type= IdType.AUTO)
	private Long sid;
    /**
     * 机构编码
     */
	@TableField("ORG_SID")
	private String orgSid;
    /**
     * 登录账号
     */
	@TableField("USER_NAME")
	private String userName;
    /**
     * 登录密码(加密)
     */
	@TableField("USER_PASS")
	private String userPass;
    /**
     * 电子邮件
     */
	@TableField("USER_EMAIL")
	private String userEmail;
    /**
     * 是否启用 0:禁用 1:启用
     */
	@TableField("ENABLED")
	private Integer enabled;
    /**
     * 最后登录时间
     */
	@TableField("LAST_LOGIN_TIME")
	private Date lastLoginTime;
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
    /**
     * 账号类型
     */
	@TableField("USER_TYPE")
	private Integer userType;
    /**
     * 盐
     */
	@TableField("SALT")
	private String salt;
    /**
     * 错误密码数
     */
	@TableField("WRONG_PASSWORD_COUNT")
	private Integer wrongPasswordCount;
    /**
     * 最后错误密码时间
     */
	@TableField("LAST_WRONG_PASS_TIME")
	private Date lastWrongPassTime;
    /**
     * 备注
     */
	@TableField("REMARKS")
	private String remarks;
    /**
     * 昵称
     */
	@TableField("NICK_NAME")
	private String nickName;


	public Long getSid() {
		return sid;
	}

	public void setSid(Long sid) {
		this.sid = sid;
	}

	public String getOrgSid() {
		return orgSid;
	}

	public void setOrgSid(String orgSid) {
		this.orgSid = orgSid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Integer getEnabled() {
		return enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
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

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public Integer getWrongPasswordCount() {
		return wrongPasswordCount;
	}

	public void setWrongPasswordCount(Integer wrongPasswordCount) {
		this.wrongPasswordCount = wrongPasswordCount;
	}

	public Date getLastWrongPassTime() {
		return lastWrongPassTime;
	}

	public void setLastWrongPassTime(Date lastWrongPassTime) {
		this.lastWrongPassTime = lastWrongPassTime;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public static final String TABLE_FIELD_SID = "SID";

	public static final String TABLE_FIELD_ORG_SID = "ORG_SID";

	public static final String TABLE_FIELD_USER_NAME = "USER_NAME";

	public static final String TABLE_FIELD_USER_PASS = "USER_PASS";

	public static final String TABLE_FIELD_USER_EMAIL = "USER_EMAIL";

	public static final String TABLE_FIELD_ENABLED = "ENABLED";

	public static final String TABLE_FIELD_LAST_LOGIN_TIME = "LAST_LOGIN_TIME";

	public static final String TABLE_FIELD_CREATED_BY = "CREATED_BY";

	public static final String TABLE_FIELD_CREATED_DT = "CREATED_DT";

	public static final String TABLE_FIELD_VERSION = "VERSION";

	public static final String TABLE_FIELD_UPDATED_BY = "UPDATED_BY";

	public static final String TABLE_FIELD_UPDATED_DT = "UPDATED_DT";

	public static final String TABLE_FIELD_USER_TYPE = "USER_TYPE";

	public static final String TABLE_FIELD_SALT = "SALT";

	public static final String TABLE_FIELD_WRONG_PASSWORD_COUNT = "WRONG_PASSWORD_COUNT";

	public static final String TABLE_FIELD_LAST_WRONG_PASS_TIME = "LAST_WRONG_PASS_TIME";

	public static final String TABLE_FIELD_REMARKS = "REMARKS";

	public static final String TABLE_FIELD_NICK_NAME = "NICK_NAME";

	@Override
	protected Serializable pkVal() {
		return this.sid;
	}

	@Override
	public String toString() {
		return "BbtAdminUser{" +
			", sid=" + sid +
			", orgSid=" + orgSid +
			", userName=" + userName +
			", userPass=" + userPass +
			", userEmail=" + userEmail +
			", enabled=" + enabled +
			", lastLoginTime=" + lastLoginTime +
			", createdBy=" + createdBy +
			", createdDt=" + createdDt +
			", version=" + version +
			", updatedBy=" + updatedBy +
			", updatedDt=" + updatedDt +
			", userType=" + userType +
			", salt=" + salt +
			", wrongPasswordCount=" + wrongPasswordCount +
			", lastWrongPassTime=" + lastWrongPassTime +
			", remarks=" + remarks +
			", nickName=" + nickName +
			"}";
	}
}
