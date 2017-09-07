package com.themis.test.user;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.themis.test.BaseTest;
import com.themis.userinfo.entity.UserInfo;
import com.themis.userinfo.service.UserInfoService;

public class UserInfoTest extends BaseTest{
	
	@Autowired
	UserInfoService service;
	
	@Test
	public void testSelectByPK() {
		UserInfo userInfo = service.selectByPrimaryKey(1);
		Assert.assertEquals("admin", userInfo.getNickname());
	}
	
}
