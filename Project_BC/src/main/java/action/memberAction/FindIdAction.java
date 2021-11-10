package action.memberAction;

import java.io.PrintWriter;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;

public class FindIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("setTimeout(function() {");
		out.println("opener.parent.location.replace('FindIdAndPw.me');");
		out.println("self.close();");
		out.println("},1000);");
		out.println("</script>");
		
		
		
		return forward;
	}

}
