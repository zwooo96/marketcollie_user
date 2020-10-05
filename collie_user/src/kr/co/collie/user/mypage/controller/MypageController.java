package kr.co.collie.user.mypage.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.mypage.domain.OrderDetailDomain;
import kr.co.collie.user.mypage.domain.OrderListDomain;
import kr.co.collie.user.mypage.domain.QnaDetailDomain;
import kr.co.collie.user.mypage.service.MypageService;
import kr.co.collie.user.mypage.vo.DeleteMemberVO;
import kr.co.collie.user.mypage.vo.ModifyMemberVO;
import kr.co.collie.user.mypage.vo.MyOrderVO;
import kr.co.collie.user.mypage.vo.PassCheckVO;
import kr.co.collie.user.mypage.vo.QnaVO;
import kr.co.collie.user.mypage.vo.UpdatePassVO;
import kr.co.collie.user.pagination.RangeVO;

@Controller
public class MypageController {
	
	/**
	 * 주문내역 목록을 불러오는 일
	 * @param session
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/mypage/order_list.do", method = GET)
	public String orderList(HttpSession session, Model model, RangeVO rVO) {
		LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
		rVO.setField_name("member_num");
		rVO.setField_value(ld.getMember_num());
		
		MypageService ms = new MypageService();
		List<OrderListDomain> list = ms.getOrderList(rVO);
		model.addAttribute("order_list", list);
		model.addAttribute("paging", rVO);
		
		return "mypage/order_list";
	}//orderList
	
	
	/**
	 * 주문 내역 페이지네이션 - 페이지번호 클릭 시 실행
	 * @param session
	 * @param model
	 * @param rVO
	 * @return
	 */
	@RequestMapping(value="/mypage/order_list_page.do", method = GET)
	public String orderListPaging(HttpSession session, Model model, RangeVO rVO) {
		LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
		rVO.setField_name("member_num");
		rVO.setField_value(ld.getMember_num());
		
		MypageService ms = new MypageService();
		List<OrderListDomain> list = ms.getOrderList(rVO);
		String json = ms.orderListJson(list, rVO);
		model.addAttribute("json", json);
		
		return "mypage/order_list_json";
	}//orderListPaging
	
	/**
	 * 주문 내역 상세페이지를 불러오는 일
	 * @param moVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/mypage/order_detail.do", method=GET)
	public String orderDetail(MyOrderVO moVO, HttpSession session, Model model) {
		LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
		moVO.setMember_num(ld.getMember_num());
		
		MypageService ms = new MypageService();
		OrderDetailDomain odd = ms.getOrderDetail(moVO);
		
		model.addAttribute("order_detail", odd);
		model.addAttribute("user_name", ld.getName());
		
		return "mypage/order_detail";
	}//orderDetail
	
	/**
	 * 주문내역을 취소하는 일
	 * @param moVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/mypage/order_cancel.do", method=GET)
	public String cancelOrder(MyOrderVO moVO, HttpSession session, Model model) {
		LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
		moVO.setMember_num(ld.getMember_num());
		
		MypageService ms = new MypageService();
		boolean flag = ms.cancelOrder(moVO);
		model.addAttribute("cancelFlag", flag);
		
		return "mypage/order_list";
	}//cancelOrder
	
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
	
	@RequestMapping(value="/mypage/memberInfo_form.do" , method=POST)
	public String memberInfoForm(HttpSession session) {	
		
		
		LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
		 
		return "mypage/modify_member_form";
	}//memberInfoForm
	
	
	@RequestMapping(value="/mypage/update_member.do", method=POST)
	public String modifyMemberInfo(ModifyMemberVO mmVO, HttpSession session, Model model, HttpServletRequest request) {
		boolean flag = false;
		LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
		
		MypageService ms = new MypageService();
		mmVO.setPhone(request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3"));
		
		
		flag = ms.modifyMemberInfo(mmVO);
		
		
		return "forward:modify_member_result.jsp";
	}//modifyMemberInfo
	
	/** 회원 탈퇴를 위한 폼
	 * @param pcVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping( value="/mypage/remove_member_form.do", method=GET )
	public String removeMemberInfoForm( ) {
		
		
		return"mypage/remove_member_form";
	}//removeMemberInfo
	
	/** 회원 탈퇴
	 * @param pcVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/mypage/remove_member.do", method = POST)
	public String removeMemberInfo( DeleteMemberVO dmVO, HttpSession session, PassCheckVO pcVO, Model model) {
		LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
		dmVO.setMember_num(ld.getMember_num());
	
		
		MypageService ms = new MypageService();
		boolean deleteFlag = ms.removeMember(dmVO);
		
		try {
			boolean passFlag = ms.getMemberPass(pcVO);
		} catch(NullPointerException npe) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
		}//end catch
		
		session.removeAttribute("user_info");
		
		return "redirect:remove_member_result.jsp";
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
		pcVO.setMember_num(ld.getMember_num());
		
		MypageService ms = new MypageService();
		try {
			boolean flag = ms.getMemberPass(pcVO);
		} catch(NullPointerException npe) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
		}//end catch
		
		return "redirect:modify_pass_form.jsp";
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
		upVO.setMember_num(ld.getMember_num());
		
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
	
	@RequestMapping(value = "/mypage/qna_detail.do",method = GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String qnaDetail(QnaVO qVO, HttpSession session) throws NumberFormatException {
		String json="";
		
		LoginDomain lDomain=(LoginDomain)session.getAttribute("user_info");
		qVO.setMember_num(lDomain.getMember_num());
		
		MypageService ms = new MypageService();
		json=ms.getQnaDetail(qVO);
		
		return json;
		
	}
	
}//MypageController
