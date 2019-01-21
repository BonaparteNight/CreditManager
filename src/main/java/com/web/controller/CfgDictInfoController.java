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
import com.web.service.intf.CfgDictInfoService;

/**
 * 字典管理
 * @author ljw
 */
@Controller
@RequestMapping("cfgDictInfo")
public class CfgDictInfoController extends BaseController{

	@Resource
    private CfgDictInfoService cfgDictInfoService;
	
	@RequestMapping("cfgCustInfoIndex")
	public String excuteTotalInedx(ModelMap model) throws Exception {
		
		return "dictManager/cfgDictInfo/cfgDictInfoIndex";
	}
	
	
	
	/**
	 * 字典管理查询
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getcfgDictInfoList",method = RequestMethod.POST)
	@ResponseBody
	public Object getcfgDictInfoList(HttpServletRequest request) throws Exception {
		SplitPage page = this.getSplitPage();
		Map<String,Object> args = new HashMap<String,Object>();
		
		String dict_id = (String)request.getParameter("dict_id");//字典编码
		String dict_name = (String)request.getParameter("dict_name");//字典名称
		String super_dict_id = (String)request.getParameter("super_dict_id");//上级字典编码
		
		args.put("dict_id", dict_id);
		args.put("dict_name", dict_name);
		args.put("super_dict_id", super_dict_id);
		
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		try{
			List<Map<String, Object>> ret = (List<Map<String, Object>>) cfgDictInfoService.getcfgCustInfoList(args, page);
			List<Map<String, Object>> newRet=new ArrayList<Map<String,Object>>();
			for(Map<String, Object> map:ret){
				if(!"".equals(map.get("super_dict_id"))&null!=map.get("super_dict_id")){
					map.put("super_dict_name", ((List<Map<String, Object>>)cfgDictInfoService.getSuperDictId(map)).get(0).get("dict_name"));
					newRet.add(map);
				}else{
					map.put("super_dict_name", "");
					newRet.add(map);
				}
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
		String  dict_id=request.getParameter("dict_id");
		String  dict_name=request.getParameter("dict_name");
		String  super_dict_id=request.getParameter("super_dict_id");
		String  is_valid=request.getParameter("is_valid");
		String  dict_tab_name=request.getParameter("dict_tab_name");
		
		
		Map<String, Object> args=new HashMap<String, Object>();
		args.put("dict_id", dict_id);
		args.put("dict_name", dict_name);
		args.put("super_dict_id", super_dict_id);
		args.put("is_valid", is_valid);
		args.put("dict_tab_name", dict_tab_name);
		
		try {
			cfgDictInfoService.doSavecfgCustInfoManage(args);
			json.setSuccess(true);
			json.setMsg("新增成功！");
		} catch (Exception e) {
			json.setSuccess(false);
			json.setMsg("新增失败："+e.getMessage());
		}
		
		return json;
	}
	
	/**
	 * 获取下拉框信息
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "null", "unchecked" })
	@RequestMapping(value="getSuperDictId", method = RequestMethod.GET)
	@ResponseBody
	public Object getLoanYears(HttpServletRequest request,
			HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		List<Map<String,Object>> resultList= new ArrayList<Map<String,Object>>();
		List<Map<String, Object>>  list=(List<Map<String, Object>>) cfgDictInfoService.getSuperDictId(new HashMap<String, Object>());
		
		Map<String, Object> resMap = null;
		for(Map<String, Object> map:list){
			resMap=new HashMap<String, Object>();
			resMap.put("name", map.get("dict_name"));
			resMap.put("value", map.get("dict_id"));
			resultList.add(resMap);
		}
		return resultList;
	}
	
}
