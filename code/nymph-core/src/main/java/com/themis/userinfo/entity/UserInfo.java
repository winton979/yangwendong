package com.themis.userinfo.entity;

import java.io.Serializable;

public class UserInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7032030807426006614L;

	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", nickname=" + nickname + ", suid=" + suid + ", token=" + token + ", signInName="
				+ signInName + ", signInPassword=" + signInPassword + ", salt=" + salt + ", createTime=" + createTime
				+ ", enabled=" + enabled + ", headUrl=" + headUrl + ", userType=" + userType + ", updateTime="
				+ updateTime + "]";
	}

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_info.id
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	private Integer id;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_info.nickname
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	private String nickname;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_info.suid
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	private String suid;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_info.token
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	private String token;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_info.sign_in_name
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	private String signInName;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_info.sign_in_password
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	private String signInPassword;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_info.salt
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	private String salt;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_info.create_time
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	private Integer createTime;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_info.enabled
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	private Integer enabled;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_info.head_url
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	private String headUrl;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_info.user_type
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	private Integer userType;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_info.update_time
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	private Integer updateTime;

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_info.id
	 * @return  the value of user_info.id
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_info.id
	 * @param id  the value for user_info.id
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_info.nickname
	 * @return  the value of user_info.nickname
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public String getNickname() {
		return nickname;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_info.nickname
	 * @param nickname  the value for user_info.nickname
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_info.suid
	 * @return  the value of user_info.suid
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public String getSuid() {
		return suid;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_info.suid
	 * @param suid  the value for user_info.suid
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public void setSuid(String suid) {
		this.suid = suid;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_info.token
	 * @return  the value of user_info.token
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public String getToken() {
		return token;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_info.token
	 * @param token  the value for user_info.token
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public void setToken(String token) {
		this.token = token;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_info.sign_in_name
	 * @return  the value of user_info.sign_in_name
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public String getSignInName() {
		return signInName;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_info.sign_in_name
	 * @param signInName  the value for user_info.sign_in_name
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public void setSignInName(String signInName) {
		this.signInName = signInName;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_info.sign_in_password
	 * @return  the value of user_info.sign_in_password
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public String getSignInPassword() {
		return signInPassword;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_info.sign_in_password
	 * @param signInPassword  the value for user_info.sign_in_password
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public void setSignInPassword(String signInPassword) {
		this.signInPassword = signInPassword;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_info.salt
	 * @return  the value of user_info.salt
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public String getSalt() {
		return salt;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_info.salt
	 * @param salt  the value for user_info.salt
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public void setSalt(String salt) {
		this.salt = salt;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_info.create_time
	 * @return  the value of user_info.create_time
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public Integer getCreateTime() {
		return createTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_info.create_time
	 * @param createTime  the value for user_info.create_time
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public void setCreateTime(Integer createTime) {
		this.createTime = createTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_info.enabled
	 * @return  the value of user_info.enabled
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public Integer getEnabled() {
		return enabled;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_info.enabled
	 * @param enabled  the value for user_info.enabled
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_info.head_url
	 * @return  the value of user_info.head_url
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public String getHeadUrl() {
		return headUrl;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_info.head_url
	 * @param headUrl  the value for user_info.head_url
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_info.user_type
	 * @return  the value of user_info.user_type
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public Integer getUserType() {
		return userType;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_info.user_type
	 * @param userType  the value for user_info.user_type
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_info.update_time
	 * @return  the value of user_info.update_time
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public Integer getUpdateTime() {
		return updateTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_info.update_time
	 * @param updateTime  the value for user_info.update_time
	 * @mbg.generated  Mon Sep 04 19:40:18 CST 2017
	 */
	public void setUpdateTime(Integer updateTime) {
		this.updateTime = updateTime;
	}
}