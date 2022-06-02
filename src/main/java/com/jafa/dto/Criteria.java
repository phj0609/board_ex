package com.jafa.dto;

public class Criteria {
	
	private int page;
	private int perPageNum;
	
	public Criteria() {
		this.page=1;
		this.perPageNum = 20;
	}

	public int getPage() {
		System.out.println("페이지 번호 가져옴");
		return page;
	}

	public void setPage(int page) {
		System.out.println("페이지 번호 설정");
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}
	
	public int getpageStart() {
		return (this.page-1)*perPageNum;
	}
}