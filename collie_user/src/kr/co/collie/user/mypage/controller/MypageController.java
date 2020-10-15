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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.mypage.domain.OrderDetailDomain;
import kr.co.collie.user.mypage.domain.OrderListDomain;
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
		if( ld != null ) {
			rVO.setField_name("member_num");
			rVO.setField_value(ld.getMember_num());
			
			MypageService ms = new MypageService();
			List<OrderListDomain> list = ms.getOrderList(rVO);
			model.addAttribute("order_list", list);
			model.addAttribute("paging", rVO);
		}//end if
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
		if( ld != null ) {
			rVO.setField_name("member_num");
			rVO.setField_value(ld.getMember_num());
			
			MypageService ms = new MypageService();
			List<OrderListDomain> list = ms.getOrderList(rVO);
			String json = ms.orderListJson(list, rVO);
			model.addAttribute("json", json);
		}//end if
		
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
		if( ld != null ) {
			moVO.setMember_num(ld.getMember_num());
			
			MypageService ms = new MypageService();
			OrderDetailDomain odd = ms.getOrderDetail(moVO);
			
			model.addAttribute("order_detail", odd);
			model.addAttribute("user_name", ld.getName());
		}//end if
		
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
	public String cancelOrder(MyOrderVO moVO, HttpSession session) {
		LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
		if( ld != null ) {
			moVO.setMember_num(ld.getMember_num());
			
			MypageService ms = new MypageService();
			boolean flag = ms.cancelOrder(moVO);
		}//end if
		
		return "redirect:order_list.do";
	}//cancelOrder
	
	/**
	 * 배송현황 조회 폼을 불러오는 일
	 * @return
	 */
	@RequestMapping(value="/mypage/tracking_info.do", method=POST)
	public String trackingInfo() {
		return "mypage/tracking_info";
	}//trackingInfo
	
	@RequestMapping(value="/mypage/check_member_form.do", method= GET)
	public String checkMypageForm() {
		
		return "mypage/check_member_form";
	}//checkPassForm
	
	@RequestMapping(value="/mypage/check_member.do", method=POST)
	public String checkMember(PassCheckVO pcVO, HttpSession session, Model model) {
		LoginDomain ld = (LoginDomain) session.getAttribute("user_info");
		pcVO.setMember_num(ld.getMember_num());
	
		MypageService ms = new MypageService();
		
		boolean flag = false;
		
		try {
			flag = ms.getMemberPass(pcVO);
		} catch(NullPointerException npe) {
//			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			flag = false;
		}//end catch
		
		if(!flag) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
		}
		
		return "forward:/mypage/memberInfo_form.do";
	}//checkPassForm
	
	@RequestMapping(value="/mypage/memberInfo_form.do" , method=POST)
	public String memberInfoForm(HttpSession session) {	
		return "mypage/modify_member_form";
	}//memberInfoForm
	
	
	@RequestMapping(value="/mypage/update_member.do", method=POST)
	public String modifyMemberInfo(ModifyMemberVO mmVO, HttpSession session, Model model, HttpServletRequest request) {
		boolean flag = false;
		
		MypageService ms = new MypageService();
		mmVO.setPhone(request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3"));
		flag = ms.modifyMemberInfo(mmVO);
		
		LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
		ld.setPhone(mmVO.getPhone());
		ld.setZipcode(mmVO.getZipcode());
		ld.setAddr(mmVO.getAddr());
		ld.setAddr_detail(mmVO.getAddr_detail());
		session.setAttribute("user_info", ld);
		
		if(!flag) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
		}
		return "mypage/modify_member_result";
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
	public String removeMemberInfo(DeleteMemberVO dmVO, HttpSession session, Model model) {
		LoginDomain ld = (LoginDomain)session.getAttribute("user_info");
		dmVO.setMember_num(ld.getMember_num());
		
		MypageService ms = new MypageService();
		
		// 비밀번호 일치하는지 확인하는 코드
		// 공통 로직으로 비밀번호 체크하기 위해 PassCheckVO 생성해서 넣어줌
		PassCheckVO pcVO = new PassCheckVO();
		pcVO.setMember_num(dmVO.getMember_num());
		pcVO.setPass(dmVO.getPass());
		boolean passFlag = ms.getMemberPass(pcVO);
		
		//비밀번호가 일치하면 회원 삭제 진행
		if(passFlag) {
			boolean deleteFlag = ms.removeMember(dmVO);
			if(!deleteFlag) {
				model.addAttribute("msg", "회원 탈퇴를 할 수 없습니다. 잠시 후 다시 시도해주세요.");
			} else {
				//회원 탈퇴 성공하면 세션 제거
				session.removeAttribute("user_info");
			}
		} else {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
		}
		
		
		return "mypage/remove_member_result";
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
	public String checkPass(PassCheckVO pcVO, HttpSession session, RedirectAttributes ra) {
		LoginDomain ld = (LoginDomain) session.getAttribute("user_info");
		if( ld != null) {
			pcVO.setMember_num(ld.getMember_num());
			MypageService ms = new MypageService();
			boolean flag = false;
			try {
				flag = ms.getMemberPass(pcVO);
			} catch(NullPointerException npe) {
//				ra.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
				flag = false;
			}//end catch
			
			if(!flag) {
				ra.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			}
		}//end if
		
		return "redirect:modify_pass_form.do";
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
	@RequestMapping(value="/mypage/modify_pass.do", method=POST)
	public String modifyPass(UpdatePassVO upVO, HttpSession session, Model model) {
		LoginDomain ld = (LoginDomain) session.getAttribute("user_info");
		if( ld != null ) {
			upVO.setMember_num(ld.getMember_num());
			MypageService ms = new MypageService();
			boolean flag = ms.modifyPass(upVO);
		}//end if
		
		return "mypage/modify_pass_result";
	}//checkPassForm
	
	/**
	 * 문의 내역이 처음 불릴때 호출되는 method
	 * @param model
	 * @param ss
	 * @return
	 */
	@RequestMapping(value = "/mypage/qna_list.do",method = {GET,POST})
	public String qnaList(Model model,HttpSession ss) {
		LoginDomain ldd = (LoginDomain)ss.getAttribute("user_info");
		int member_num=ldd.getMember_num();
		MypageService ms = new MypageService();
		
		RangeVO rVO=new RangeVO();
		rVO.setField_name("member_num");
		rVO.setField_value(member_num);
		rVO.setTotal_cnt(ms.getQnaTotalCnt(member_num));
		rVO.calcPaging();
		
		model.addAttribute("qna_list",ms.getQnaList(rVO));
		model.addAttribute("paging", rVO);
		
		return "mypage/qna_list";
	}
	
	/**
	 * 페이지를 눌렀을때 호출되는 method
	 * @param model
	 * @param ss
	 * @return
	 */
	@RequestMapping(value = "/mypage/qna_list_move_page.do",method = POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String moveQnaListPage(int current_page, Model model,HttpSession ss) throws NumberFormatException {
		String json=null;
		
		LoginDomain ldd = (LoginDomain)ss.getAttribute("user_info");
		int member_num=ldd.getMember_num();
		
		MypageService ms = new MypageService();
		json=ms.moveQnaListPage(member_num, current_page);
		
		return json;
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
