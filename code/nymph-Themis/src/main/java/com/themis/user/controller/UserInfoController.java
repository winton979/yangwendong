package com.themis.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coreopsis.R;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.themis.userinfo.entity.UserInfo;
import com.themis.userinfo.service.UserInfoService;

@Controller
@RequestMapping(value="/user/info")
public class UserInfoController {
	
	@Autowired
	private UserInfoService UserInfoService;
	
	@GetMapping(value="/test")
	@ResponseBody
	public R test(Integer id,HttpServletRequest req) {
		PageInfo<UserInfo> pageInfo = PageHelper.startPage(req).doSelectPageInfo(() -> UserInfoService.selectByPrimaryKey(id));
		return R.ok(pageInfo, "查询分页成功");
	}
	
}
