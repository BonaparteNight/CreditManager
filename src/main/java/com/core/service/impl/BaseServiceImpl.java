package com.core.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.stereotype.Service;

import com.core.dao.BaseDao;
import com.core.entity.SplitPage;
import com.core.service.BaseService;

@Service("baseService")
public class BaseServiceImpl implements BaseService {

	@Resource
    private BaseDao baseDao;

	public Object doSaveAsExecute(String sql,CallableStatementCallback<?> cs) throws Exception{
		return baseDao.doSaveAsExecute(sql, cs);
	}
	
	public void doSaveAsExecute(String sql) throws Exception{
		baseDao.doSaveAsExecute(sql);
	}
	
	public Object doSaveAsExecute(String sql,String clobStr) throws Exception{
		return baseDao.doSaveAsExecute(sql, clobStr);
	}
	
	public int doSaveAsUpdate(String sql) throws Exception {
		return baseDao.doSaveAsUpdate(sql);
	}

	public int doSaveAsUpdate(String sql, Map<String, ?> args) throws Exception {
		return baseDao.doSaveAsUpdate(sql, args);
	}

	public List<?> getQueryList(String sql) throws Exception {
		return baseDao.getQueryList(sql);
	}
	
	public int getQueryForInt(String sql) throws Exception {
		return baseDao.getQueryForInt(sql);
	}

	public List<?> getQueryList(String sql, Map<String, ?> args) throws Exception {
		return baseDao.getQueryList(sql, args);
	}

	public List<?> getQueryPageList(String sql, SplitPage page) throws Exception {
		return baseDao.getQueryPageList(sql, page);
	}

	public List<?> getQueryPageList(String sql, Map<String, ?> args, SplitPage page) throws Exception {
		return baseDao.getQueryPageList(sql, args, page);
	}

	public  <T> T getInfo(String sql,Class<T> entityClass) throws Exception {
		return baseDao.getInfo(sql,entityClass);
	}

	public <T> T getInfo(String sql, Map<String, ?> args,Class<T> entityClass) throws Exception {
		return baseDao.getInfo(sql, args,entityClass);
	}

	public Map<String, ?> getQueryMap(String sql) throws Exception {
		return baseDao.getQueryMap(sql);
	}

	public Map<String, ?> getQueryMap(String sql, Map<String, ?> args) throws Exception {
		try {
			return baseDao.getQueryMap(sql, args);
		} catch (EmptyResultDataAccessException e) {
		}
		return new HashMap<String, Object>();
	}

	public String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-","");
	}

	public int[] doSaveAsBatchUpdate(String sql,BatchPreparedStatementSetter batch) throws Exception{
		return baseDao.doSaveAsBatchUpdate(sql, batch);
	}
	

	public <T> List<T> getQueryList(String sql,Class<T> entityClass) throws Exception{
		return baseDao.getQueryList(sql, entityClass);
	}
	
	public <T> List<T> getQueryList(String sql,Map<String, ?> args,Class<T> entityClass) throws Exception{
		return baseDao.getQueryList(sql, args,entityClass);
	}

}
