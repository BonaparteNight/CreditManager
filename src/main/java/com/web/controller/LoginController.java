package com.web.controller;

import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.controller.BaseController;
import com.core.entity.AjaxJson;
import com.core.entity.SessionBean;
import com.core.utils.GlobalConst;
import com.core.utils.Cache;
import com.core.utils.CacheManager;
import com.web.service.intf.LoginService;

@Controller
@RequestMapping("loginController")
public class LoginController extends BaseController {
	
	private static Logger logger = Logger.getLogger(LoginController.class);

	
	
	@Resource
	private LoginService loginService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping("login")
	@ResponseBody
	public AjaxJson login(HttpServletRequest request,ModelMap model,HttpServletResponse response) throws Exception{
		AjaxJson aj = new AjaxJson();
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		Cache cache = CacheManager.getCacheInfo(userId);
		SessionBean session = new SessionBean();
		if(cache==null){
			SessionBean session1 = loginService.getSessionBean(userId);
			if(session1==null){
				aj.setMsg("用户不存在！");
				aj.setSuccess(false);
				return aj;
			}else{
				if(!session1.getPASSWORD().equals(password)){
					aj.setMsg("密码不正确！");
					aj.setSuccess(false);
					return aj;
				}
				cache = new Cache();
				List<?> plist = loginService.getRoleList(userId);
				if(plist.size()!=0){
					Map pmp = new HashMap<String,String>();
					Map info = null;
					for(int i=0;i<plist.size();i++){
						info = (Map)plist.get(i);
						pmp.put(info.get("role_id"), info.get("role_name"));
					}
					session1.setRoleMap(pmp);//权限Map
				}
				session1.setLogin("login");//登录方式
				cache.setSessionBean(session1);
				CacheManager.putCache(userId, cache);  
			}
			session.setRoleMap(session1.getRoleMap());
			session.setUserId(session1.getUserId());
			session.setPASSWORD(session1.getPASSWORD());
			session.setUserName(session1.getUserName());
			session.setRegionId(session1.getRegionId());
			session.setLogin(session1.getLogin());
			session.setOrgId(session1.getOrgId());
			session.setOrgName(session1.getOrgName());
		}else{
			SessionBean session1 = cache.getSessionBean();
			session.setRoleMap(session1.getRoleMap());
			session.setUserId(session1.getUserId());
			session.setPASSWORD(session1.getPASSWORD());
			session.setUserName(session1.getUserName());
			session.setRegionId(session1.getRegionId());
			session.setLogin(session1.getLogin());
			session.setOrgId(session1.getOrgId());
			session.setOrgName(session1.getOrgName());
		}
		
		//设置一个日志session
		String ip = getIpAddr();
		session.setIp_address(ip);
		session.setBrowser_id(request.getHeader("User-Agent"));
		session.setSession_id(request.getSession().getId());
		session.setMac_info(getMac(ip));
		System.out.println(session.getSession_id());
		request.getSession().setAttribute(GlobalConst.SESSION_KEY, session);
		
		return aj;
	}
	/**
	 * 获取访问的ip
	 * @return
	 */
	
	private String getIpAddr() {
		String ipAddress = null;
		ipAddress = this.getRequest().getHeader("x-forwarded-for");
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = this.getRequest().getHeader("Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = this.getRequest().getHeader("WL-Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = this.getRequest().getRemoteAddr();
			if (ipAddress.equals("127.0.0.1")) {
				// 根据网卡取本机配置的IP
				try {
					java.net.InetAddress inet = Inet4Address.getLocalHost();
					ipAddress = inet.getHostAddress();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
			}

		}
		// 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		if (ipAddress != null && ipAddress.length() > 15) { // "***.***.***.***".length()
			if (ipAddress.indexOf(",") > 0) {
				ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
			}
		}
		if("0:0:0:0:0:0:0:1".equals(ipAddress)){
			ipAddress = "127.0.0.1";
		}
		return ipAddress;
	}  
	
	
	  public String getMac(String ip){
	    	String mac = "";
			try {
				Process p = Runtime.getRuntime().exec("arp -n");
				InputStreamReader ir = new InputStreamReader(p.getInputStream());
				LineNumberReader input = new LineNumberReader(ir);
				//p.waitFor();
				boolean flag = true;
				String ipStr = "(" + ip + ")";
				while(flag) {
					String str = input.readLine();
					if (str != null) {
						if (str.indexOf(ipStr) > 1) {
							int temp = str.indexOf("at");
							mac = str.substring(temp + 3, temp + 20);
							break;
						}
					} else
					flag = false;
				}
			} catch (Exception e) {
				System.out.println("获取mac报错！！！");
				return mac;
			}
			return mac;
		}
}
