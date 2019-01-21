package com.core.entity;

import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public class AjaxJson {

	private boolean success = true;// 是否成功
	private String msg = "操作成功!";// 提示信息
	private String status = "0";// 状态
	private Map<String, Object> attributes;//其他信息
	public Map<String, Object> getAttributes() {
		return attributes;
	}

	public void setAttributes(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getJsonStr(){
		JSONObject obj = new JSONObject();
		obj.put("success", this.isSuccess());
		obj.put("msg", this.getMsg());
		obj.put("status", this.getStatus());
		obj.put("attributes", this.attributes);
		return obj.toJSONString();
	}
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
