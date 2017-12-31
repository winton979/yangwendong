package com.themis.core.test.admin;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.nymph.adminuser.entity.BbtAdminUser;
import com.nymph.adminuser.mapper.BbtAdminUserMapper;
import com.themis.core.base.BaseTest;

public class UserInfoTestCase extends BaseTest {

	@Autowired
	private BbtAdminUserMapper dao;

	@Test
	public void testGetUserById() {
		BbtAdminUser selectById = dao.selectById(1);
		System.out.println("用户的名字是 : " + selectById);
	}

}
