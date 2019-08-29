package bit.com.a.aop;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.util.StopWatch;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import bit.com.a.model.MemberDto;
@Aspect
public class LogAop {

	@Around("within(bit.com.a.controller.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable {
		
		String signatureStr = joinpoint.getSignature().toShortString();
		
		/*
		try {
			System.out.print("loggerAop: " + signatureStr + "메소드가 실행되었습니다.");
			// 실행 전 처리
		
			
            Object obj = joinpoint.proceed();	//메소드 실행시 실행부
			return obj;       					
		}
		finally {
			// 실행 후 처리			
		}
		*/
		
		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		// request 취득
		HttpServletRequest request
		= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
	
		// response 취득
		HttpServletResponse resp
		= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getResponse();
		
		if(request != null) {	//request에 접근이 가능할 경우
			
			HttpSession session = request.getSession();	//세션 얻어오기
			
			MemberDto dto = (MemberDto)session.getAttribute("login");
			
			if(dto == null) {
				
				resp.setContentType("text/html; charset=utf-8");
				//return "redirect:/logout.do";
				System.out.println("로그인정보없음");			
				
				PrintWriter pw = resp.getWriter();
				pw.print("<script>");
				pw.print("alert('로그인다시하세요');");
				pw.print("location.href='login.do';");
				pw.print("</script>");
				
				// flush 완전중요 완전완전완전중요 보내조야지 완전중요
				pw.flush();
				pw.close();
				
			}
		}
		
		else {
			System.out.println("request == null");			
		}
		
		Object obj = joinpoint.proceed();		
		stopWatch.stop();
		
		System.out.print("loggerAop: " + signatureStr + "메소드가 실행되었습니다. Time: " + stopWatch.getTotalTimeMillis() );
		
		return obj;
	}
	
	// 웹소켓과 AOP가 충돌되면 안된다. 네트워크 통신하는 클래스와 AOP 클래스 같은 패키지 사용하지 않기. 매우 중요!!!

}
