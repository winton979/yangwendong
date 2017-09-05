package com.themis.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.themis.userinfo.entity.UserInfo;
import com.themis.userinfo.service.UserInfoService;

@Controller
@RequestMapping(value="user/info")
public class UserInfoController {
	
	@Autowired
	private UserInfoService UserInfoService;
	
	@RequestMapping(value="test",method=RequestMethod.GET)
	@ResponseBody
	public UserInfo test(Integer id) {
		return UserInfoService.selectByPrimaryKey(id);
	}
	
}
