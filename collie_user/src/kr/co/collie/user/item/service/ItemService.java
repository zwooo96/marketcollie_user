package kr.co.collie.user.item.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.collie.user.item.dao.ItemDAO;
import kr.co.collie.user.item.domain.ItemDetailDomain;
import kr.co.collie.user.item.domain.ItemListDomain;
import kr.co.collie.user.item.domain.ItemQnaDomain;
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
	
	
	public List<ItemQnaDomain> getItemQnaList(int itemNum){
		List<ItemQnaDomain> list=null;
		
		ItemDAO iDAO=ItemDAO.getInstance();
		
		return list;
	}//getItemQnaList
}
