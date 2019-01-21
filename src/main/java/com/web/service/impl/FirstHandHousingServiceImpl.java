package com.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.core.service.impl.BaseServiceImpl;
import com.core.entity.SessionBean;
import com.core.entity.SplitPage;
import com.core.utils.GlobalConst;
import com.web.service.intf.FirstHandHousingService;
import com.web.service.intf.LoginService;
import com.web.service.intf.MainIndexService;

@Service("firstHandHousingService")
public class FirstHandHousingServiceImpl extends BaseServiceImpl implements FirstHandHousingService {

	@Override
	public List<?> getdicTypeList(String type) throws Exception {
		Map<String, Object> args=new HashMap<String, Object>();
		StringBuffer buf = new StringBuffer();
		args.put("super_dict_id", type);
		buf.append("select  t.dict_id,t.dict_name  from cfg_dict t where t.super_dict_id=:super_dict_id");
		return this.getQueryList(buf.toString(),args);
	}

	@Override
	public List<?> getdictBank(Map<String, Object> params) throws Exception {
		StringBuffer buf = new StringBuffer();
		String type=params.get("type").toString();
		if("1".equals(type)){
			buf.append("select  DISTINCT(bank_id) dict_id,bank_name dict_name  from  dict_bank");
		}else if("2".equals(type)){
			buf.append("select  branch_id dict_id,branch_name dict_name from  dict_bank where bank_id=:bank_id");
		}else if("3".equals(type)){
			buf.append("select  sub_branch_id dict_id,sub_branch_name dict_name from  dict_bank where bank_id=:bank_id");
		}
		
		return this.getQueryList(buf.toString(),params);
	}

	@Override
	public List<?> getPretradeHouse(Map<String, Object> params)
			throws Exception {
		StringBuffer buf = new StringBuffer();
		String type=params.get("type").toString();
		if("1".equals(type)){
			buf.append("select  DISTINCT(province_id) dict_id,province_name dict_name  from  dict_area");
		}else if("2".equals(type)){
			buf.append("select  DISTINCT(city_id) dict_id,city_name dict_name  from  dict_area  where province_id=:pretrade_house");
		}else if("3".equals(type)){
			buf.append("select  DISTINCT(county_id) dict_id,county_name dict_name  from  dict_area  where city_id=:pretrade_house");
		}else if("4".equals(type)){
			buf.append("select  DISTINCT(street_id) dict_id,street_name dict_name  from  dict_area  where county_id=:pretrade_house");
		}
		
		return this.getQueryList(buf.toString(),params);
	}

	@Override
	public List<?> getCrdtModifyFeeList(Map<String, Object> args, SplitPage page)
			throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("select  t.case_id,t.fee_item_id,			");
		sql.append("t.fee_item_name,t.unit_price,t.count_num,t.fee_amount from crdt_modify_fee t        ");
		sql.append("where  1=1 ");
		if(!"".equals(args.get("case_id"))&null!=args.get("case_id")){
			sql.append(" and t.case_id='"+args.get("case_id")+"'");
		}
		
		return this.getQueryPageList(sql.toString(), page);
	}
	
	
	@Override
	public List<?> getCrdtDataInfoList(Map<String, Object> args, SplitPage page)
			throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("select  t.case_id,t.data_belong,			");
		sql.append("t.data_count,t.org_info,t.dup_info,t.remark,t.state,t.data_name from crdt_data_info t        ");
		sql.append("where  1=1 ");
		if(!"".equals(args.get("case_id"))&null!=args.get("case_id")){
			sql.append(" and t.case_id='"+args.get("case_id")+"'");
		}
		
		return this.getQueryPageList(sql.toString(), page);
	}

	@Override
	public void saveCrdtModifyFee(Map<String, Object> args) throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("insert into crdt_modify_fee(case_id,fee_item_name,unit_price,count_num,fee_amount)  values(");
		sql.append(" :caseId,:fee_item_name,:unit_price,:count_num,:fee_amount)");
		this.doSaveAsUpdate(sql.toString(),args);
	}

	@Override
	public void saveCrdtDataInfo(Map<String, Object> args) throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("insert into crdt_data_info(case_id,data_belong,data_name,data_count,org_info,dup_info,org_info,remark,state)  values(");
		sql.append(" :caseId,:data_belong,:data_name,:data_count,:org_info,:remark,:state)");
		this.doSaveAsUpdate(sql.toString(),args);
	}
	
}
