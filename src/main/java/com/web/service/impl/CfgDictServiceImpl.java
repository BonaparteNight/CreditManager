package com.web.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.core.entity.SplitPage;
import com.core.service.impl.BaseServiceImpl;
import com.web.service.intf.CfgDictInfoService;


@Service("cfgDictInfoService")
public class CfgDictServiceImpl extends BaseServiceImpl implements CfgDictInfoService {

	@Override
	public List<?> getcfgCustInfoList(Map<String, Object> args,
			SplitPage page) throws Exception {
			StringBuffer sql = new StringBuffer();
			sql.append("select  t.dict_id,t.dict_name,			");
			sql.append("t.super_dict_id,t.dict_tab_name from cfg_dict t        ");
		/*	sql.append("LEFT JOIN cfg_dict t1  on t.super_dict_id=t1.dict_id      ");*/
			sql.append("where  t.is_valid='1' ");
			if(!"".equals(args.get("dict_id"))&null!=args.get("dict_id")){
				sql.append(" and t.dict_id='"+args.get("dict_id")+"'");
			}
			if(!"".equals(args.get("dict_name"))&null!=args.get("dict_name")){
				sql.append(" and t.dict_name='"+args.get("dict_name")+"'");
			}
			if(!"".equals(args.get("super_dict_id"))&null!=args.get("super_dict_id")){
				sql.append(" and t.super_dict_id='"+args.get("super_dict_id")+"'");
			}
			return this.getQueryPageList(sql.toString(), page);
	}

	@Override
	public void doSavecfgCustInfoManage(Map<String, Object> args) throws Exception {
		StringBuffer  sql=new  StringBuffer();
		sql.append("insert into cfg_dict (");
		sql.append(" dict_id             ");
		sql.append(",dict_name           ");
		sql.append(",super_dict_id       ");
		sql.append(",is_valid            ");
		sql.append(",dict_tab_name       )");
		sql.append("values( ");
		sql.append(" :dict_id             ");
		sql.append(",:dict_name           ");
		sql.append(",:super_dict_id       ");
		sql.append(",'1'           ");
		if(!"".equals(args.get("dict_tab_name"))&null!=args.get("dict_tab_name")){
			sql.append(",:dict_tab_name       )");
		}else{
			sql.append(",'cfg_dict'       )");
		}
		
		this.doSaveAsUpdate(sql.toString(), args);
	}

	@Override
	public List<?> getSuperDictId(Map<String, Object> args) throws Exception {
		StringBuffer  sql=new  StringBuffer();
		sql.append("select  t.dict_id,t.dict_name from cfg_dict t where t.super_dict_id=''  and is_valid=1 ");
		if(!"".equals(args.get("super_dict_id"))&null!=args.get("super_dict_id")){
			sql.append(" and dict_id=:super_dict_id");
		}
		return this.getQueryList(sql.toString(),args);
	}

	
}
