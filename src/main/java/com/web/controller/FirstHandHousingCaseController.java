package com.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.core.controller.BaseController;
import com.core.entity.AjaxJson;
import com.core.entity.SplitPage;
import com.web.service.intf.FirstHandHousingService;
import com.web.service.intf.MainIndexService;

@Controller
@RequestMapping("FirstHandHousing")
public class FirstHandHousingCaseController extends BaseController {
	
	private static Logger logger = Logger.getLogger(FirstHandHousingCaseController.class);

	@Resource
	private FirstHandHousingService firstHandHousingService;
	
	/**
	 * 跳转一手房新增界面
	 * @param request
	 * @param model
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("firstHandHousingAddIndex")
	public String firstHandHousingAddIndex(HttpServletRequest request,ModelMap model,HttpServletResponse response) throws Exception{
		model.put("type", "add");
		
		return "firstHandingHouse/firstHandHousingAddIndex";
	}
	
	/**
	 * 跳转二手房新增界面
	 * @param request
	 * @param model
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("secondHandHousingAddIndex")
	public String secondHandHousingAddIndex(HttpServletRequest request,ModelMap model,HttpServletResponse response) throws Exception{
		model.put("type", "add");
		
		return "secondHandingHouse/secondHandHousingAddIndex";
	}
	/**
	 * 提交审核人员选择界面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("stepSelectAuser")
	public String stepSelectAuser(HttpServletRequest request,ModelMap model) throws Exception {
		return "checkIndex/stepSelectAUserIndex";
	}

	/**
	 * 获取下拉框信息
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value="getDictByType", method = RequestMethod.GET)
	@ResponseBody
	public Object getLoanYears(HttpServletRequest request,
			HttpServletResponse response, 
			ModelMap model) throws Exception {
		String  type=request.getParameter("type");
		
		List<Map<String,Object>> resultList= new ArrayList<Map<String,Object>>();
		List<Map<String, Object>>  list=(List<Map<String, Object>>) firstHandHousingService.getdicTypeList(type);
		
		Map<String, Object> resMap = null;
		for(Map<String, Object> map:list){
			resMap=new HashMap<String, Object>();
			resMap.put("name", map.get("dict_name"));
			resMap.put("value", map.get("dict_id"));
			resultList.add(resMap);
		}
		return resultList;
	}
	
	
	/**
	 * 查出下一步审核人的信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getChannelInfoList",method = RequestMethod.GET)
	@ResponseBody
	public Object getChannelInfoList(HttpServletRequest request) throws Exception {
		SplitPage page = this.getSplitPage();
		Map<String,Object> args = new HashMap<String, Object>();
		List lresult = new ArrayList();
		List<?> list =new ArrayList<Map>(); /*commService.getActiveChannelStatusList(args,page)*/;
		//根据活动id查询plan_id
		String channel_type = "";
		String step_status = "";
		String step_id = "";
		int cnt = 0;
		for (int i = 0; i < list.size(); i++) {
			Map m = (HashMap)list.get(i);
			step_status = String.valueOf(m.get("step_status"));
			channel_type = String.valueOf(m.get("channel_type"));
			step_id = String.valueOf(m.get("step_id"));
			if("1".equals(step_status)||"13".equals(step_status)){
				cnt++;
				m.put("caozuo", "<input type=\"button\" onclick=\"selectUserFunc('"+channel_type+"','"+step_id+"')\" value=\"选择审核人员\"/>");
			}else
				m.put("caozuo", "");
			lresult.add(m);
		}
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		retMap.put("total", page.getTotal());
		retMap.put("rows", lresult);
		retMap.put("cnt", cnt);
		return retMap;
	}
	
	/**
	 * 获取银行信息
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings( "unchecked" )
	@RequestMapping(value="getLoanBank", method = RequestMethod.GET)
	@ResponseBody
	public Object getloanMethod(HttpServletRequest request,
			HttpServletResponse response, 
			ModelMap model) throws Exception {
		List<Map<String,Object>> resultList= new ArrayList<Map<String,Object>>();
		Map<String, Object> resMap = null;
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("type", request.getParameter("type"));
		params.put("bank_id", request.getParameter("bank_id")==null?"":request.getParameter("bank_id"));
		List<Map<String,Object>>   list=(List<Map<String, Object>>) firstHandHousingService.getdictBank(params);
		
		for(Map<String, Object> map:list){
			resMap=new HashMap<String, Object>();
			resMap.put("name", map.get("dict_name"));
			resMap.put("value", map.get("dict_id"));
			resultList.add(resMap);
		}
		
		return resultList;
	}
	
	
	/**
	 * 获取银行信息
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings( "unchecked" )
	@RequestMapping(value="getPretradeHouse", method = RequestMethod.GET)
	@ResponseBody
	public Object getPretradeHouse(HttpServletRequest request,
			HttpServletResponse response, 
			ModelMap model) throws Exception {
		List<Map<String,Object>> resultList= new ArrayList<Map<String,Object>>();
		Map<String, Object> resMap = null;
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("type", request.getParameter("type"));
		params.put("pretrade_house", request.getParameter("pretrade_house")==null?"":request.getParameter("pretrade_house"));
		List<Map<String,Object>>   list=(List<Map<String, Object>>) firstHandHousingService.getPretradeHouse(params);
		
		for(Map<String, Object> map:list){
			resMap=new HashMap<String, Object>();
			resMap.put("name", map.get("dict_name"));
			resMap.put("value", map.get("dict_id"));
			resultList.add(resMap);
		}
		
		return resultList;
	}
	
	
	
	/**
	 * 新增保存
	 * @param request
	 * @return
	 */
	@RequestMapping("doSaveFirstHandHousing")
	@ResponseBody
	public AjaxJson  doSaveFirstHandHousing(HttpServletRequest request ){
		AjaxJson json=new AjaxJson();
		String  case_id=request.getParameter("case_id");                         //案子编码
		String  case_name=request.getParameter("case_name");                     //案子名称
		String  case_type=request.getParameter("case_type");                     //案子类型
		String  create_user=request.getParameter("create_user");                 //创建人
		String  create_time=request.getParameter("create_time");                 //创建时间
		String  loan_fee=request.getParameter("loan_fee");                       //贷款金额
		String  loan_year=request.getParameter("loan_year");                     //贷款年限
		String  repay_type=request.getParameter("repay_type");                   //还款方式
		String  loan_type=request.getParameter("loan_type");                     //贷款类型
		String  loan_branch=request.getParameter("loan_branch");                 //贷款银行
		String  loan_subbranch=request.getParameter("loan_subbranch");           //审批支行
		String  contract_price=request.getParameter("contract_price");           //网签价格
		String  exam_unit_price=request.getParameter("exam_unit_price");         //审批单价
		String  loan_scale=request.getParameter("loan_scale");                   //贷款比例
		String  repay_account=request.getParameter("repay_account");             //还款账号
		String  customer_manager=request.getParameter("customer_manager");       //客户经理
		String  high_scale=request.getParameter("high_scale");                   //虚高比例
		String  pretrade_bus_type=request.getParameter("pretrade_bus_type");     //交易前房产-交易方式
		
		String  pretrade_cqz=request.getParameter("pretrade_cqz");               //交易前房产-产权证号
		String  pretrade_tdz=request.getParameter("pretrade_tdz");               //交易前房产-土地证号
		String  pretrade_area=request.getParameter("pretrade_area");             //交易前房产-房产面积
		String  pretrade_floor=request.getParameter("pretrade_floor");           //交易前房产-建筑楼层
		String  pretrade_age=request.getParameter("pretrade_age");               //交易前房产-建筑年代
		String  pretrade_price=request.getParameter("pretrade_price");           //交易前房产-成交价格
		String  pretrade_unit_price=request.getParameter("pretrade_unit_price"); //交易前房产-成交单价
		String  pretrade_peak_price=request.getParameter("pretrade_peak_price"); //交易前房产-历史最高
		String  seller_account=request.getParameter("seller_account");           //卖房收款账号
		String  afttrade_bdc_id=request.getParameter("afttrade_bdc_id");         //交易后房产-不动产号
		String  afttrade_bdc_addrest=request.getParameter("afttrade_bdc_addrest");//交易后房产-不动产地址
		String  afttrade_qyh=request.getParameter("afttrade_qyh");               //交易后房产-丘权号
		String  afttrade_sjd=request.getParameter("afttrade_sjd");               //交易后房产-收件单编号
		String  afttrade_qsd=request.getParameter("afttrade_qsd");               //交易后房产-契税单号
		String  afttrade_zzsd=request.getParameter("afttrade_zzsd");             //交易后房产-增值税单号
		String  agency_id=request.getParameter("agency_id");                     //中介编码
		String  newhouse_qyz=request.getParameter("newhouse_qyz");               //一手房契约证号
		String  newhouse_tdnx=request.getParameter("newhouse_tdnx");             //一手房土地年限
		String  newhouse_lpmc=request.getParameter("newhouse_lpmc");             //一手房楼盘名称
		String  newhouse_addrest=request.getParameter("newhouse_addrest");       //一手房楼盘地址
		String  newhouse_phone=request.getParameter("newhouse_phone");           //一手房楼盘电话
		String  newhouse_dever=request.getParameter("newhouse_dever");           //一手房楼盘开发商
		String  newhouse_dever_ads=request.getParameter("newhouse_dever_ads");   //一手房楼盘开发商地址
		String  newhouse_dever_ph=request.getParameter("newhouse_dever_ph");     //一手房楼盘开发商电话
		String  newhouse_dever_act=request.getParameter("newhouse_dever_act");   //一手房楼盘下款账户
		String  newhouse_dever_khg=request.getParameter("newhouse_dever_khg");   //一手房楼盘开户行
		String  newhouse_man=request.getParameter("newhouse_man");               //一手房楼盘负责人
		String  newhouse_man_ph=request.getParameter("newhouse_man_ph");         //一手房楼盘负责人电话
		String  newhouse_fin=request.getParameter("newhouse_fin");               //一手房楼盘财务负责人
		String  newhouse_fin_ph=request.getParameter("newhouse_fin_ph");         //一手房楼盘财务负责人电话
		String  newhouse_seller=request.getParameter("newhouse_seller");         //一手房楼盘销售员
		String  newhouse_sel_ph=request.getParameter("newhouse_sel_ph");         //一手房楼盘销售员手机
		String  newhouse_sel_ph2=request.getParameter("newhouse_sel_ph2");       //一手房楼盘销售员办公电话
		String  newhouse_sel_actn=request.getParameter("newhouse_sel_actn");     //一手房楼盘销售员账户名
		String  newhouse_sel_khh=request.getParameter("newhouse_sel_khh");       //一手房楼盘销售员开户行
		String  newhouse_sel_act=request.getParameter("newhouse_sel_act");       //一手房楼盘销售员账号

		Map<String, Object> args=new HashMap<String, Object>();
		//1.贷款信息
		args.put("case_id", case_id);                   //案子编码
		args.put("case_name", case_name);               //案子名称
		args.put("case_type", case_type);               //案子类型
		args.put("create_user", create_user);           //创建人
		args.put("create_time", create_time);           //创建时间
		args.put("loan_fee", loan_fee);                 //贷款金额
		args.put("loan_year", loan_year);               //贷款年限
		args.put("repay_type", repay_type);             //还款方式
		args.put("loan_type", loan_type);               //贷款类型
		args.put("loan_branch", loan_branch);           //贷款银行
		args.put("loan_subbranch", loan_subbranch);     //审批支行
		args.put("contract_price", contract_price);     //网签价格
		args.put("exam_unit_price", exam_unit_price);   //审批单价
		args.put("loan_scale", loan_scale);             //贷款比例
		args.put("repay_account", repay_account);       //还款账号
		args.put("customer_manager", customer_manager); //客户经理
		args.put("high_scale", high_scale);             //虚高比例
		args.put("case_type", "1");//案子类型
		
		//2.房屋信息
		String  pretrade_house="";
		String  pretrade_house1=request.getParameter("pretrade_house1");//省份
		String  pretrade_house2=request.getParameter("pretrade_house2");//地市
		String  pretrade_house3=request.getParameter("pretrade_house3");//区县
		String  pretrade_house4=request.getParameter("pretrade_house4");//街道
		String  pretrade_house_detail=request.getParameter("pretrade_house_detail");//详细地址
		pretrade_house=pretrade_house1+","+pretrade_house2+","+pretrade_house3+","+pretrade_house4+","+pretrade_house_detail;
		args.put("pretrade_bus_type", pretrade_bus_type);//交易前房产-交易方式
		args.put("pretrade_house", pretrade_house);//交易前房产-交易房产 对应一手房“房屋地址”
		args.put("newhouse_qyz", newhouse_qyz);//契约证号
		args.put("afttrade_bdc_id", afttrade_bdc_id);//不动产号
		args.put("pretrade_area", pretrade_area);//房产面积
		args.put("pretrade_floor", pretrade_floor);//建筑楼层
		args.put("pretrade_age", pretrade_age);//建筑年代
		args.put("newhouse_tdnx", newhouse_tdnx);//土地年限
		args.put("pretrade_price", pretrade_price);//成交价格
		args.put("pretrade_unit_price", pretrade_unit_price);//成交单价
		//3.楼盘及开发商信息
		args.put("newhouse_lpmc", newhouse_lpmc);//楼盘名称
		args.put("newhouse_addrest", newhouse_addrest);//楼盘地址
		args.put("newhouse_phone", newhouse_phone);//楼盘电话
		args.put("newhouse_man", newhouse_man);//楼盘负责人
		args.put("newhouse_man_ph", newhouse_man_ph);//楼盘负责人电话
		args.put("newhouse_dever", newhouse_dever);//楼盘开发商
		args.put("newhouse_dever_ads", newhouse_dever_ads);//楼盘开发商地址
		args.put("newhouse_dever_ph", newhouse_dever_ph);//楼盘开发商电话
		args.put("newhouse_fin", newhouse_fin);//财务负责人
		args.put("newhouse_fin_ph",newhouse_fin_ph );//财务负责人电话
		args.put("newhouse_dever_act", newhouse_dever_act);//下款账户
		args.put("newhouse_dever_khg", newhouse_dever_khg);//开户行
		//4.楼盘销售人员
		args.put("newhouse_seller", newhouse_seller);//销售员
		args.put("newhouse_sel_ph", newhouse_sel_ph);//销售员手机
		args.put("newhouse_sel_ph2", newhouse_sel_ph2);//销售员办公电话
		args.put("newhouse_sel_actn", newhouse_sel_actn);//销售员账户名
		args.put("newhouse_sel_khh", newhouse_sel_khh);//销售员开户行
		//5.主贷人信息
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
		String  is_true=request.getParameter("is_true");
		String  is_stream=request.getParameter("is_stream");
		String  is_true_stream=request.getParameter("is_true_stream");
		
		args.put("cust_id", cust_id);//主贷人id
		args.put("cust_name", cust_name);//主贷人姓名
		args.put("id_type", id_type);//证件类型
		args.put("id_number", id_number);//证件号
		args.put("mobile_phone", mobile_phone);//移动电话
		args.put("land_phone", land_phone);//家庭电话
		args.put("occup_type", occup_type);//职业性质
		args.put("amount_value", amount_value);//收入金额
		args.put("income_source", income_source);//收入来源
		args.put("is_true", is_true);//是否真实单位
		args.put("is_stream", is_stream);//流水有无
		args.put("is_true_stream", is_true_stream);//流水是否真实
		args.put("stream_value", stream_value);//补充流水
		args.put("co_type", co_type);//单位性质
		args.put("co_phone", co_phone);//单位电话
		args.put("co_name", co_name);//工作单位
		args.put("co_address", co_address);//单位地址
		
		
		
		List<Map<String, Object>>  custList=new ArrayList<Map<String,Object>>();
		Map<String, Object>  custMap=null;
		String  cust_id1="";
		String  cust_name1="";
		String  id_type1="";
		String  id_number1="";
		String  mobile_phone1="";
		String  land_phone1="";
		String  occup_type1="";
		String  income_source1="";
		String  amount_value1="";
		String  co_type1="";
		String  co_name1="";
		String  co_phone1="";
		String  co_address1="";
		String  account_name1="";
		String  khh_name1="";
		String  account_id1="";
		String stream_value1="";
		String  is_true1="";
		String  is_stream1="";
		String  is_true_stream1="";
		
		
		
		int cust_i=Integer.parseInt(request.getParameter("cust_i"));
		for(int i=1;i<cust_i;i++){
			 custMap=new HashMap<String, Object>();
			 cust_id1=request.getParameter("cust_id_"+i);
			 cust_name1=request.getParameter("cust_name_"+i);
			 id_type1=request.getParameter("id_type_"+i);
			 id_number1=request.getParameter("id_number_"+i);
			 mobile_phone1=request.getParameter("mobile_phone_"+i);
			 land_phone1=request.getParameter("land_phone_"+i);
			 occup_type1=request.getParameter("occup_type_"+i);
			 income_source1=request.getParameter("income_source_"+i);
			 amount_value1=request.getParameter("amount_value_"+i);
			 co_type1=request.getParameter("co_type_"+i);
			 co_name1=request.getParameter("co_name_"+i);
			 co_phone1=request.getParameter("co_phone_"+i);
			 co_address1=request.getParameter("co_address_"+i);
			 account_name1=request.getParameter("account_name_"+i);
			 khh_name1=request.getParameter("khh_name_"+i);
			 account_id1=request.getParameter("account_id_"+i);
			 stream_value1=request.getParameter("stream_value_"+i);
			 is_true1=request.getParameter("is_true_"+i);
			 is_stream1=request.getParameter("is_stream_"+i);
			 is_true_stream1=request.getParameter("is_true_stream_"+i);
			 custMap.put("cust_id", cust_id1);//共还人id
			 custMap.put("cust_name", cust_name1);//主贷人姓名
			 custMap.put("id_type", id_type1);//证件类型
			 custMap.put("id_number", id_number1);//证件号
			 custMap.put("mobile_phone", mobile_phone1);//移动电话
			 custMap.put("land_phone", land_phone1);//家庭电话
			 custMap.put("occup_type", occup_type1);//职业性质
			 custMap.put("amount_value", amount_value1);//收入金额
			 custMap.put("income_source", income_source1);//收入来源
			 custMap.put("is_true", is_true1);//是否真实单位
			 custMap.put("is_stream", is_stream1);//流水有无
			 custMap.put("is_true_stream", is_true_stream1);//流水是否真实
			 custMap.put("stream_value", stream_value1);//补充流水
			 custMap.put("co_type", co_type1);//单位性质
			 custMap.put("co_phone", co_phone1);//单位电话
			 custMap.put("co_name", co_name1);//工作单位
			 custMap.put("co_address", co_address1);//单位地址
			 custList.add(custMap);
		}
		
		//中介人信息
		args.put("agency_id", agency_id);//中介编码
		
		
		
		
		
		
		
		try {
			/*cfgCustInfoService.doSaveCfgCustInfoManage(args);*/
			json.setSuccess(true);
			json.setMsg("保存成功！");
		} catch (Exception e) {
			json.setSuccess(false);
			json.setMsg("保存失败！");
		}
		return json;
	}
	

	/**
	 * 案子费用信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/crdtModifyFee",method = RequestMethod.POST)
	@ResponseBody
	public Object getCrdtModifyFeeList(HttpServletRequest request) throws Exception {
		SplitPage page = this.getSplitPage();
		Map<String,Object> args = new HashMap<String,Object>();
		String case_id = (String)request.getParameter("case_id");//案子名称
		args.put("case_id", case_id);
		
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		try{
			List<Map<String, Object>> ret = (List<Map<String, Object>>) firstHandHousingService.getCrdtModifyFeeList(args, page);
			retMap.put("total", page.getTotal());
			retMap.put("rows", ret);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return retMap;
	}
	
	
	/**
	 * 案子与材料关系
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getCrdtDataInfoList",method = RequestMethod.POST)
	@ResponseBody
	public Object getCrdtDataInfoList(HttpServletRequest request) throws Exception {
		SplitPage page = this.getSplitPage();
		Map<String,Object> args = new HashMap<String,Object>();
		String case_id = (String)request.getParameter("case_id");//案子名称
		args.put("case_id", case_id);
		
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		try{
			List<Map<String, Object>> ret = (List<Map<String, Object>>) firstHandHousingService.getCrdtDataInfoList(args, page);
			retMap.put("total", page.getTotal());
			retMap.put("rows", ret);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return retMap;
	}
	
	
	/**
	 * 保存新增的案子费用
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/saveCrdtModifyFee",method = RequestMethod.GET)
	@ResponseBody
	public  Object  saveCrdtModifyFee(HttpServletRequest request){
		AjaxJson  json=new AjaxJson();
		String caseId=request.getParameter("case_id");
		String fee_amount=request.getParameter("fee_amount");
		String count_num=request.getParameter("count_num");
		String unit_price=request.getParameter("unit_price");
		String fee_item_name=request.getParameter("fee_item_name");
		String fee_item_id=request.getParameter("fee_item_id");
		
		Map<String, Object> args=new HashMap<String, Object>();
		args.put("caseId", caseId);
		args.put("fee_amount", fee_amount);
		args.put("count_num", count_num);
		args.put("unit_price", unit_price);
		args.put("fee_item_name", fee_item_name);
		args.put("fee_item_id", fee_item_id);
		
		try {
			firstHandHousingService.saveCrdtModifyFee(args);
		} catch (Exception e) {
			json.setSuccess(false);
			json.setMsg("保存案子费用异常！");
		}
		return json;
	}
	
	
	/**
	 * 保存材料
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/saveCrdtDataInfo",method = RequestMethod.GET)
	@ResponseBody
	public  Object  saveCrdtDataInfo(HttpServletRequest request){
		
		AjaxJson  json=new AjaxJson();
		String caseId=request.getParameter("case_id");
		String remark=request.getParameter("remark");
		String org_info=request.getParameter("org_info");
		String data_count=request.getParameter("data_count");
		String data_name=request.getParameter("data_name");
		String data_belong=request.getParameter("data_belong");
		
		Map<String, Object> args=new HashMap<String, Object>();
		args.put("caseId", caseId);
		args.put("remark", remark);
		args.put("org_info", org_info);
		args.put("data_count", data_count);
		args.put("data_name", data_name);
		args.put("data_belong", data_belong);
		
		try {
			firstHandHousingService.saveCrdtDataInfo(args);
		} catch (Exception e) {
			json.setSuccess(false);
			json.setMsg("保存材料异常！");
		}
		return json;
	}
	
	
}
