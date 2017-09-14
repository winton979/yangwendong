package com.themis.test.user;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.themis.base.BaseTest;
import com.themis.user.controller.UserInfoController;
import com.themis.userinfo.entity.UserInfo;
import com.themis.userinfo.service.UserInfoService;

public class UserInfoTest extends BaseTest{
	
	@InjectMocks
	UserInfoController controller;
	
	private MockMvc mockMvc;
	
	@Autowired
	UserInfoService service;
	
	@Before
    public void setup() {
        MockitoAnnotations.initMocks(this);
        this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }
	
	@Test
	public void testSelectByPK() {
		UserInfo userInfo = service.selectByPrimaryKey(1);
		Assert.assertEquals("admin", userInfo.getNickname());
	}
	
	
}
