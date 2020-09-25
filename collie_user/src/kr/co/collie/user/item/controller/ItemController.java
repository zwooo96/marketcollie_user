package kr.co.collie.user.item.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.collie.user.item.domain.ItemListDomain;
import kr.co.collie.user.item.service.ItemService;

@Controller
public class ItemController {
	
	@GetMapping(value="/item/search.do")
	public String getSearchList(String keyword, Model model) {
		
		ItemService iService = new ItemService();
		List<ItemListDomain> list = iService.getSearchList(keyword);
		model.addAttribute("search_result", list);
		return "item/searchItem_result";
	}
}
