package kr.co.collie.user.qna.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.qna.service.QnaService;
import kr.co.collie.user.qna.vo.QnaAddVO;

@SessionAttributes("user_info")
@Controller
public class QnaController {
	
	
	@RequestMapping(value = "/qna/qna_form.do", method = RequestMethod.GET)
	public String qnaForm(QnaAddVO qaVO,HttpSession ss) {
		
		String url = "redirect:/login_form.do";
		
		if(ss.getAttribute("user_info")!=null) {
			url="/qna/qna_form";
		}
		
		return url;
	}

	@RequestMapping(value = "/qna/qna_process.do", method = RequestMethod.POST)
	public String qnaAdd(QnaAddVO qaVO, HttpSession ss) {
		String url="/qna/qna_form"; //입력 실패시 form으로 돌아감
		
		QnaService qs = new QnaService();
		
		LoginDomain lod = (LoginDomain)ss.getAttribute("user_info");
		qaVO.setMember_num(lod.getMember_num());
		
		if(!qs.addQna(qaVO)) { //flag가 true이면 입력 실패 , flag가 false인 경우 입력 성공이므로 if문 실행
			
			url="/qna/qna";
			
		}
		
		return url;
	}
}
