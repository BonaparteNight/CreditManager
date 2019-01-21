package com.web.controller;



import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chrriis.common.WebServer.HTTPRequest;

import com.core.controller.BaseController;
import com.core.entity.AjaxJson;
import com.core.entity.SplitPage;
import com.core.utils.GlobalConst;
import com.web.service.intf.CfgCustInfoService;
import com.web.service.intf.CommService;

/**
 * 干系人关系表/客户信息管理
 * @author ljw
 */
@Controller
@RequestMapping("cfgCustInfo")
public class CfgCustInfoController extends BaseController{

	@Resource
    private CfgCustInfoService cfgCustInfoService;
	@Resource
	private CommService  commService;
	
	@RequestMapping("cfgCustInfoIndex")
	public String excuteTotalInedx(ModelMap model,HttpServletRequest request) throws Exception {
		String type=request.getParameter("type");
		if("".equals(type)||null==type){
			model.put("role", "1");
		}else if("2".equals(type)){
			model.put("role", "2");
		}else if("3".equals(type)){
			model.put("role", "3");
		}
		
		
		
		return "dictManager/cfgCustInfo/cfgCustInfoIndex";
	}
	
	
	
	/**
	 * 客户信息管理配置查询
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getcfgCustInfoList",method = RequestMethod.POST)
	@ResponseBody
	public Object getcfgCustInfoList(HttpServletRequest request) throws Exception {
		SplitPage page = this.getSplitPage();
		Map<String,Object> args = new HashMap<String,Object>();
		
		String userId=this.getUserId();
		String serchMsg = (String)request.getParameter("serchMsg");
		args.put("serchMsg", serchMsg);
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		try{
			String type=request.getParameter("type");
			if(!"".equals(type)&null!=type){
				retMap.put("role", "1");
			}else{
				retMap.put("role", "2");
			}
			List<Map<String, Object>> ret = (List<Map<String, Object>>) cfgCustInfoService.getcfgCustInfoList(args, page);
			List<Map<String, Object>> newRet=new ArrayList<Map<String,Object>>();
			Map<String, Object>  dictMap=new HashMap<String, Object>();
			for(Map<String, Object> map:ret){
				
				if(!"".equals(map.get("id_type"))&null!=map.get("id_type")){
					dictMap.put("dict_id", map.get("id_type"));
					dictMap.put("super_dict_id", "7");
					map.put("id_type_name", ((List<Map<String, Object>>)commService.getDictList(dictMap)).get(0).get("dict_name"));
				}else{
					map.put("id_type_name", "");
				}
				
				if(!"".equals(map.get("occup_type"))&null!=map.get("occup_type")){
					dictMap.put("dict_id", map.get("occup_type"));
					dictMap.put("super_dict_id", "8");
					map.put("occup_type_name", ((List<Map<String, Object>>)commService.getDictList(dictMap)).get(0).get("dict_name"));
				}else{
					map.put("occup_type_name", "");
				}
				
				if(!"".equals(map.get("income_source"))&null!=map.get("income_source")){
					dictMap.put("dict_id", map.get("income_source"));
					dictMap.put("super_dict_id", "9");
					map.put("income_source_name", ((List<Map<String, Object>>)commService.getDictList(dictMap)).get(0).get("dict_name"));
				}else{
					map.put("income_source_name", "");
				}
				
				if(!"".equals(map.get("co_type"))&null!=map.get("co_type")){
					dictMap.put("dict_id", map.get("co_type"));
					dictMap.put("super_dict_id", "13");
					map.put("co_type_name", ((List<Map<String, Object>>)commService.getDictList(dictMap)).get(0).get("dict_name"));
					
				}else{
					map.put("co_type_name", "");
				}
				
				newRet.add(map);
			}
			
			
			retMap.put("total", page.getTotal());
			retMap.put("rows", newRet);
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return retMap;
	}
	
	
	
	/**
	 * 新增保存
	 * @param request
	 * @return
	 */
	@RequestMapping("doSaveCfgCustInfoManage")
	@ResponseBody
	public AjaxJson  doSaveCntRecomManage(HttpServletRequest request ){
		AjaxJson json=new AjaxJson();
		String  cust_id=request.getParameter("cust_id");
		String  cust_name=request.getParameter("cust_name");
		String  id_type=request.getParameter("id_type");
		String  id_number=request.getParameter("id_number");
		String  mobile_phone=request.getParameter("mobile_phone");
		String  land_phone=request.getParameter("land_phone");
		String  occup_type=request.getParameter("occup_type");
		String  income_source=request.getParameter("income_source");
		String  amount_value=request.getParameter("amount_value");
		String  co_type=request.getParameter("co_type");
		String  co_name=request.getParameter("co_name");
		String  co_phone=request.getParameter("co_phone");
		String  co_address=request.getParameter("co_address");
		String  account_name=request.getParameter("account_name");
		String  khh_name=request.getParameter("khh_name");
		String  account_id=request.getParameter("account_id");
		String stream_value=request.getParameter("stream_value");
		
		Map<String, Object> args=new HashMap<String, Object>();
		args.put("cust_id", cust_id);
		args.put("cust_name", cust_name);
		args.put("id_type", id_type);
		args.put("id_number", id_number);
		args.put("mobile_phone", mobile_phone);
		args.put("land_phone", land_phone);
		args.put("occup_type", occup_type);
		args.put("income_source", income_source);
		args.put("amount_value", amount_value);
		args.put("land_phone", land_phone);
		args.put("occup_type", occup_type);
		args.put("income_source", income_source);
		args.put("mobile_phone", mobile_phone);
		args.put("co_type", co_type);
		args.put("co_name", co_name);
		args.put("co_phone", co_phone);
		args.put("co_address", co_address);
		args.put("account_name", account_name);
		args.put("khh_name", khh_name);
		args.put("account_id", account_id);
		args.put("stream_value", stream_value);
		
		try {
			cfgCustInfoService.doSaveCfgCustInfoManage(args);
			json.setSuccess(true);
			json.setMsg("保存成功！");
		} catch (Exception e) {
			json.setSuccess(false);
			json.setMsg("保存失败！");
		}
		return json;
	}
	
	
	
}
