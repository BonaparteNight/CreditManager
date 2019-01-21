package com.web.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.core.controller.BaseController;

@Controller
@RequestMapping("myProgress")
public class MainShowIndexController extends BaseController {
	

	@RequestMapping("progressShowIndex")
	public ModelAndView mainIndex(HttpServletRequest request,ModelMap model,HttpServletResponse response) throws Exception{
		return new ModelAndView("checkIndex/progressShowIndex");
	}
	
	
	
	
}
