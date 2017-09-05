package com.themis.userinfo.service;

import com.themis.userinfo.entity.UserInfo;

public interface UserInfoService {
		
	/**
	 * 根据主键查询
	 * @param userInfo
	 * @return
	 */
	UserInfo selectByPrimaryKey(Integer id);
	
}
