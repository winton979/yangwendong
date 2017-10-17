package com.themis.test.user;



import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.DefaultMockMvcBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.coreopsis.filter.Filter_0_FirstFilter;
import com.themis.admin.controller.AdminController;
import com.themis.base.BaseTest;

public class AdminUserControllerTest extends BaseTest{
	
	private MockMvc mvc;
	
	@Before
	public void setUp() throws Exception {
		mvc = MockMvcBuilders.standaloneSetup(new AdminController()).addFilters(new Filter_0_FirstFilter()).build();
	}
	
	@Test
	public void test() {
		System.out.println();
	}
	
	@Test
	public void testController () throws Exception {
		mvc.perform(MockMvcRequestBuilders.post("/index/login").accept(MediaType.parseMediaType("application/json;charset=UTF-8")))
        .andExpect(status().isOk())
        .andExpect(content().contentType("application/json;charset=UTF-8"))
        .andExpect(content().json("{'foo':'bar'}"));
	}
	
}
