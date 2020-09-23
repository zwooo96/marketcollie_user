package kr.co.collie.user.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.collie.user.member.vo.JoinVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpServletRequest;
@Controller
public class MemberController {
	
	@RequestMapping(value="/join_form.do", method =GET)
	public String joinForm() {
		
		
		return "";
	}//
	
	@RequestMapping(value="/join_process.do", method= GET)
	public String join(JoinVO jVO, HttpServletRequest request) {
		
		
		return "";
	}//join
	
}//class
