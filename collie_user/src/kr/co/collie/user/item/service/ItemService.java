package kr.co.collie.user.item.service;

import java.sql.SQLException;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.collie.user.item.dao.ItemDAO;
import kr.co.collie.user.item.domain.ItemDetailDomain;
import kr.co.collie.user.item.domain.ItemListDomain;
import kr.co.collie.user.item.domain.ItemQnaDetailDomain;
import kr.co.collie.user.item.domain.ItemQnaDomain;
import kr.co.collie.user.item.domain.ReviewDomain;
import kr.co.collie.user.item.vo.ItemQnaListVO;
import kr.co.collie.user.item.vo.ItemQnaVO;
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
		rVO.setPage_scale(6);
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
		jo.put("current_page", rVO.getCurrent_page());
		jo.put("total_page", rVO.getTotal_page());
		
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
		
		List<String> result = dDAO.detailImgList(item_Num);
				
		
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
			jsonTemp.put("id", review.getId());
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
	
	public List<ItemQnaDomain> getItemQnaList(ItemQnaListVO iqlVO){
		List<ItemQnaDomain> list=null;
		
		ItemDAO iDAO=ItemDAO.getInstance();
		list=iDAO.selectItemQnaList(iqlVO);
		
		return list;
	}//getItemQnaList
	
	public String getItemQnaMovePage(ItemQnaListVO iqlVO, int currentPage){
		JSONObject json=new JSONObject();
		
		ItemDAO iDAO=ItemDAO.getInstance();
		
		int totalCnt=iDAO.selectItemQnaCnt(iqlVO.getItem_num());
		RangeVO rVO=new RangeVO();
		rVO.setTotal_cnt(totalCnt);
		rVO.setCurrent_page(currentPage);
		rVO.setPage_scale(1);
		rVO.calcPaging();
		
		iqlVO.setStart_num( rVO.getStart_num() );
		iqlVO.setEnd_num( rVO.getEnd_num() );
		List<ItemQnaDomain> list=iDAO.selectItemQnaList(iqlVO);
		
		String flag="fail";
		if(list!=null) {
			flag="success";
			
			JSONArray jsonArr=new JSONArray();
			JSONObject jsonObj=null;
			for(int i=0; i<list.size(); i++) {
				jsonObj=new JSONObject();
				jsonObj.put("idx", list.get(i).getIdx());
				jsonObj.put("item_qna_num", list.get(i).getItem_qna_num());
				jsonObj.put("id", list.get(i).getId());
				jsonObj.put("item_qna_subject", list.get(i).getItem_qna_subject());
				jsonObj.put("item_qna_flag", list.get(i).getItem_qna_flag());
				jsonObj.put("input_date", list.get(i).getInput_date());
				jsonArr.add(jsonObj);
			}//end for
			json.put("qna_list", jsonArr);
			
			json.put("current_page",rVO.getCurrent_page());
			json.put("pre_page",rVO.getPre_page());
			json.put("next_page",rVO.getNext_page());
			json.put("start_page",rVO.getStart_page());
			json.put("end_page",rVO.getEnd_page());
			json.put("total_page",rVO.getTotal_page());
		}//end if
		json.put("flag", flag);
		
		
		return json.toJSONString();
	}//getItemQnaList
	
	public String getItemQnaDetail(int itemQnaNum) {
		JSONObject json=new JSONObject();
		
		ItemQnaDetailDomain iqdDomain=ItemDAO.getInstance().selectItemQnaDetail(itemQnaNum);
		
		String flag="fail";
		if(iqdDomain!=null) {
			flag="success";
			json.put("item_qna_content", iqdDomain.getItem_qna_content());
			json.put("item_qna_reply", iqdDomain.item_qna_reply);
			json.put("reply_date", iqdDomain.reply_date);
		}//end if
		json.put("flag", flag);
		
		return json.toString();
	}//getItemQnaDetail
	
	public int getItemQnaCnt(int itemNum) {
		int cnt=0;
		
		cnt=ItemDAO.getInstance().selectItemQnaCnt(itemNum);
		
		return cnt;
	}//getItemQnaCnt
	
	public boolean addItemQna(ItemQnaVO iqVO) {
		boolean flag=false;
		
		try {
			ItemDAO.getInstance().insertItemQna(iqVO);
			flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return flag;
	}//addItemQna
}
