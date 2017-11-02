package com.themis.userinfo.entity;

public class UserInfoExtra extends UserInfo {

	UserInfoExtra(Integer id, String nickname, String suid, String token, String signInName, String signInPassword,
			String salt, Integer createTime, Integer enabled, String headUrl, Integer userType, Integer updateTime) {
		super(id, nickname, suid, token, signInName, signInPassword, salt, createTime, enabled, headUrl, userType, updateTime);
		// TODO Auto-generated constructor stub
	}

	private static final long serialVersionUID = -4448387767744983827L;
	
}
