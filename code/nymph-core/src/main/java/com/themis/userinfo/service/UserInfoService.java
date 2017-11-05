package com.themis.userinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.themis.userinfo.dao.UserInfoMapper;
import com.themis.userinfo.entity.UserInfo;

import lombok.NonNull;


@Service("userInfoService")
public class UserInfoService {
	
	@Autowired
	private UserInfoMapper userInfoMapper;

	//@Cacheable(value="test",key="'test'")
	public UserInfo selectByPrimaryKey(@NonNull Integer id) {
		return userInfoMapper.selectByPrimaryKey(id);
	}


}
