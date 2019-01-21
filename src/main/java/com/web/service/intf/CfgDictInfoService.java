package com.web.service.intf;
import java.util.List;
import java.util.Map;
import com.core.entity.SplitPage;
import com.core.service.BaseService;


public interface CfgDictInfoService extends BaseService{
	/**
	 * 分页查询客户信息
	 * @param args
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<?> getcfgCustInfoList(Map<String,Object> args,SplitPage page) throws Exception;
	
	/**
	 * 保存修改的次数
	 * @param args
	 * @throws Exception
	 */
	public void  doSavecfgCustInfoManage(Map<String, Object> args)throws Exception;
	
	/**
	 * 查询上级描述
	 * @param args
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<?> getSuperDictId(Map<String,Object> args) throws Exception;
	
}
