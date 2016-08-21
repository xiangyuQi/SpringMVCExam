package com.hand.util;

public class PageRequest {
	
	private int pageNo = 1;
	private int pageSize = 10;
	
	public int getPageNo() {
		return pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
