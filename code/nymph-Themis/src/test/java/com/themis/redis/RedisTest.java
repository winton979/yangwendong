package com.themis.redis;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import com.themis.base.BaseTest;

public class RedisTest extends BaseTest {
	
	@Autowired
	private RedisTemplate t;
	
	@Test
	public void RedisConnection() {
		System.out.println(t.opsForValue().get("hi"));
	}
}
