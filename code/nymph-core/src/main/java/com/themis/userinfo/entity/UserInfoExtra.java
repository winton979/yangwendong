package com.themis.userinfo.entity;

import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class UserInfoExtra extends UserInfo {

	private static final long serialVersionUID = -4448387767744983827L;
	
	private String hi;

	@Builder
	public UserInfoExtra(Integer id, String nickname, String suid, String token, String signInName,
			String signInPassword, String salt, Integer createTime, Integer enabled, String headUrl, Integer userType,
			Integer updateTime, String hi) {
		super(id, nickname, suid, token, signInName, signInPassword, salt, createTime, enabled, headUrl, userType,
				updateTime);
		this.hi = hi;
	}

	public static class UserInfoExtraBuilder extends UserInfoBuilder {
		UserInfoExtraBuilder() {
			super();
		}
	}
	
	public static void main(String[] args) {
		UserInfoExtra build = new UserInfoExtra.UserInfoExtraBuilder().nickname("132").hi("123").build();
		System.out.println(build);
	}
	
}
