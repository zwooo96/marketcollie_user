package kr.co.collie.user.mypage.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.mypage.service.MypageService;
import kr.co.collie.user.mypage.vo.PassCheckVO;
import kr.co.collie.user.mypage.vo.UpdatePassVO;

@Controller
public class MypageController {
	
	@RequestMapping(value="/mypage/memberinfo_form.do" , method=GET)
	public String memberInfoForm(HttpSession session, Model model, PassCheckVO pcVO ) {
		
		String pass = (String)session.getAttribute("pass");
		
		
		
		return "mypage/memberinfo";
	}//memberInfoForm
	
	/**
	 * 마이페이지 - 비밀번호 변경 : 현재 비밀번호 확인하는 폼
	 * @return
	 */
	@RequestMapping(value="/mypage/check_pass_form.do", method=GET)
	public String checkPassForm() {
		return "mypage/check_pass_form";
	}//checkPassForm
	
	/**
	 * 마이페이지 - 비밀번호 변경 : 현재 비밀번호 확인하는 일
	 * @param pcVO
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/mypage/check_pass.do", method=POST)
	public String checkPass(PassCheckVO pcVO, HttpSession session, Model model) {
		LoginDomain ld = (LoginDomain) session.getAttribute("user_info");
		pcVO.setMemberNum(ld.getMember_num());
		
		MypageService ms = new MypageService();
		boolean flag = ms.getMemberPass(pcVO);
		
		model.addAttribute("url", "mypage/modify_pass_form");
		if( !flag ) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("url", "mypage/check_pass_form");
		}//end if
		
		return "redirect:mypage/check_pass_process.jsp";
	}//checkPassForm
	
	/**
	 * 비밀번호 수정하기 위한 폼
	 * @return
	 */
	@RequestMapping(value="/mypage/modify_pass_form.do", method=GET)
	public String modifyPassForm() {
		return "mypage/modify_pass_form";
	}//modifyPassForm
	
	/**
	 * 비밀번호 변경하는 일
	 * @param upVO
	 * @return
	 */
	@RequestMapping(value="/mypage/modify_pass.do", method=GET)
	public String modifyPass(UpdatePassVO upVO, HttpSession session, Model model) {
		LoginDomain ld = (LoginDomain) session.getAttribute("user_info");
		upVO.setMember_num(ld.getMember_num());
		
		MypageService ms = new MypageService();
		boolean flag = ms.modifyPass(upVO);
		
		return "redirect:mypage/modify_pass_result.jsp";
	}//checkPassForm
	
}//MypageController
