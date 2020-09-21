package kr.co.collie.user.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		
		//임시로  session 추가
		session.setAttribute("member_num", 2);
		
		return "main";
	}//main
	
}//class
