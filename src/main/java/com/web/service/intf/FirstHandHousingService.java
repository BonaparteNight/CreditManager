package com.web.service.intf;

import java.util.List;
import java.util.Map;

import com.core.entity.SplitPage;

public interface FirstHandHousingService {
	
	/**
	 * 查询字典项
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<?>  getdicTypeList(String type) throws Exception;
	
	/**
	 * 查询银行字典项
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<?>  getdictBank(Map<String, Object> params) throws Exception;
	

	/**
	 * 查询地址信息
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<?>  getPretradeHouse(Map<String, Object> params) throws Exception;
	
	/**
	 * 分页费用
	 * @param args
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<?> getCrdtModifyFeeList(Map<String,Object> args,SplitPage page) throws Exception;
	
	/**
	 * 分页材料
	 * @param args
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<?> getCrdtDataInfoList(Map<String,Object> args,SplitPage page) throws Exception;
	
	
	/**
	 * 保存费用
	 * @param args
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public void saveCrdtModifyFee(Map<String,Object> args) throws Exception;
	
	
	/**
	 * 保存材料
	 * @param args
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public void saveCrdtDataInfo(Map<String,Object> args) throws Exception;
	
	
}
