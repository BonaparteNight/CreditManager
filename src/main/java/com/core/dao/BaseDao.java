package com.core.dao;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.CallableStatementCallback;

import com.core.entity.SplitPage;

public interface BaseDao {

	/**
	 * insert、update、delete 操作
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public int doSaveAsUpdate(String sql) throws Exception;
	
	/**
	 * 带命名参数的insert、update、delete 操作
	 * @param sql
	 * @param args
	 * @return
	 * @throws Exception
	 */
	public int doSaveAsUpdate(String sql,Map<String,?> args) throws Exception;
	
	/**
	 * 获取Bean方法
	 * @param sql
	 * @param entityClass
	 * @return
	 * @throws Exception
	 */
	public <T> T getInfo(String sql,Class<T> entityClass) throws Exception;
    
	/**
	 * 带命名参数的获取Bean方法
	 * @param sql
	 * @param args
	 * @param entityClass
	 * @return
	 * @throws Exception
	 */
    public <T> T getInfo(String sql, Map<String,?> args,Class<T> entityClass) throws Exception;
    
    /**
     * 获取Map信息
     * @param sql
     * @return
     * @throws Exception
     */
    public Map<String, ?> getQueryMap(String sql) throws Exception;
    
    /**
     * 带命名参数的获取Map信息
     * @param sql
     * @param args
     * @return
     * @throws Exception
     */
    public Map<String, ?> getQueryMap(String sql,Map<String,?> args) throws Exception;
    
    /**
     * list获取方法
     * @param sql
     * @return
     * @throws Exception
     */
    public List<?> getQueryList(String sql) throws Exception;
    
    /**
     * 返还list<T>
     * @param sql
     * @param entityClass
     * @return
     * @throws Exception
     */
    public <T> List<T> getQueryList(String sql,Class<T> entityClass) throws Exception;
    
    
    public <T> List<T> getQueryList(String sql,Map<String,?> args,Class<T> entityClass) throws Exception;
    
    /**
     * 带命名参数的list获取方法
     * @param sql
     * @param args
     * @return
     * @throws Exception
     */
    public List<?> getQueryList(String sql,Map<String,?> args) throws Exception;
    
    /**
     * 查询返还int 类型的方法
     * @param sql
     * @return
     * @throws Exception
     */
    public int getQueryForInt(String sql) throws Exception;
    
    /**
     * 分页方法
     * @param sql
     * @param page
     * @return
     * @throws Exception
     */
    public List<?> getQueryPageList(String sql, SplitPage page) throws Exception;
    
    /**
     * 带命名参数的分页方法
     * @param sql
     * @param args
     * @param page
     * @return
     * @throws Exception
     */
    public List<?> getQueryPageList(String sql,Map<String, ?> args, SplitPage page) throws Exception;
    
    /**
     * 批量操作
     * @param sql
     * @param batch
     * @return
     * @throws Exception
     */
    public int[] doSaveAsBatchUpdate(String sql,BatchPreparedStatementSetter batch) throws Exception;

	/**
     * 执行
     * @param sql
     * @param cs
     * @return
     * @throws Exception
     */
    public Object doSaveAsExecute(String sql,CallableStatementCallback<?> cs) throws Exception;
    
    public void doSaveAsExecute(String sql) throws Exception;
    
    /**
     * 更新clob 字段
     * @param sql
     * @param clobStr
     * @return
     * @throws Exception
     */
     public Object doSaveAsExecute(String sql,String clobStr) throws Exception;
    
}
