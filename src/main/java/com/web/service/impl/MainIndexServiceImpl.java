package com.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.core.service.impl.BaseServiceImpl;
import com.core.entity.SessionBean;
import com.core.utils.GlobalConst;
import com.web.service.intf.LoginService;
import com.web.service.intf.MainIndexService;

@Service("mainIndexService")
public class MainIndexServiceImpl extends BaseServiceImpl implements MainIndexService {

	@Override
	public List<?> getMenuList(String userId) throws Exception {
		Map<String, Object> args=new HashMap<String, Object>();
		args.put("userId", userId);
		StringBuffer sql = new StringBuffer();
		sql.append("select  t.func_id,t.func_name,t.func_type,t.seq_num,t.func_url,t.super_func_id  from  dict_sys_func t ");
		sql.append(" where 	t.func_id  in (");
		sql.append(" select func_id  from   cfg_role_func  where   ");
		sql.append(" role_id=(select role_id from  cfg_user_role  where user_id=:userId))  order by t.func_type,t.super_func_id,t.seq_num");
		return this.getQueryList(sql.toString(),args);
	}
	
	
	
	
}
