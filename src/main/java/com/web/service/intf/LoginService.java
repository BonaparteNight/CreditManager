package com.web.service.intf;

import java.util.List;
import java.util.Map;

import com.core.entity.SessionBean;


public interface LoginService {
	/**
	 * 登录
	 * @param args
	 * @return
	 */
	public boolean  getUser(Map<String, Object> args) throws Exception;
	
	/**
	 * 获取登录人信息
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	 
	public SessionBean getSessionBean(String userId) throws Exception;
	
	/**
	 * 获取登陆人的权限
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<?> getRoleList(String userId) throws Exception;
}
