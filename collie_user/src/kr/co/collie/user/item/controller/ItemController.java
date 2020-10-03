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
import kr.co.collie.user.item.vo.ReviewDetailVO;
import kr.co.collie.user.item.vo.ReviewFlagVO;
import kr.co.collie.user.item.vo.ReviewVO;
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
	public String getReviewList(RangeVO rVO, Model model) {
		List<ReviewDomain> list = null;
		ItemService is = new ItemService();
		list = is.getReviewList(rVO);
		model.addAttribute("review_list", list);
		
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
		String json = is.reviewListJson(list, rVO);
		model.addAttribute("json", json);
		
		return "item/review_list_json";
	}//reviewListPaging
	
	/**
	 * 리뷰 상세 내용을 조회하는 일
	 * @param rdVO
	 * @return
	 */
	@RequestMapping(value="/item/review_detail.do", method=RequestMethod.GET)
	@ResponseBody
	public String viewReviewDetail(ReviewDetailVO rdVO, Model model) {
		ItemService is = new ItemService();
		String json = is.viewReviewDetail(rdVO);
		model.addAttribute("json", json);
		
		return "item/review_detail_json";
	}//viewReviewDetail
	
	/**
	 * 리뷰를 작성하기 위한 폼을 불러오는 일
	 * @param session
	 * @param rfVO
	 * @return
	 */
	@RequestMapping(value="/item/review_form.do", method=RequestMethod.GET)
	public String reviewForm(HttpSession session, ReviewFlagVO rfVO, Model model) {
		boolean flag = false;

		ItemService is = new ItemService();
		//리뷰를 작성할 권한이 있는지(상품을 구매했는지) 확인
		flag = is.getReviewFlag(rfVO);
		model.addAttribute("buyFlag", flag);
		
		return "item/review_form";
	}//reviewForm
	
	/**
	 * 리뷰를 작성하는 일
	 * @param rVO
	 * @return
	 */
	@RequestMapping(value="/item/review_write.do", method=RequestMethod.GET)
	public String addReview(ReviewVO rVO) {
		ItemService is = new ItemService();
		is.addReview(rVO);
		
		return "item/review_list";
	}//addReview
	
	@RequestMapping(value="/item_qna_list.do", method=RequestMethod.GET)
	public String viewItemQnaList(Model model) throws NumberFormatException {
		System.out.println("====dk 잠만 빌드 안된거아냐!??!!??!!?=========================================viewItemQnaList 이거 호출하는데좀 찾아줘요");
		int item_num=1;
		List<ItemQnaDomain> list=new ItemService().getItemQnaList(item_num);
		
		model.addAttribute("qna_list", list);
		
		return "item/item_qna";
	}//viewItemQnaDetail
	
}
