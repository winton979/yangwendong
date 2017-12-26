package com.nymph.userinfo.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author winton
 * @since 2017-12-26
 */
@TableName("user_info")
public class UserInfo extends Model<UserInfo> {

    private static final long serialVersionUID = 1L;

	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
	private String nickname;
	private String suid;
	private String token;
	@TableField("sign_in_name")
	private String signInName;
	@TableField("sign_in_password")
	private String signInPassword;
	private String salt;
	@TableField("create_time")
	private Integer createTime;
	private Integer enabled;
	@TableField("head_url")
	private String headUrl;
	@TableField("user_type")
	private Integer userType;
	@TableField("update_time")
	private Integer updateTime;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSuid() {
		return suid;
	}

	public void setSuid(String suid) {
		this.suid = suid;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getSignInName() {
		return signInName;
	}

	public void setSignInName(String signInName) {
		this.signInName = signInName;
	}

	public String getSignInPassword() {
		return signInPassword;
	}

	public void setSignInPassword(String signInPassword) {
		this.signInPassword = signInPassword;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public Integer getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Integer createTime) {
		this.createTime = createTime;
	}

	public Integer getEnabled() {
		return enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	public String getHeadUrl() {
		return headUrl;
	}

	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public Integer getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Integer updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "UserInfo{" +
			", id=" + id +
			", nickname=" + nickname +
			", suid=" + suid +
			", token=" + token +
			", signInName=" + signInName +
			", signInPassword=" + signInPassword +
			", salt=" + salt +
			", createTime=" + createTime +
			", enabled=" + enabled +
			", headUrl=" + headUrl +
			", userType=" + userType +
			", updateTime=" + updateTime +
			"}";
	}
}
