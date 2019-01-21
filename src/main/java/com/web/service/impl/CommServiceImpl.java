package com.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.core.service.impl.BaseServiceImpl;
import com.web.service.intf.CommService;


@Service("commService")
public class CommServiceImpl extends BaseServiceImpl implements CommService {
	
	@Override
	@SuppressWarnings("unchecked")
	public  Map<String, Object> getSeq(Map<String, Object> args) throws Exception{
		StringBuffer sql = new StringBuffer();
		sql.append("select credit.nextval('"+args.get("seq_name")+"') nextvalue");
		return  (Map<String, Object>) this.getQueryMap(sql.toString());
	}

	@Override
	public List<?> getDictList(Map<String, Object> args) throws Exception {
		StringBuffer  sql=new  StringBuffer();
		sql.append("select  t.dict_id,t.dict_name from cfg_dict t where  is_valid=1 and t.dict_id=:dict_id and t.super_dict_id=:super_dict_id");
		return this.getQueryList(sql.toString(),args);
	}
	
}
