package com.core.entity;

import java.util.HashMap;
import java.util.Map;

public class SessionBean {
	//用户编码     
	private String userId="";
	//用户编码     
	private String userName="";
	//用户状态：有效,失效
	private String userStatus="";
	//组织机构编码
	private String orgId=""; 
	//组织机构名称
	private String orgName=""; 
	//地区编码
	private String regionId="";
	
	private String ip_address = "";//ip
	
	private String browser_id = "";
	
	private String mac_info = "";
	
	private String session_id = "";
	
	
	public String getSession_id() {
		return session_id;
	}
	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}
	public String getIp_address() {
		return ip_address;
	}
	public void setIp_address(String ip_address) {
		this.ip_address = ip_address;
	}
	public String getBrowser_id() {
		return browser_id;
	}
	public void setBrowser_id(String browser_id) {
		this.browser_id = browser_id;
	}
	public String getMac_info() {
		return mac_info;
	}
	public void setMac_info(String mac_info) {
		this.mac_info = mac_info;
	}
	//密码
	private String PASSWORD="";
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getRegionId() {
		return regionId;
	}
	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}
	
	//登录方式
	private String login = "login" ; 
	
	//权限MAP
	private Map<String,String> roleMap = new HashMap<String, String>();
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	
	
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	
	public Map<String, String> getRoleMap() {
		return roleMap;
	}
	public void setRoleMap(Map<String, String> roleMap) {
		this.roleMap = roleMap;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	
}
