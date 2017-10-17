package com.coreopsis.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.springframework.web.context.support.SpringBeanAutowiringSupport;

@WebFilter(urlPatterns="/*")
public class Filter_0_FirstFilter implements Filter{

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, arg0.getServletContext());
		System.out.println("filter0初始化");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		
	}
	
	
	
}
