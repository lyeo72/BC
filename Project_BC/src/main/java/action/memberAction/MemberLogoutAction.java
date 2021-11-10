package action.memberAction;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import vo.ActionForward;

public class MemberLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		
		// 세션 객체 가져와서 초기화
		HttpSession session = request.getSession();
		session.removeAttribute("sId");

		Cookie[] cookie = request.getCookies();
		
		if(cookie != null){
			for(Cookie tempCookie : cookie){
				if(tempCookie.getName().equals("login_cookie")){
					tempCookie.setMaxAge(0);
					tempCookie.setPath("/");
					response.addCookie(tempCookie);
				
				}
			}
		}

		
		forward = new ActionForward();
		forward.setPath("./main");
		forward.setRedirect(true);
		
		
		
		
		return forward;
	}

}
