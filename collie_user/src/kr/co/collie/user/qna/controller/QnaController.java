package kr.co.collie.user.qna.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

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
		String url="forward:/qna/qna_form";
		QnaService qs = new QnaService();
		
		String id =(String)ss.getAttribute("user_info");
		qaVO.setMemeber_num(id);
		
		if(!qs.addQna(qaVO)) {
			
			url="forward:/qna/qna";
			
		}
		
		return url;
	}
}
