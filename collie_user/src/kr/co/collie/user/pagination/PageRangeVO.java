package kr.co.collie.user.pagination;

public class PageRangeVO {
	private int currentPage = 1;
	
	private int totalCnt; //총 게시물 수
	private int pageScale = 5; //한 페이지에 5개 목록을 조회
	
	private int totalPage; // 총 페이지 수
	
	private int startNum; //현 페이지 게시물 시작 번호
	private int endNum; //현 페이지 게시물 끝 번호
	private int pageRange = 3; //조회할 페이지 갯수 단위
	
	private int startPage; //시작 페이지 번호
	private int endPage; //끝 페이지 번호
	private int prePage; //"이전"을 눌렀을 때 나올 페이지
	private int nextPage; //"다음"을 눌렀을 때 나올 페이지
	
	/**
	 * 페이지 생성시 총 게시물 수를 입력값으로 받아와 설정한다.
	 * @param totalCnt
	 */
	public PageRangeVO(int totalCnt) {
		this.totalCnt = totalCnt;
		calcPaging();
	}
	
	private void calcPaging() {
		totalPage = (int)Math.ceil((double)totalCnt/pageScale);
		startNum = (currentPage-1)*pageScale+1;
		endNum=startNum+pageScale-1;
		
		if(endNum > totalCnt){
			endNum = totalCnt;
		}
		
		startPage=((currentPage-1)/pageRange)*pageRange+1;
		endPage=startPage+pageRange-1;
		if(totalPage < endPage) {
			endPage = totalPage;
		}
		
		if( currentPage > pageRange ) {
			prePage=((currentPage-1)/pageRange)*pageRange;
		} else {
			prePage = currentPage - 1;
		}
		if( totalPage>endPage ){ //"다음" 버튼 활성화하는 조건
			nextPage=prePage+pageRange+1;
		} else {
			nextPage = currentPage + 1;
		}
		
		startNum=(currentPage-1)*pageScale+1; //현 페이지 게시물 시작번호
		endNum=startNum+pageScale-1; //현 페이지 게시물 끝번호
		if(endNum>totalCnt){
			endNum=totalCnt;
		}
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		calcPaging();
		
	}
	/**
	 * 
	 * 한 페이지에 보여질 게시물의 갯수를 설정한다.
	 * @param pageScale 보여질 게시물의 갯수
	 */
	public void setPageScale(int pageScale) {
		this.pageScale = pageScale;
		calcPaging();
	}
	
	/**
	 * 끝 페이지 번호를 설정한다.
	 * 전체 페이지 수보다 끝 페이지 수가 더 큰 경우 젠체 페이지 수로 설정한다.
	 * 
	 * @param endPage
	 */
	public void setEndPage(int endPage) {
		this.endPage = totalPage;
		calcPaging();
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public int getPageScale() {
		return pageScale;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getStartNum() {
		return startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public int getPageRange() {
		return pageRange;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getPrePage() {
		return prePage;
	}

	public int getNextPage() {
		return nextPage;
	}
}
