package com.core.entity;

import java.io.Serializable;

@SuppressWarnings("serial")
public class LogInfo implements Serializable{
	
	private String operId = "";//操作员
	private String logRemark = "";//备注
	private String contentId = "";//功能编码
	private String remoteAddr = "";//远程访问地址
	private String remoteHost = "";//远程访问端口
	private String serviceAddr = "";//主机地址
	private int serviceHost = 0;//主机端口
	private String browser = "";//浏览器信息
	private String logType = "";//访问类型 //0:登入1：查询 2：下载 3：导入 4:删除 5：添加6：修改9：登出 
	
	
	public String getServiceAddr() {
		return serviceAddr;
	}
	public void setServiceAddr(String serviceAddr) {
		this.serviceAddr = serviceAddr;
	}
	public int getServiceHost() {
		return serviceHost;
	}
	public void setServiceHost(int serviceHost) {
		this.serviceHost = serviceHost;
	}
	public String getOperId() {
		return operId;
	}
	public void setOperId(String operId) {
		this.operId = operId;
	}
	public String getLogRemark() {
		return logRemark;
	}
	public void setLogRemark(String logRemark) {
		this.logRemark = logRemark;
	}
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getRemoteAddr() {
		return remoteAddr;
	}
	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}
	public String getRemoteHost() {
		return remoteHost;
	}
	public void setRemoteHost(String remoteHost) {
		this.remoteHost = remoteHost;
	}
	public String getBrowser() {
		return browser;
	}
	public void setBrowser(String browser) {
		this.browser = browser;
	}
	public String getLogType() {
		return logType;
	}
	public void setLogType(String logType) {
		this.logType = logType;
	}
	
	  
	
}
