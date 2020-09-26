package kr.co.collie.user.item.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.collie.user.item.domain.ItemListDomain;
import kr.co.collie.user.item.service.ItemService;
import kr.co.collie.user.pagination.PaginationDomain;

@Controller()
public class ItemController {
	
	@RequestMapping(value="/item/search.do", method=RequestMethod.GET)
	public String getSearchList(@RequestParam (defaultValue = "1") int currentPage, String keyword, Model model) {
		ItemService iService = new ItemService();
		List<ItemListDomain> list = iService.getSearchList(keyword);
		model.addAttribute("search_result", list);
		return "item/searchItem_result";
	}
	
	@RequestMapping(value="/item/searchByCate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getItemList(@RequestParam (defaultValue = "1") int currentPage, int cate_num, Model model) {
		ItemService iService = new ItemService();
		List<ItemListDomain> list = iService.getItemList(cate_num);
		model.addAttribute("search_result", list);
//		System.out.println("current page >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + currentPage);
		PaginationDomain pVO = new PaginationDomain(list.size());
		pVO.setCurrentPage(currentPage);
		model.addAttribute("paging", pVO);
		return "item/searchItem_result";
	}
	
}
