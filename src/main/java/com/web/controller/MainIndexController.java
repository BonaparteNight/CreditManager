package com.web.controller;

import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.core.controller.BaseController;
import com.core.entity.AjaxJson;
import com.web.service.intf.MainIndexService;

@Controller
@RequestMapping("MainIndex")
public class MainIndexController extends BaseController {
	
	private static Logger logger = Logger.getLogger(MainIndexController.class);

	@Resource
	private MainIndexService mainIndexService;
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("mainIndex")
	public ModelAndView mainIndex(HttpServletRequest request,ModelMap model,HttpServletResponse response) throws Exception{
		
		List<Map<String, Object>> menuList=null;
		try {
			menuList=(List<Map<String, Object>>) mainIndexService.getMenuList(this.getUserId());
			JSONArray array = JSONArray.fromObject(menuList);
			model.put("menuList", array);
			model.put("userId", this.getUserId());
			model.put("userName", this.getUserName());
			
		} catch (Exception e) {
			logger.info("跳转主页面异常::"+e.getMessage());
			e.printStackTrace();
		}
		
		return new ModelAndView("main/mainIndex");
	}
	
	
	
	
}
