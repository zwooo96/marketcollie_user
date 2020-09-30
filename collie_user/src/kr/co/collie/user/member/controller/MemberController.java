package kr.co.collie.user.member.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.member.service.MemberService;
import kr.co.collie.user.member.vo.FindIdVO;
import kr.co.collie.user.member.vo.FindPassVO;
import kr.co.collie.user.member.vo.JoinVO;
import kr.co.collie.user.member.vo.LoginVO;
import kr.co.collie.user.member.vo.UpdatePassVO;
import kr.co.collie.user.mypage.vo.ModifyMemberVO;

@SessionAttributes({"user_info","find_pass_info"})
@Controller
public class MemberController {
	
	@RequestMapping(value = "/login_form.do",method = GET)
    public String loginForm() {
        
        return "member/login_form";//이걸 리턴시키면 WEB-INF/views/login_frm.jsp로 이동한다는 의미에요!
        
    }
    
    @RequestMapping(value = "/login_process.do",method = POST)
    public String login(LoginVO loginVO, Model model) {
    
        MemberService mems=new MemberService();
        LoginDomain loginDomain=mems.login(loginVO);
        String url = "";
        if(loginDomain==null) {
             url = "member/login_result";
        } else {
             url = "redirect:index.do";
             model.addAttribute("user_info",loginDomain);
        }
        return url;
        
    }//login
    
    @RequestMapping(value="/join_clause.do", method = GET)
    public String joinForm() {
        
        
        return "member/join_clause";
    }//joinForm
    
    @RequestMapping(value="/join_form.do", method = GET)
    public String joinClause() {
        
        
        return "member/join_frm";
    }//joinForm
    
    @RequestMapping(value="/join_process.do", method= POST)
    public String join(JoinVO jVO, HttpServletRequest request) {
        MemberService ms = new MemberService();
        
        jVO.setId(request.getParameter("id"));
        jVO.setPass(request.getParameter("pass"));
        jVO.setName(request.getParameter("name"));
        jVO.setEmail(request.getParameter("email"));
        jVO.setPhone(request.getParameter("phone"));
         jVO.setZipcode(request.getParameter("zipcode"));
        jVO.setAddr(request.getParameter("addr"));
         jVO.setAddr_detail(request.getParameter("addr_detail"));
        jVO.setIp(request.getRemoteAddr());
        
        ms.join(jVO);
        
        return "member/join";
    }//join
    
    @RequestMapping(value="/id_chk_ajax.do", method=GET)
    @ResponseBody
    public String dupIdAjax(String id) {
        String result="";
        MemberService ms = new MemberService();
        result = ms.dupIdCheck(id);
        return result;
    }//test
    
    @RequestMapping(value="/email_chk_ajax.do", method=GET)
    @ResponseBody
    public String dupEmailAjax(String email) {
        
        MemberService ms = new MemberService();
        
        return ms.dupEmailCheck(email);
    }//dupEmailAjax
    
    @RequestMapping(value = "/find/idForm.do",method = GET)
    public String findIdForm() {
        
        return "find/idForm";//이걸 리턴시키면 WEB-INF/views/login_frm.jsp로 이동한다는 의미에요!
        
    }
    
    @RequestMapping(value = "/find/find_id_process.do",method = POST)
    public String findId(FindIdVO fidVO,Model model) {
        MemberService ms = new MemberService();
         model.addAttribute("user_id",ms.findId(fidVO));
        return "find/id";
    }
    
    @RequestMapping(value = "/find/passForm.do",method = GET)
    public String findPassForm() {
        return "find/passForm";
    }
    
    @RequestMapping(value = "/find/find_pass_process.do",method = POST)
    public String findPass(FindPassVO fpsVO,Model model) {
        String url="forward:/find/passForm.do";
        
        MemberService ms = new MemberService();
        
        if(!ms.findPass(fpsVO)) { //findPass의 결과가 false면 맞음, !ms.findPass == true if문 실행
             model.addAttribute("find_pass_info",fpsVO);
             url="forward:/find/modify_pass_form.do";
        }
        
        return url;
    }
    
    @RequestMapping(value="/find/modify_pass_form.do", method = POST)
    public String modifyPassForm() {
        return "find/modify_pass_form";
    }
    
    @RequestMapping(value = "/find/modify_pass_process.do",method = POST)
    public String modifyPass(UpdatePassVO upVO,HttpSession ss,Model model) {
        MemberService ms = new MemberService();
        
        FindPassVO fpsVO=(FindPassVO)ss.getAttribute("find_pass_info");
        upVO.setId(fpsVO.getId());
        
         model.addAttribute("update_flag",ms.modifyPass(upVO));
        
        return "find/modify_result";
    }

    @RequestMapping(value="/mypage/modify_member_info.do", method=GET)
    public String modifyMemberInfo(ModifyMemberVO mmVO, HttpSession session, Model model) {
         
         
         
         
         return "mypage/modify_member_info";
    }//modifyMemberInfo
	
	@RequestMapping(value = "/logout.do")
	public String logout(SessionStatus ss) {
		ss.setComplete();
		return "forward:index.do";
	}
}//class