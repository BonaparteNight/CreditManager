package com.core.utils;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.core.entity.SessionBean;


public class AuthInterceptor implements HandlerInterceptor {

private List<String> excludeUrls;
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		boolean isBoolean = false;
		for(int i=0;i<excludeUrls.size();i++){
			if(request.getRequestURI().equals(excludeUrls.get(i))){
				isBoolean = true;
				break;
			}
		}
		if (!isBoolean) {
			HttpSession session = ContextHolderUtils.getSession();
			if(session!=null){
				SessionBean sessionBean = (SessionBean)session.getAttribute(GlobalConst.SESSION_KEY);
				if(sessionBean==null){
					request.setAttribute("type", "1");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
					return false;
				}else{
					return true;
				}
			}else{
				request.setAttribute("type", "3");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
				return false;
			}
		}
		return isBoolean;
	}

	public List<String> getExcludeUrls() {
		return excludeUrls;
	}

	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}
}
