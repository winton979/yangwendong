package com.themis.userinfo.service;

import com.themis.base.BaseService;
import com.themis.userinfo.entity.UserInfo;
import com.themis.userinfo.entity.UserInfoExample;

public interface UserInfoService extends BaseService<UserInfoExample, UserInfo>{
		
	/**
	 * 根据主键查询
	 * @param userInfo
	 * @return
	 */
	UserInfo selectByPrimaryKey(Integer id);
	
}
