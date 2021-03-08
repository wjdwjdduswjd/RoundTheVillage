package com.kh.RoundTheVillage.manager.model.vo;

import org.springframework.stereotype.Component;

@Component
public class ManagerPageInfo {
	private int currentPage; 	// 현재 페이지 번호를 표시할 변수
	private int listCount; 		// 전체 게시글 수
	private int limit = 10; 			// 한 페이지에 보여질 게시글 수
	private int pageSize = 10; 	// 보여질 페이징바의 페이지 개수
	
	private int maxPage;	 	// 전체 페이지에서 가장 마지막 페이지
	private int startPage;	 	// 페이징바 시작 페이지 번호
	private int endPage; 	 	// 페이징바 끝 페이지 번호
	

	public ManagerPageInfo() {
	}

	
	

	public ManagerPageInfo(int listCount) {
		super();
		this.listCount = listCount;
	}




	public ManagerPageInfo(int currentPage, int listCount, int limit, int pageSize, int maxPage, int startPage,
			int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.pageSize = pageSize;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}


	@Override
	public String toString() {
		return "ManagerPageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit
				+ ", pageSize=" + pageSize + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getListCount() {
		return listCount;
	}


	public void setListCount(int listCount) {
		this.listCount = listCount;
	}


	public int getLimit() {
		return limit;
	}


	public void setLimit(int limit) {
		this.limit = limit;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getMaxPage() {
		return maxPage;
	}


	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
	
	
	
	

	
	
	
	
}
