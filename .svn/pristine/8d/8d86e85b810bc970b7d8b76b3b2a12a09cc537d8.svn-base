package com.jwt.config;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

	 public static final String DEFAULT_ERROR_VIEW = "500";

		@ExceptionHandler(Exception.class)
		public ModelAndView handleSQLException(HttpServletRequest request, Exception ex){
			System.out.println("database_error");
             ex.printStackTrace();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("500");
			 mav.addObject("exception", ex.getMessage());
             
			return mav;
		}

}
