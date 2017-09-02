package com.themis.test.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="h")
public class indexc {
	@RequestMapping(value="i")
	public void index (HttpServletResponse resp) throws IOException {
		resp.getWriter().print("123");
	}
}
