package com.themis.base;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class) // 使用junit4进行测试
@ContextConfiguration(locations = {"classpath*:/applicationContext.xml"}) // 加载配置文件
@WebAppConfiguration
@Rollback(value=false)
@Transactional(transactionManager = "transactionManager")
public class BaseTest {
	
	@Test
	public void test() {
		System.out.println("");
	}
	
}
