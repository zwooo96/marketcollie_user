package kr.co.collie.user.member.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.member.service.MemberService;
import kr.co.collie.user.member.vo.FindIdVO;
import kr.co.collie.user.member.vo.FindPassVO;
import kr.co.collie.user.member.vo.JoinVO;
import kr.co.collie.user.member.vo.LoginVO;
import kr.co.collie.user.member.vo.UpdatePassVO;

@SessionAttributes({"user_info","find_pass_info"})
@Controller
public class MemberController {

	
	/**
	 * 회원가입 버튼 클릭시 회원 가입 약관 form으로 이동
	 * @return 회원 가입 약관 form으로 이동
	 */
	@RequestMapping(value="/join_clause.do", method = GET)
    public String joinClause() {
        return "member/join_clause";
    }//joinForm
    
	
    /**
     * 회원가입 약관 동의 후 회원가입 form으로 이동
     * @return 회원가입 form으로 이동
     */
    @RequestMapping(value="/join_form.do", method = GET)
    public String joinForm() {
        return "member/join_frm";
    }//joinForm
    

    /**
     * 회원가입 진행
     * @param jVO 회원 가입 정보 VO
     * @param request 회원의 ip 정보를 가질 {@link HttpServletRequest}
     * @return 회원가입 완료 페이지
     */
    @RequestMapping(value="/join_process.do", method= POST)
    public String join(JoinVO jVO, HttpServletRequest request) {
        MemberService ms = new MemberService();
        
        jVO.setEmail(request.getParameter("email")+"@"+request.getParameter("email2"));
        jVO.setPhone(request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3"));
        jVO.setIp(request.getRemoteAddr());
        
        ms.join(jVO);
        
        return "member/join";
    }//join
    
    
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
             url = "member/login_form";
             model.addAttribute("login_flag","fail");
        } else {
             url = "redirect:index.do";
             model.addAttribute("user_info",loginDomain);
        }
        return url;
        
    }//login
	

	@RequestMapping(value = "/logout.do")
	public String logout(SessionStatus ss) {
		ss.setComplete();
		return "redirect:index.do";
	}
    
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
        
        return "find/idForm";
    }
    
    @RequestMapping(value = "/find/find_id_process.do",method = POST)
    public String findId(FindIdVO fidVO,Model model) {
    	String url ="find/idForm";
        MemberService ms = new MemberService();
        boolean findId = false;
        String findIdStr = ms.findId(fidVO); 
        if(findIdStr != null) {
        	findId = true;
        	model.addAttribute("user_id",findIdStr);
        	url ="find/id";
        }
        
        model.addAttribute("find_id",findId);
        return url;
    }
    
    @RequestMapping(value = "/find/passForm.do",method = {GET, POST})
    public String findPassForm() {
        return "find/passForm";
    }
    
    @RequestMapping(value = "/find/find_pass_process.do",method = POST )
    public String findPass(FindPassVO fpsVO,Model model) {
    	
        String url="forward:/find/passForm.do";
        
        MemberService ms = new MemberService();
        boolean findPass = false;
        if(ms.findPass(fpsVO)) {
        	findPass = true;
            model.addAttribute("find_pass_info",fpsVO);
            url="forward:/find/modify_pass_form.do";
        }
        model.addAttribute("find_pass", findPass);
        
        return url;
    }
    
    @RequestMapping(value="/find/modify_pass_form.do", method = POST)
    public String modifyPassForm() {
        return "find/modify_pass_form";
    }
    
    @RequestMapping(value = "/find/modify_pass_process.do", method = POST)
    public String modifyPass(UpdatePassVO upVO, HttpSession ss, Model model) {
        MemberService ms = new MemberService();
        FindPassVO fpsVO=(FindPassVO)ss.getAttribute("find_pass_info");
        
        if(fpsVO !=null) {
        	upVO.setId(fpsVO.getId());
        	model.addAttribute("update_flag",ms.modifyPass(upVO));
        }
        
        return "find/modify_result";
    }
}//class