package com.themis.userinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.themis.base.BaseServiceImpl;
import com.themis.userinfo.dao.UserInfoMapper;
import com.themis.userinfo.entity.UserInfo;
import com.themis.userinfo.entity.UserInfoExample;

import lombok.NonNull;


@Service("userInfoService")
public class UserInfoServiceImpl extends BaseServiceImpl<UserInfoExample, UserInfo> {
	
	@Autowired
	private UserInfoMapper userInfoMapper;

	@Override
	@Cacheable(value="test",key="'test'")
	public UserInfo selectByPrimaryKey(@NonNull Integer id) {
		return userInfoMapper.selectByPrimaryKey(id);
	}


}
