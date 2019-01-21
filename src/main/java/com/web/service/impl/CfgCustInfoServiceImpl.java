package com.web.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.core.entity.SplitPage;
import com.core.service.impl.BaseServiceImpl;
import com.web.service.intf.CfgCustInfoService;


@Service("cfgCustInfoService")
public class CfgCustInfoServiceImpl extends BaseServiceImpl implements CfgCustInfoService {

	@Override
	public List<?> getcfgCustInfoList(Map<String, Object> args,
			SplitPage page) throws Exception {
			StringBuffer sql = new StringBuffer();
			sql.append("select cust_id, cust_name, id_type");
			sql.append(",id_number        ");
			sql.append(",mobile_phone     ");
			sql.append(",land_phone       ");
			sql.append(",occup_type       ");
			sql.append(",income_source    ");
			sql.append(",amount_value     ");
			sql.append(",co_type          ");
			sql.append(",co_name          ");
			sql.append(",co_phone         ");
			sql.append(",co_address       ");
			sql.append(",account_name     ");
			sql.append(",khh_name         ");
			sql.append(",account_id       ");
			sql.append(" from cfg_cust_info ");
			sql.append("where  1 = 1 ");
			if(!"".equals(args.get("serchMsg"))&null!=args.get("serchMsg")){
				sql.append(" and cust_name like '%"+args.get("serchMsg")+"%'");
			}
		return this.getQueryPageList(sql.toString(), page);
	}

	@Override
	public void doSaveCfgCustInfoManage(Map<String, Object> args) throws Exception {
		StringBuffer  sql=new  StringBuffer();
		sql.append("insert into cfg_cust_info (");
		sql.append("  cust_id      ");
		sql.append(" ,cust_name    ");
		sql.append(" ,id_type      ");
		sql.append(" ,id_number    ");
		sql.append(" ,mobile_phone ");
		sql.append(" ,land_phone   ");
		sql.append(" ,occup_type   ");
		sql.append(" ,income_source");
		sql.append(" ,amount_value ");
		sql.append(" ,co_type      ");
		sql.append(" ,co_name      ");
		sql.append(" ,co_phone     ");
		sql.append(" ,co_address   ");
		sql.append(" ,account_name ");
		sql.append(" ,khh_name     ");
	/*	sql.append(" ,stream_value     ");
		sql.append(" ,is_true     ");
		sql.append(" ,is_stream     ");
		sql.append(" ,is_true_stream     ");*/
		sql.append(" ,account_id)   values(");
		sql.append(" :cust_id      ");
		sql.append(" ,:cust_name    ");
		sql.append(" ,:id_type      ");
		sql.append(" ,:id_number    ");
		sql.append(" ,:mobile_phone ");
		sql.append(" ,:land_phone   ");
		sql.append(" ,:occup_type   ");
		sql.append(" ,:income_source");
		sql.append(" ,cast(:amount_value as decimal(10,2)) ");
		sql.append(" ,:co_type      ");
		sql.append(" ,:co_name      ");
		sql.append(" ,:co_phone     ");
		sql.append(" ,:co_address   ");
		sql.append(" ,:account_name ");
		sql.append(" ,:khh_name     ");
		/*sql.append(" ,:stream_value     ");
		sql.append(" ,:is_true     ");
		sql.append(" ,:is_stream     ");
		sql.append(" ,:is_true_stream     ");*/
		sql.append(" ,:account_id     )");
		this.doSaveAsUpdate(sql.toString(), args);
	}

	
}
