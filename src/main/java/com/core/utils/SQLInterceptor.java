package com.core.utils;



import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 利用拦截器防止SQL注入
 * @author ThinkPad
 */
public class SQLInterceptor implements HandlerInterceptor {


	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
	}
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {
	}
	@SuppressWarnings("unchecked")
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		Enumeration<String> names = arg0.getParameterNames();
		while (names.hasMoreElements()) {
			String name = names.nextElement();
			String[] values = arg0.getParameterValues(name);
			for (int i = 0; i < values.length; i++) {
				if(values[i]!=null&&(values[i].contains("DELETE")||values[i].toLowerCase().contains("script"))) {
					arg1.setContentType("text/html;charset=utf-8");
					arg1.getWriter().print("请不要尝试注入<br><a href='#' onclick='history.go(-1)'>返回</a>");
					return false;
				}
			}
		}
		return true;
	}

}
