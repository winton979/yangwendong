package com.themis.test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="us")
public class indexc {
	@RequestMapping(value="game")
	public void index (HttpServletResponse resp) throws IOException {
		PrintWriter pw = resp.getWriter();
		pw.print("HELLO WORLD,WINTON"); // TEST JENKINS
		pw.close();
	}
}
