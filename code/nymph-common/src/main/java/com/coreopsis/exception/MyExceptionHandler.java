package com.coreopsis.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coreopsis.R;

@ControllerAdvice
public class MyExceptionHandler {

	@ExceptionHandler(value={Exception.class})
	@ResponseBody
	public R resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		ex.printStackTrace();
		// 接口参数为空的异常
		if (ex instanceof IllegalStateException) {
			IllegalStateException e = (IllegalStateException) ex;
			return R.r(-1, "", e.getMessage());
		}
		return R.r(-1, "", ex.getMessage());
	}

}
