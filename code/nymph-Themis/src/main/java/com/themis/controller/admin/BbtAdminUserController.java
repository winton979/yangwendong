package com.themis.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nymph.adminuser.entity.BbtAdminUser;
import com.nymph.adminuser.service.IBbtAdminUserService;

/**
 */
@Controller
@RequestMapping(value = "/adminUser")
public class BbtAdminUserController {

	@Autowired
	IBbtAdminUserService iBbtAdminUserService;
	
	/**
	 * index
	 */
	@GetMapping
	public String index(Model model, HttpServletRequest request) {
		return "system/adminuser/index";
	}
	
	/**
	 * index
	 */
	@GetMapping(value="add")
	public String add(Model model, HttpServletRequest request) {
		return "system/adminuser/add";
	}

	/**
	 * 执行搜索
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) {
		PageInfo<BbtAdminUser> rInfo = PageHelper.startPage(request).doSelectPageInfo(()-> iBbtAdminUserService.selectList(null));
		System.out.println(rInfo);
		model.addAttribute("list", rInfo);
		return "system/adminuser/list";
	}

}