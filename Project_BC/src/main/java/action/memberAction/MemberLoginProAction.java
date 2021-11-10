package action.memberAction;
import java.io.PrintWriter;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.memberSvc.MemberLoginProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginProAction");
		ActionForward forward = null;
		String checkedLoginyn = request.getParameter("cookie_login_yn");
		String cookie_login_id = request.getParameter("cookie_login_id"); /* login.jsp에서 쿠키값이 있으면 쿠키값의 로그인시킬id가 넘어옴 */		
		String login_id = null;
		int grade = 0;			
		boolean isLoginSuccess = false;
		
		if(cookie_login_id != "") {
			isLoginSuccess = true;
			login_id = cookie_login_id;
			
		} else {
			MemberLoginProService service = new MemberLoginProService();
			MemberBean member = new MemberBean();
			member.setId(request.getParameter("login_id"));
			member.setPassword(request.getParameter("login_pass"));	
			grade = service.loginMember(member);
			if(grade>0) {
				isLoginSuccess = true;			
			}
			login_id = member.getId();		
						
			
		}

		if(!isLoginSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else { // 로그인 성공 시 
			// 세션 객체에 로그인 아이디 정보를 저장(속성명 sId)
			// 세션 등급(grade) 정보 저장.
			
			// 1. request 객체로부터 HttpSession 객체 가져오기
			HttpSession session = request.getSession();
			// 2. 세션 객체의 setAttribute() 메서드를 호출하여 세션 정보 저장하기			
			session.setAttribute("sId", login_id);
			session.setAttribute("grade", grade);
		
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("setTimeout(function() {");
			out.println("opener.location.reload();");
			out.println("self.close();");
			out.println("},1000);");
			out.println("</script>");
			
			if(checkedLoginyn != null && checkedLoginyn.equals("Y")) {
				Cookie cookie = new Cookie("login_cookie" , login_id);
				cookie.setPath("/");
				
				long limitTime = 60 * 60*24* 90;
				cookie.setMaxAge((int)limitTime);
				
				response.addCookie(cookie);
			}
			System.out.println("로그인 성공");
			forward = new ActionForward();
			//forward.setPath("./main.jsp");
			//forward.setRedirect(true);
			// Redirect 방식으로 포워딩 할 경우 request 객체는 유지되지 않지만 
			// session 객체는 웹브라우저 종료 시까지 유지되므로 포워딩 방식과 무관함
			
		}
		
		return forward;
		
	}
	

}
