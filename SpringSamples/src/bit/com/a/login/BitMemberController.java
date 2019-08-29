package bit.com.a.login;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.a.model.MemberDto;
import bit.com.a.service.BitMemberService;


@Controller
public class BitMemberController {

	private static final Logger logger = LoggerFactory.getLogger(BitMemberController.class);
	
	@Autowired
	private BitMemberService bitMemberService;	
	
	
	// 로그인view로 이동
	@RequestMapping(value="login.do", method=RequestMethod.GET )
	public String login() {	
		logger.info("BitMemberController login() " + new Date());
		/*
		 *쿠키생성
		Cookie setCookie = new Cookie("user_id", id); // 쿠키 이름을 name으로 생성
		setCookie.setMaxAge(60*60*24); // 기간을 하루로 지정
		response.addCookie(setCookie);
		*/
		return "login.tiles";
	}
	
	// 회원가입view 이동
	@RequestMapping(value="regi.do", method=RequestMethod.GET )
	public String regi() {		
		logger.info("BitMemberController regi() " + new Date());
		return "regi.tiles";
	}
	
	// id체크
	@ResponseBody
	@RequestMapping(value="getId.do", method=RequestMethod.POST )
	public String getId(MemberDto mem) {		
		logger.info("BitMemberController getId() " + new Date());
		logger.info("BitMemberController getId() mem" + mem.toString());
		
		
		int count = bitMemberService.getId(mem.getId());
		logger.info("BitMemberController getId() count" + count);
		
		String msg = "";
		if(count > 0) {
			msg = "Yes";
		}else {
			msg = "No";
		}
		return msg;
	}
	
	// 회원가입완료
	@RequestMapping(value = "regiAf.do",  method=RequestMethod.POST )
	public String regiAf(MemberDto mem)throws Exception {		
		logger.info("BitMemberController regiAf() " + new Date());
		boolean b = bitMemberService.addmember(mem);
		
		if(b) {
			return "redirect:/login.do";
		}else {
			return "redirect:/regi.do";
		}
		
	}
	
	// 로그인
	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String loginAf(Model model, MemberDto mem, HttpServletRequest req, HttpSession session) {
		logger.info("BitMemberController loginAf() " + new Date());
		logger.info("(controller loginAf) mem : " + mem.toString() );
		
		
		MemberDto dto = bitMemberService.getMember(mem);
		
		logger.info("(controller loginAf) login dto : " +  dto.toString() );
		
		if( dto != null && !dto.getId().equals("") ) {		
			logger.info("BitMemberController loginAf() SUC! " + new Date());
			// session저장
			req.getSession().setAttribute("login", dto);
			req.getSession().setMaxInactiveInterval(60*60*2);
			return "redirect:/bbslist.do";
		}
		else {
			logger.info("BitMemberController loginAf() Fail.. " + new Date());
			return "redirect:/login.do";
		}		
	}
	
	
}
