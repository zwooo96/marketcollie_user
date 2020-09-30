package kr.co.collie.user.item.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.collie.user.item.domain.ItemListDomain;
import kr.co.collie.user.item.service.ItemService;
import kr.co.collie.user.pagination.RangeVO;

@Controller
public class ItemController {
	
	@RequestMapping(value="/item/getItems.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String getItemList(RangeVO rVO, Model model) {
		ItemService iService = new ItemService();
		List<ItemListDomain> list = iService.getItemList(rVO);
		model.addAttribute("item_list", list);
		model.addAttribute("paging", rVO);
		return "/item/category_item_result";
	}
	
	@RequestMapping(value="/item/search.do", method=RequestMethod.POST)
	public String getSearchList(RangeVO rVO, Model model) {
		ItemService iService = new ItemService();
		List<ItemListDomain> list = iService.getItemList(rVO);
		String json = iService.toJson(list, rVO);
		
		model.addAttribute("json", json);
		return "/item/search_item_json";
	}
	
	
	
}
