package com.themis.core.test.user;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.nymph.userinfo.entity.UserInfo;
import com.nymph.userinfo.mapper.UserInfoMapper;
import com.themis.core.base.BaseTest;

public class UserInfoTestCase extends BaseTest {

	@Autowired
	private UserInfoMapper dao;

	@Test
	public void testGetUserById() {
		UserInfo user = dao.selectById(1);
		System.out.println("用户的名字是 : " + user.toString());
	}
}
