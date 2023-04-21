package example1230.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class PageMaker {

	
	private int displayPageNum = 10;  
	private int startPage;   
	private int endPage;    
	private int totalCount;  
	
	private boolean prev;   
	private boolean next;  
	
	private SearchCriteria scri;

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
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

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();     //   페이징 계산식 
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}	
	public SearchCriteria getScri() {
		return scri;
	}
	public void setScri(SearchCriteria scri) {
		this.scri = scri;
	}

	public void calcData() {
		//시작페이지 번호
		//끝페이지 번호
		//이전 다음 버튼 보여주기 
		
		endPage  =    (int)(Math.ceil(scri.getPage()/(double)displayPageNum) * displayPageNum);
		
		startPage = (endPage -displayPageNum)+1;
		
		//실제페이지
		int tempEndPage  = (int)(Math.ceil(totalCount/(double)scri.getPerPageNum()));
		
		if (endPage > tempEndPage) {
			endPage  = tempEndPage;
		}
		
		prev  = (startPage ==1 ? false : true);   //false면 안나타내기
		next  = (endPage*scri.getPerPageNum() >= totalCount ? false : true); 
		
	}
	
	public String encoding(String keyword) {
		String str = "";		
		try {
			str  = URLEncoder.encode(keyword,"UTF-8");
		} catch (UnsupportedEncodingException e) {		
			e.printStackTrace();
		}		
		return str;
	}
	
	
	
	
	
	
}
