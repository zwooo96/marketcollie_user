package kr.co.collie.user.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.collie.user.main.domain.CategoryDomain;
import kr.co.collie.user.main.service.MainService;
import kr.co.collie.user.member.domain.LoginDomain;

@Controller
public class MainController {
	
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		MainService ms = new MainService();
		List<CategoryDomain> cateList = ms.getCategories();
		
//		//로그인 구현이 다 완료되면
		//세션에 user_info이 있으면 header에 로그아웃 / 마이페이지로 변경
		//user_info가 없으면 haeder에 로그인 / 회원가입으로 변경
		Object loginSession = session.getAttribute("user_info") ;
		if(loginSession != null && loginSession instanceof LoginDomain) {
			LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
			
		} else {
			
		}
		
		
		model.addAttribute("cate_list",cateList);
		
		
		
		return "main";
	}//main
	
}//class
