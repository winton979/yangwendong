package com.themis.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.coreopsis.R;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.themis.userinfo.entity.UserInfo;
import com.themis.userinfo.service.UserInfoService;
import com.xiaoleilu.hutool.log.Log;
import com.xiaoleilu.hutool.log.LogFactory;

@Controller
@RequestMapping(value="/user/info")
public class UserInfoController {
	
	private Log log = LogFactory.get();
	
	@Autowired
	private UserInfoService UserInfoService;
	
	@GetMapping(value="/test")
	@ResponseBody
	public R test(int id,HttpServletRequest req) {
		PageInfo<UserInfo> pageInfo = PageHelper.startPage(req).doSelectPageInfo(() -> UserInfoService.selectByPrimaryKey(id));
		log.info("aha");
		return R.ok(pageInfo, "查询分页成功");
	}
	
}
