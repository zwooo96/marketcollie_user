package kr.co.collie.user.member.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.member.service.MemberService;
import kr.co.collie.user.member.vo.LoginVO;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import org.springframework.stereotype.Controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
public class MemberController {
	
	@RequestMapping(value = "/login_frm.do",method = GET)
	public String login() {
		
		return "member/login_frm";//이걸 리턴시키면 WEB-INF/views/login_frm.jsp로 이동한다는 의미에요!
		
	}
	
	@RequestMapping(value = "/login_process.do",method = POST)
	public String login(LoginVO loginVO, Model model) {
	
		MemberService mems=new MemberService();
		LoginDomain loginDomain=mems.login(loginVO);
		model.addAttribute("login_info",loginDomain);
		
		return "main.do";
	}//login

}
