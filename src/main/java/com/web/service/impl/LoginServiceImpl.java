package com.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.core.service.impl.BaseServiceImpl;
import com.core.entity.SessionBean;
import com.core.utils.GlobalConst;
import com.web.service.intf.LoginService;

@Service("loginService")
public class LoginServiceImpl extends BaseServiceImpl implements LoginService {

	
	@Override
	public boolean getUser(Map<String, Object> args)  throws Exception{
		boolean flag=false;
		StringBuffer sql=new StringBuffer();
		sql.append("  ");
		List<?> list=this.getQueryList(sql.toString(), args);
		
		if(list.size()>0){
			flag=true;
		}
		return flag;
	}

	/**
	 * 获取人员session信息
	 */
	@Override
	public SessionBean getSessionBean(String userId) throws Exception {
		StringBuffer buf = new StringBuffer();
		buf.append("select t.user_id userId");
		buf.append(",t.user_name  userName");
		buf.append(",t.user_pw  PASSWORD");
		buf.append(",t.org_id orgId");
		buf.append(",t.innet_date");
		buf.append(",t.m_phone");
		buf.append(",t.l_phone");
		buf.append(",t.email_address");
		buf.append(",t1.org_name orgName ");
		buf.append(",t1.super_org_id ");
		buf.append("from  cfg_user t  left join  cfg_org t1 on t.org_id = t1.org_id ");
		buf.append(" where  t.user_id='"+userId+"'");
		return this.getInfo(buf.toString(), SessionBean.class);
	}
	
	@Override
	public List<?> getRoleList(String userId) throws Exception {
		Map<String, Object> args=new HashMap<String, Object>();
		args.put("userId", userId);
		StringBuffer sql = new StringBuffer();
		sql.append("select  role_id,role_name from 	dict_role	 where 		role_id in 		(select role_id from  cfg_user_role  where user_id=:userId)	");
		return this.getQueryList(sql.toString(),args);
	}
	
}
