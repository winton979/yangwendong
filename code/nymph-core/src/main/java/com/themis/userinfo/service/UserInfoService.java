package com.themis.userinfo.service;

import org.springframework.cache.annotation.Cacheable;
import com.themis.userinfo.entity.UserInfo;

public interface UserInfoService {
		
	/**
	 * 根据主键查询
	 * @param userInfo
	 * @return
	 */
	@Cacheable(value="test",key="'test'")
	UserInfo selectByPrimaryKey(Integer id);
	
}
