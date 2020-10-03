package kr.co.collie.user.item.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.collie.user.dao.GetCollieHandler;
import kr.co.collie.user.item.domain.ItemDetailDomain;
import kr.co.collie.user.item.domain.ItemListDomain;
import kr.co.collie.user.item.domain.ItemQnaDomain;
import kr.co.collie.user.item.domain.ReviewDomain;
import kr.co.collie.user.item.vo.ReviewDetailVO;
import kr.co.collie.user.item.vo.ReviewFlagVO;
import kr.co.collie.user.item.vo.ReviewVO;
import kr.co.collie.user.pagination.RangeVO;

public class ItemDAO {
	
	private static ItemDAO iDAO;
	
	private ItemDAO() {
	}
	
	public static ItemDAO getInstance() {
		if(iDAO == null) {
			iDAO = new ItemDAO();
		}
		return iDAO;
	}

	/**
	 * 
	 * 카테고리 값을 이용해서 아이템 목록을 가져온다.
	 * @param rVO
	 * @return
	 */
	public List<ItemListDomain> selectItemList(RangeVO rVO) {
		List<ItemListDomain> list = null;
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		list = ss.selectList("kr.co.collie.user.item.selectItemList",rVO);
		ss.close();
		return list;
	}
	


	public int selectItemListCnt(RangeVO rVO) {
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		int cnt = ss.selectOne("kr.co.collie.user.item.selectItemListCnt", rVO);
		ss.close();
		return cnt;
	}
	
	public ItemDetailDomain selectItemDetail(int item_Num) {
		ItemDetailDomain idd = null;
		SqlSession ss =GetCollieHandler.getInstance().getSqlSession();
		idd = ss.selectOne("selectItemDetail", item_Num);
		ss.close();
		
		return idd;
	}
	
	public List<String> detailImgList(int item_Num){
		List<String> list = null;
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		list = ss.selectList("detailImgList",item_Num);
		ss.close();
		return list;
	}
	
	/**
	 * 리뷰 목록을 조회하는 일
	 * @param rVO
	 * @return
	 */
	public List<ReviewDomain> selectReviewList(RangeVO rVO){
		List<ReviewDomain> list = null;
		
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		ss.selectList("kr.co.collie.user.item.selectReviewList", rVO);
		ss.close();
		
		return list;
	}//selectReviewList
	
	/**
	 * 리뷰 목록 페이지네이션을 위해 목록 개수를 세는 일
	 * @param rVO
	 * @return
	 */
	public int selectReviewListCnt(RangeVO rVO) {
		int cnt = 0;
		
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		cnt = ss.selectOne("kr.co.collie.user.item.selectReviewListCnt", rVO);
		ss.close();
		
		return cnt;
	}//selectReviewListCnt
	
	/**
	 * 리뷰 상세 내용을 조회하는 일
	 * @param rdVO
	 * @return
	 */
	public String selectReviewDetail(ReviewDetailVO rdVO) {
		String review_content = null;
		
		SqlSession ss= GetCollieHandler.getInstance().getSqlSession();
		ss.selectOne("kr.co.collie.user.item.selectReviewDetail", rdVO);
		ss.close();
		
		return review_content;
	}//selectReviewDetail
	
	/**
	 * 리뷰를 작성할 권한이 있는지(상품을 구매했는지) 확인하는 일
	 * @param rfVO
	 * @return
	 */
	public String selectReviewFlag(ReviewFlagVO rfVO) {
		String string = "";
		///////////////////////////// 작성해야함 ///////////////////////////
		return string;
	}//selectReviewFlag
	
	/**
	 * 리뷰를 작성하는 일
	 * @param rVO
	 * @return
	 */
	public int insertReview(ReviewVO rVO) {
		int cnt = 0;
		
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		ss.insert("kr.co.collie.user.item.insertReview", rVO);
		ss.commit();
		ss.close();
		
		return cnt;
	}//insertReview
	
	public List<ItemQnaDomain> selectItemQnaList(int itemNum){
		List<ItemQnaDomain> list=null;
		
		SqlSession ss=GetCollieHandler.getInstance().getSqlSession();
		list=ss.selectList("selectItemQnaList",itemNum);
		ss.close();
		
		return list;
	}//selectItemQnaList
	
	public static void main(String[] args) {
		RangeVO rVO = new RangeVO();
		rVO.setField_name("item_num");
		rVO.setField_value(1);
		rVO.setStart_num(1);
		rVO.setEnd_num(2);
		rVO.setCurrent_page(1);
		
		System.out.println(ItemDAO.getInstance().selectReviewList(rVO));
	}
	
}
