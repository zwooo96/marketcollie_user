package kr.co.collie.user.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.collie.user.main.domain.CategoryDomain;
import kr.co.collie.user.main.domain.NewItemDomain;
import kr.co.collie.user.main.service.MainService;
import kr.co.collie.user.member.domain.LoginDomain;

@Controller
public class MainController {
	
	/**
	 * 메인 화면에 표시될 header 정보 값을 가져온다.(카테고리 정보)
	 * 
	 * @param model jsp에 값을 넘겨 줄 Model
	 * @return header jsp 페이지
	 */
	@RequestMapping(value = "/header.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getHeader(Model model) {
		MainService ms = new MainService();
		List<CategoryDomain> cateList = ms.getCategories();
		
		model.addAttribute("cate_list",cateList);
		return "common/header";
	}
	
	@RequestMapping(value="/index.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String main(Model model) {
		MainService ms = new MainService();
		List<NewItemDomain> newItemList = ms.getNewItems();
		model.addAttribute("new_item_list", newItemList);
		return "main";
	}//main
	
	
}//class
