package com.core.utils;

import java.util.Map;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class RoutingDataSource extends AbstractRoutingDataSource{

	@Override    
	protected Object determineCurrentLookupKey() {        
		String dataSourceType= DataSourceContextHolder.getDataSourceType();                 
		return dataSourceType;    
	} 
	@Override    
	public void setDefaultTargetDataSource(Object defaultTargetDataSource) {        
		super.setDefaultTargetDataSource(defaultTargetDataSource);    
	}
	
	@Override    
	public void setTargetDataSources(Map targetDataSources) {        
		super.setTargetDataSources(targetDataSources);    
	}
}
