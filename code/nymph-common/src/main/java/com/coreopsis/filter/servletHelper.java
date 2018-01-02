package com.coreopsis.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns="/*")
public class servletHelper implements Filter {  
    public static ThreadLocal<HttpServletRequest> threadLocalRequest = new ThreadLocal<HttpServletRequest>();  
    public static ThreadLocal<HttpServletResponse> threadLocalResponse = new ThreadLocal<HttpServletResponse>();  
  
    @Override
    public void doFilter(ServletRequest arg0, ServletResponse arg1,  
            FilterChain arg2) throws IOException, ServletException {  
    	
        threadLocalRequest.set((HttpServletRequest) arg0);  
        threadLocalResponse.set((HttpServletResponse) arg1);  
        arg2.doFilter(arg0, arg1);  
        threadLocalRequest.remove();
    	threadLocalResponse.remove();
    }  
  
    @Override
    public void destroy() {  
    	
    }  
  
    @Override
    public void init(FilterConfig arg0) throws ServletException { 
    	System.out.println("初始化servletHelper");
    }  
} 