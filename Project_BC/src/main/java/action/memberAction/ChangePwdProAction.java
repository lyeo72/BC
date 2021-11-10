package action.memberAction;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.memberSvc.changePwdService;
import vo.ActionForward;

public class ChangePwdProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		String id = request.getParameter("login_id");
		String newPwd = request.getParameter("new_pw");
		
		boolean changeSuccess = false;
		changePwdService service = new changePwdService();
		
		System.out.println(id);
		
		
		changeSuccess = service.changePwd(id,newPwd);
		
		
		if(!changeSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호변경실패!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			HttpSession session = request.getSession();
			session.removeAttribute("fId");
			session.removeAttribute("pId");
			
			forward = new ActionForward();
			forward.setPath("main_fail.jsp");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
