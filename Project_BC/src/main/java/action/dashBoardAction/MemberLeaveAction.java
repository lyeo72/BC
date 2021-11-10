package action.dashBoardAction;

import java.io.*;

import javax.servlet.http.*;

import action.*;
import svc.dashBoardSvc.*;
import vo.*;

public class MemberLeaveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		String id = request.getParameter("id");
		
		
		MemberDropSevice service =new MemberDropSevice();
		
		boolean isDrop = service.dropMemeber(id);
		
		
		if(!isDrop) { 
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('회원탈퇴')");
            out.println("history.back()");
            out.println("</script>");
        } else { 
            forward = new ActionForward();
            forward.setPath("CustomerInfo.ad");
            forward.setRedirect(false);
        }
		
		return forward;
	}

}
