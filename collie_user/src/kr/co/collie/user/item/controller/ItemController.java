package kr.co.collie.user.item.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.collie.user.item.domain.ItemListDomain;
import kr.co.collie.user.item.domain.ItemQnaDomain;
import kr.co.collie.user.item.domain.ReviewDomain;
import kr.co.collie.user.item.service.ItemService;
import kr.co.collie.user.item.vo.ItemQnaListVO;
import kr.co.collie.user.item.vo.ReviewDetailVO;
import kr.co.collie.user.item.vo.ReviewFlagVO;
import kr.co.collie.user.item.vo.ReviewVO;
import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.pagination.RangeVO;

@Controller
public class ItemController {
	
	@RequestMapping(value="/item/getItems.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String getItemList(RangeVO rVO, Model model) {
		ItemService iService = new ItemService();
		List<ItemListDomain> list = iService.getItemList(rVO);
		model.addAttribute("item_list", list);
		model.addAttribute("paging", rVO);
		return "/item/search_item_result";
	}
	
	@RequestMapping(value="/item/search.do", method=RequestMethod.POST)
	public String getSearchList(RangeVO rVO, Model model) {
		ItemService iService = new ItemService();
		List<ItemListDomain> list = iService.getItemList(rVO);
		String json = iService.toJson(list, rVO);
		
		model.addAttribute("json", json);
		return "/item/search_item_json";
	}
	
	@RequestMapping(value = "/item/item_detail.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String viewItemDetail(String item_num,Model model) throws NumberFormatException {
		ItemService iservice = new ItemService();
		
		model.addAttribute("item_detail",(iservice.viewItemDetail(Integer.parseInt(item_num))));
		
		return "/item/item_detail";
	}
	
	/**
	 * 리뷰 목록을 조회하는 일
	 * @param rVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/item/review_list.do", method=RequestMethod.GET)
	public String getReviewList(HttpSession session, ReviewFlagVO rfVO, RangeVO rVO, Model model) {
		List<ReviewDomain> list = null;
		ItemService is = new ItemService();
		rVO.setField_name("item_num");
		rVO.setField_value(rfVO.getItem_num());
		list = is.getReviewList(rVO);
		model.addAttribute("review_list", list);
		model.addAttribute("paging", rVO);
		
		if( (LoginDomain)session.getAttribute("user_info") != null ) {
			boolean flag = false;
			LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
			rfVO.setMember_num(ld.getMember_num());
			//리뷰를 작성할 권한이 있는지(상품을 구매했는지) 확인
			flag = is.getReviewFlag(rfVO);
			model.addAttribute("buyFlag", flag);
		}//end if
		
		return "item/review_list";
	}//getReviewList
	
	/**
	 * 리뷰 목록 페이지네이션 - 페이지번호 클릭 시 실행
	 * @param rVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/item/review_list_page.do", method=RequestMethod.GET)
	public String reviewListPaging(RangeVO rVO, Model model) {
		ItemService is = new ItemService();
		List<ReviewDomain> list = is.getReviewList(rVO);
		rVO.setField_name("item_num");
		rVO.setField_value(rVO.getField_value());
		String json = is.reviewListJson(list, rVO);
		model.addAttribute("json", json);
		
		return "item/review_list_json";
	}//reviewListPaging
	
	/**
	 * 리뷰 상세 내용을 조회하는 일
	 * @param rdVO
	 * @return
	 */
	@RequestMapping(value="/item/review_detail.do", method=RequestMethod.GET, produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String viewReviewDetail(ReviewDetailVO rdVO) {
		ItemService is = new ItemService();
		String json = is.viewReviewDetail(rdVO);
		
		return json;
	}//viewReviewDetail
	
	/**
	 * 리뷰를 작성하기 위한 폼을 불러오는 일
	 * @param session
	 * @param rfVO
	 * @return
	 */
	@RequestMapping(value="/item/review_form.do", method=RequestMethod.GET)
	public String reviewForm() {
		return "item/review_form";
	}//reviewForm
	
	/**
	 * 리뷰를 작성하는 일
	 * @param rVO
	 * @return
	 */
	@RequestMapping(value="/item/review_write.do", method=RequestMethod.POST)
	public String addReview(ReviewVO rVO, HttpSession session, int item_num) {
		LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
		rVO.setMember_num(ld.getMember_num());
		
		ItemService is = new ItemService();
		is.addReview(rVO);
		
		return "redirect:/item/item_detail.do?item_num="+item_num;
	}//addReview
	
	@RequestMapping(value="/item/item_qna_list.do", method=RequestMethod.GET)
	public String viewItemQnaList(ItemQnaListVO iqlVO, String current_page, Model model) throws NumberFormatException {
		
		if(current_page==null) {
			current_page="1";
		}//end if
		int currentPage=Integer.parseInt(current_page);
		
		iqlVO.setStart_num( (currentPage-1)*5+1 );
		iqlVO.setEnd_num( iqlVO.getStart_num()+5-1 );
		
		List<ItemQnaDomain> list=new ItemService().getItemQnaList(iqlVO);
		model.addAttribute("qna_list", list);
		
		return "item/item_qna";
	}//viewItemQnaList
	
	@RequestMapping(value="/item/item_qna_detail.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getItemQnaDetail(int item_qna_num) throws NumberFormatException {
		String json=null;
		
		json=new ItemService().getItemQnaDetail(item_qna_num);
		
		return json;
	}//getItemQnaDetail
	
}
