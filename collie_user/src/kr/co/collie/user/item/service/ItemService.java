package kr.co.collie.user.item.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.collie.user.item.dao.ItemDAO;
import kr.co.collie.user.item.domain.ItemDetailDomain;
import kr.co.collie.user.item.domain.ItemListDomain;
import kr.co.collie.user.item.domain.ItemQnaDomain;
import kr.co.collie.user.item.domain.ReviewDomain;
import kr.co.collie.user.item.vo.ReviewDetailVO;
import kr.co.collie.user.item.vo.ReviewFlagVO;
import kr.co.collie.user.item.vo.ReviewVO;
import kr.co.collie.user.pagination.RangeVO;

public class ItemService {
	
	/**
	 * 카테고리 값을 이용해서 아이템 목록을 가져온다.
	 * @param rVO
	 * @param sVO
	 * @return jsonObject jsonString
	 */
	public List<ItemListDomain> getItemList(RangeVO rVO) {
		List<ItemListDomain> list = null;
		ItemDAO dDAO = ItemDAO.getInstance();
		
		//JSP에서 필요한 전체 레코드 갯수 조회
		int totalCnt = getItemListCnt(rVO);
		rVO.setTotal_cnt(totalCnt);
		rVO.setPage_scale(4);
		rVO.calcPaging();// 모든 변수 값 설정 후 페이징 계산
		
		list = dDAO.selectItemList(rVO);
		
		return list;
	}
	
	public int getItemListCnt(RangeVO rVO) {
		ItemDAO dDAO = ItemDAO.getInstance();
		int cnt = dDAO.selectItemListCnt(rVO);
		return cnt;
	}
	

	public String toJson(List<ItemListDomain> list, RangeVO rVO) {
		JSONObject jo = new JSONObject();
		jo.put("search_tot_cnt", list.size());
		jo.put("start_num", rVO.getStart_num());
		jo.put("end_num", rVO.getEnd_num());
		
		jo.put("start_page", rVO.getStart_page());
		jo.put("end_page", rVO.getEnd_page());
		jo.put("pre_page", rVO.getPre_page());
		jo.put("next_page", rVO.getNext_page());
		
		JSONArray ja = new JSONArray();
		JSONObject jsonTemp = null;
		for(ItemListDomain item : list) {
			jsonTemp = new JSONObject();
			jsonTemp.put("item_num", item.getItem_num());
			jsonTemp.put("item_name", item.getItem_name());
			jsonTemp.put("item_price", item.getItem_price());
			jsonTemp.put("item_img", item.getItem_img());
			ja.add(jsonTemp);
		}
		jo.put("item_list", ja);		
		return jo.toJSONString();
	}
	
	public ItemDetailDomain viewItemDetail(int item_Num) {
		ItemDetailDomain idd = null;
		
		ItemDAO dDAO = ItemDAO.getInstance();
		idd = dDAO.selectItemDetail(item_Num);
		idd.setDetailImgList(dDAO.detailImgList(item_Num));
		return idd;
	}
	
	/**
	 * 리뷰 목록을 조회하는 일
	 * @param rVO
	 * @return
	 */
	public List<ReviewDomain> getReviewList(RangeVO rVO){
		List<ReviewDomain> list = null;
		
		ItemDAO iDAO = ItemDAO.getInstance();
		int total_cnt = getReviewListCnt(rVO);
		rVO.setTotal_cnt(total_cnt);
		rVO.setPage_scale(5);
		rVO.calcPaging();
		list = iDAO.selectReviewList(rVO);
		
		return list;
	}//getReviewList
	
	/**
	 * 리뷰 목록 페이지네이션을 위해 목록 개수를 세는 일
	 * @param rVO
	 * @return
	 */
	public int getReviewListCnt(RangeVO rVO) {
		int cnt = 0;
		
		ItemDAO iDAO = ItemDAO.getInstance();
		cnt = iDAO.selectReviewListCnt(rVO);
		
		return cnt;
	}//getReviewListCnt
	
	/**
	 * 리뷰 목록 페이지네이션을 위해 JSON 생성
	 * @param list
	 * @param rVO
	 * @return
	 */
	public String reviewListJson(List<ReviewDomain> list, RangeVO rVO) {
		JSONObject jo = new JSONObject();
		jo.put("total_cnt", list.size());
		jo.put("start_num", rVO.getStart_num());
		jo.put("end_num", rVO.getEnd_num());
		
		jo.put("start_page", rVO.getStart_page());
		jo.put("end_page", rVO.getEnd_page());
		jo.put("pre_page", rVO.getPre_page());
		jo.put("next_page", rVO.getNext_page());
		
		JSONArray ja = new JSONArray();
		JSONObject jsonTemp = null;
		for(ReviewDomain review : list) {
			jsonTemp = new JSONObject();
			jsonTemp.put("review_num", review.getReview_num());
			jsonTemp.put("review_subject", review.getReview_subject());
			jsonTemp.put("name", review.getName());
			jsonTemp.put("input_date", review.getInput_date());
			ja.add(jsonTemp);
		}
		jo.put("review_list", ja);		
		return jo.toJSONString();
	}//reviewListJson
	
	/**
	 * 리뷰 상세 내용을 조회하는 일
	 * @param rdVO
	 * @return
	 */
	public String viewReviewDetail(ReviewDetailVO rdVO) {
		String review_content = null;
		JSONObject jo = new JSONObject();
		
		ItemDAO iDAO = ItemDAO.getInstance();
		review_content = iDAO.selectReviewDetail(rdVO);
		jo.put("review_content", review_content);
		
		return jo.toJSONString();
	}//viewReviewDetail
	
	/**
	 * 리뷰를 작성할 권한이 있는지(상품을 구매했는지) 확인하는 일
	 * @param rfVO
	 * @return
	 */
	public boolean getReviewFlag(ReviewFlagVO rfVO) {
		boolean flag = false;
		
		ItemDAO iDAO = ItemDAO.getInstance();
		flag = iDAO.selectReviewFlag(rfVO)=="Y";
		
		return flag;
	}//getReviewFlag
	
	/**
	 * 리뷰를 작성하는 일
	 * @param rVO
	 * @return
	 */
	public boolean addReview(ReviewVO rVO) {
		boolean flag = false;
		
		ItemDAO iDAO = ItemDAO.getInstance();
		flag = iDAO.insertReview(rVO)==1;
		
		return flag;
	}//addReview
	
	public List<ItemQnaDomain> getItemQnaList(int itemNum){
		List<ItemQnaDomain> list=null;
		
		ItemDAO iDAO=ItemDAO.getInstance();
		
		return list;
	}//getItemQnaList
}
