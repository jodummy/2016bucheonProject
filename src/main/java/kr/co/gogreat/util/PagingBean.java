package kr.co.gogreat.util;

public class PagingBean {

	// total data of number
	private int totalDBInfo;
	
	// current page
	private int currentPage;
	
	// data can be displayed on one page
	public static final int dbInfoPerPage = 10;
	
	// page group number of pages
	public static final int pagePerPagegroup = 5;
	
	public PagingBean(int totalDBInfo, int nowPage){
		this.totalDBInfo = totalDBInfo;
		this.currentPage = nowPage;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setCurrentPage(int nowPage){
		this.currentPage = nowPage;
	}
	
	private int getTotalPage() {
		int totalPage = 0;
		if(totalDBInfo % dbInfoPerPage != 0){
			totalPage = totalDBInfo / dbInfoPerPage +1;
		}else {
			totalPage = totalDBInfo / dbInfoPerPage;
		}
		return totalPage;
	}
	
	private int getTotalPageGroup() {
		int totalPageGroup = 0;
		int totalPage = getTotalPage();
		if(totalPage % pagePerPagegroup != 0) {
			totalPageGroup = totalPage / pagePerPagegroup +1;
		}else {
			totalPageGroup = totalPage / pagePerPagegroup;
		}
		return totalPageGroup;
	}
	
	private int getCurrentPageGroup() {
		int currentPageGroup = 0;
		if(currentPage % pagePerPagegroup != 0) {
			currentPageGroup = currentPage / pagePerPagegroup +1;
		}else {
			currentPageGroup = currentPage / pagePerPagegroup;
		}
		return currentPageGroup;
	}
	
	public int getStartPageOfPageGroup() {
		int startPageNo = (getCurrentPageGroup()-1) * pagePerPagegroup+1;
		return startPageNo;
	}
	
	public int getEndPageOfPageGroup() {
		int endPageNo = getCurrentPageGroup() * pagePerPagegroup;
		if(endPageNo>getTotalPage()) {
			endPageNo = getTotalPage();
		}
		return endPageNo;
	}
	
	public boolean isPreviousPageGroup() {
		boolean flag = false;
		if(getCurrentPageGroup() != 1) {
			flag = true;
		}
		return flag;
	}
	
	public boolean isNextPageGroup() {
		boolean flag = false;
		if(getCurrentPage() < getTotalPageGroup()) {
			flag = true;
		}
		return flag;
	}
	
	
}














