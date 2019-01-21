package com.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.controller.BaseController;
import com.core.entity.AjaxJson;
import com.web.service.intf.CommService;

/**
 * 公共Controller
 * @author ljw
 *
 */
@Controller
@RequestMapping("common")
public class CommController extends BaseController{
	
	@Resource
	private CommService commService;
	
	@RequestMapping("getSeq")
	@ResponseBody
	public Object getSeq(HttpServletRequest request){
		AjaxJson json=new AjaxJson();
		Map<String, Object> args=new HashMap<String, Object>();
		String seq_name=request.getParameter("seq_name");
		
		if("".equals(seq_name)||null==seq_name){
			json.setSuccess(false);
			json.setMsg("序列名称为空！");
			return json;
		}
		args.put("seq_name", seq_name);
		
		try {
			Map<String, Object> seqMap=commService.getSeq(args);
			/*model.put("seq", seqMap.get("nextvalue"));*/
			json.setAttributes(seqMap);
		} catch (Exception e) {
			json.setSuccess(false);
			json.setMsg(e.getMessage());
		}
		
		
		return json;
	}
	
	
}
