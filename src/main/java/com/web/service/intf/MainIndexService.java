package com.web.service.intf;

import java.util.List;

public interface MainIndexService {
	
	/**
	 * 根据当前登录人查询对应的菜单
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<?>  getMenuList(String userId) throws Exception;
	
}
