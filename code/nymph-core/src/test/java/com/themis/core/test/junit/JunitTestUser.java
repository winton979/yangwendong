package com.themis.core.test.junit;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.themis.userinfo.dao.UserInfoMapper;
import com.themis.userinfo.entity.UserInfo;

public class JunitTestUser {

	private UserInfoMapper dao;

	@Before
	public void init() {
		ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
		SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) classPathXmlApplicationContext.getBean("sqlSessionFactory");
		SqlSession sqlSession = sqlSessionFactory.openSession();
		dao = sqlSession.getMapper(UserInfoMapper.class);
		classPathXmlApplicationContext.close();
	}

	@Test
	public void testGetUserById() {
		UserInfo user = dao.selectByPrimaryKey(1);
		System.out.println("用户的名字是 : " + user.toString());
	}
}
