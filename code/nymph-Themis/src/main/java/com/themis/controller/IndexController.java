package com.themis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 基础页面
 */
@Controller
@RequestMapping("/")
public class IndexController {

	/**
	 * 登陆页面
	 */
	@GetMapping
	public String index() {
		return "index";
	}
	
	/**
	 * 登陆页面
	 */
	@GetMapping(value="welcome")
	public String welcome() {
		return "welcome";
	}
	
	@GetMapping(value="/login")
	public String login() {
		return "login";
	}
	
}