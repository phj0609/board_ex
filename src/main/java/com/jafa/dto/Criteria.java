package com.jafa.dto;

public class Criteria {
	
	private int page;
	private int perPageNum;
	
	public Criteria() {
		this.page=1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}
	
	public int getpageStart() {
		return (this.page-1)*perPageNum;
	}
}