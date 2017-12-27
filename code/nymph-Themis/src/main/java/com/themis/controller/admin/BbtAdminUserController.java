package com.themis.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 */
@Controller
@RequestMapping(value = "/adminUser")
public class BbtAdminUserController {

	/**
	 * 执行搜索
	 */
	@GetMapping
	public String index(Model model, HttpServletRequest request) {
		return "auth/adminUser/adminUserIndex";
	}

	/**
	 * 执行搜索
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) {
		return "auth/adminUser/adminUserList";
	}

}