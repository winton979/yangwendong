package com.themis.userinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.themis.userinfo.dao.UserInfoMapper;
import com.themis.userinfo.entity.UserInfo;


@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {
	
	@Autowired
	private UserInfoMapper userInfoMapper;

	@Override
	public UserInfo selectByPrimaryKey(Integer id) {
		if (id == null) {
			return new UserInfo();
		}
		return userInfoMapper.selectByPrimaryKey(id);
	}
	

}
