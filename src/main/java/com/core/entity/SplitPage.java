package com.core.entity;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import com.core.utils.GlobalConst;

/**
 * 分页
 * @author fandc
 *
 */
public class SplitPage {

	//private static Logger log = Logger.getLogger(SplitPage.class);
	
	private int total;
	private int start;
	private int end;
	private int pageSize;
	private int currentPage;
	private int totalPages;
	
	private LinkedHashMap<Object, Object> orderBy;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public SplitPage(){
	    this.pageSize = GlobalConst.NUMBERS_PER_PAGE;
	    this.orderBy = new LinkedHashMap();
	}
	
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	    this.totalPages = ((this.total % this.pageSize == 0) ? this.total / this.pageSize : this.total / this.pageSize + 1);
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	    this.currentPage = (this.start / this.pageSize + 1);
	    this.end = (this.currentPage * this.pageSize);
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if (pageSize != 0)
		      this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public LinkedHashMap<Object, Object> getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String sort, String order) {
		if(sort!=null&&!"".equals(sort)){
			if(order == null||"".equals(order))
				this.orderBy.put(sort, "ASC");
			else
				this.orderBy.put(sort, order);
		}
	}
	
	@SuppressWarnings("rawtypes")
	public String toSplitPageSQL(String sql) {
		StringBuffer buf = new StringBuffer();
		if("MYSQL".equals(GlobalConst.DIALECT)){
			buf.append("SELECT * FROM (");
			if (!(this.orderBy.isEmpty())) {
				buf.append("select * from ("+sql+") T ");
				buf.append(" ORDER BY ");
				Iterator iter = this.orderBy.keySet().iterator();
				Object key = null;
				while (iter.hasNext()) {
					key = iter.next(); 
					buf.append(key);
					buf.append(" " + orderBy.get(key));
					if (iter.hasNext())
						buf.append(",");
				}
			}else{
				buf.append(sql);
			}
			buf.append(") T limit  ");
			buf.append(this.start);
			buf.append(",");
			buf.append(this.pageSize);
		}
		return buf.toString();
	}

	public String toTotalSQL(String sql) {
		StringBuffer buf = new StringBuffer();
		buf.append("SELECT COUNT(*) AS TOTAL FROM (");
		buf.append(sql);
		buf.append(") my_tab ");
		return buf.toString();
	}

}
