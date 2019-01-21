package com.web.service.intf;

import java.util.List;
import java.util.Map;


/**
 * 公共
 * @author ljw
 *
 */
public interface CommService {
	/**
	 * 获取序列
	 * @param args
	 * @return
	 * @throws Exception
	 */
	public  Map<String, Object> getSeq(Map<String, Object> args) throws Exception;
	
	
	/**
	 * 查询所以字典项
	 * @param args
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<?> getDictList(Map<String, Object> args) throws Exception;
	
}
