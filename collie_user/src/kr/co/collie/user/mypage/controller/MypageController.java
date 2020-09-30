package kr.co.collie.user.mypage.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.mypage.domain.QnaDetailDomain;
import kr.co.collie.user.mypage.service.MypageService; 
import kr.co.collie.user.mypage.vo.ModifyMemberVO;
import kr.co.collie.user.mypage.vo.MyOrderVO;
import kr.co.collie.user.mypage.vo.PassCheckVO;
import kr.co.collie.user.mypage.vo.QnaVO;
import kr.co.collie.user.mypage.vo.UpdatePassVO;

@Controller
public class MypageController {
	
	@RequestMapping(value="/mypage/check_member_form.do", method= GET)
	public String checkMypageForm() {
		
		return "mypage/check_member_form";
	}//checkPassForm
	
	@RequestMapping(value="/mypage/check_member.do", method=POST)
	public String checkMember(PassCheckVO pcVO, HttpSession session, Model model) {
		LoginDomain ld = (LoginDomain) session.getAttribute("user_info");
		// pcVO.setMember_num(ld.getMember_num());
		pcVO.setMember_num(ld.getMember_num());
	
		
		MypageService ms = new MypageService();
		try {
			boolean flag = ms.getMemberPass(pcVO);
		} catch(NullPointerException npe) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
		}//end catch
		
		return "forward:/mypage/memberInfo_form.do";
	}//checkPassForm
	
	/**
	 * 변경 정보를 담는 폼
	 * @return
	 */
	@RequestMapping(value="/mypage/memberInfo_form.do" , method=POST)
	public String memberInfoForm(  ) {
		
		
		
		return "mypage/modify_member_form";
	}//memberInfoForm
	
	
	/**
	 * 멤버 정보 변경하는 일
	 * @param mmVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/mypage/update_member.do", method=POST)
	public String modifyMemberInfo(ModifyMemberVO mmVO, HttpSession session, Model model) {
		LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
		
		MypageService ms = new MypageService();
		
		boolean flag = ms.modifyMemberInfo(mmVO);
		
		
		return "forward:modify_member_result.jsp";
	}//modifyMemberInfo
	
	@RequestMapping( value="/mypage/remove_member_form.do", method=GET)
	public String removeMemberInfoForm( PassCheckVO pcVO, HttpSession session, Model model) {
		LoginDomain ld = (LoginDomain) session.getAttribute("user_info");
		// pcVO.setMember_num(ld.getMember_num());
		pcVO.setMember_num(ld.getMember_num());
	
		
		MypageService ms = new MypageService();
		try {
			boolean flag = ms.getMemberPass(pcVO);
		} catch(NullPointerException npe) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
		}//end catch
		
		return"forward:remove_member_result.jsp";
	}//removeMemberInfo
	
	@RequestMapping(value="", method = POST)
	public String removeMemberInfo() {
		
		
		return "mypage/remove_member_form";
	}
	
	
	
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
		//pcVO.setMember_num(ld.getMember_num());
		pcVO.setMember_num(1); ///////////////////////////////////////// 임시값
		
		MypageService ms = new MypageService();
		try {
			boolean flag = ms.getMemberPass(pcVO);
		} catch(NullPointerException npe) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
		}//end catch
		
		return "forward:/mypage/modify_pass_form.do";
	}//checkPassForm
	
	/**
	 * 비밀번호 수정하기 위한 폼
	 * @return
	 */
	@RequestMapping(value="/mypage/modify_pass_form.do", method=POST)
	public String modifyPassForm() {
		return "mypage/modify_pass_form";
	}//modifyPassForm
	
	/**
	 * 비밀번호 변경하는 일
	 * @param upVO
	 * @return
	 */
	@RequestMapping(value="/mypage/modify_pass.do", method=POST)
	public String modifyPass(UpdatePassVO upVO, HttpSession session, Model model) {
		LoginDomain ld = (LoginDomain) session.getAttribute("user_info");
		//upVO.setMember_num(ld.getMember_num());
		upVO.setMember_num(1); /////////////////////////임시값
		
		MypageService ms = new MypageService();
		boolean flag = ms.modifyPass(upVO);
		
		return "redirect:modify_pass_result.jsp";
	}//checkPassForm
	
	@RequestMapping(value = "/mypage/qna_list.do",method = {GET,POST})
	public String qnaList(Model model,HttpSession ss) {
		LoginDomain ldd = (LoginDomain)ss.getAttribute("user_info");
		MypageService ms = new MypageService();
		model.addAttribute("qna_list",ms.getQnaList(ldd.getMember_num()));
		
		return "mypage/qna_list";
	}
	@RequestMapping(value = "/mypage/qna_detail.do",method = GET)
	public String qnaDetail(String qNum, HttpSession session, Model model) throws NumberFormatException {
		
		QnaVO qVO=new QnaVO();
		LoginDomain lDomain=(LoginDomain)session.getAttribute("user_info");
		qVO.setMember_num(lDomain.getMember_num());
		qVO.setQna_num(Integer.parseInt(qNum));
		
		MypageService ms = new MypageService();
		QnaDetailDomain qdd=ms.getQnaDetail(qVO);
		model.addAttribute("qna_data",qdd);
		
		return "mypage/qna_detail";
		
	}
	
}//MypageController
