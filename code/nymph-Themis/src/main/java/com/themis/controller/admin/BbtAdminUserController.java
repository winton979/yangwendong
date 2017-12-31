package com.themis.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.coreopsis.R;
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
	@GetMapping("/index")
	public String index(Model model, HttpServletRequest request) {
		return "system/adminuser/index";
	}
	
	/**
	 * 新增
	 */
	@GetMapping(value="add")
	public String add(Model model, HttpServletRequest request) {
		return "system/adminuser/add";
	}
	
	/**
	 * 保存
	 */
	@PostMapping(value="save")
	@ResponseBody
	public R save(BbtAdminUser bbtAdminUser, HttpServletRequest request) {
		iBbtAdminUserService.insert(bbtAdminUser);
		return R.ok("新增成功");
	}

	/**
	 * 执行搜索
	 */
	@GetMapping(value = "list")
	public String list(Model model, HttpServletRequest request) {
		System.out.println(request.getParameter(BbtAdminUser.TABLE_FIELD_USER_NAME));
		Wrapper<BbtAdminUser> wrapper = Condition.create().like(BbtAdminUser.TABLE_FIELD_USER_NAME, request.getParameter(BbtAdminUser.TABLE_FIELD_USER_NAME));
		PageInfo<BbtAdminUser> rInfo = iBbtAdminUserService.page(wrapper);
		model.addAttribute("list", rInfo);
		return "system/adminuser/list";
	}

}