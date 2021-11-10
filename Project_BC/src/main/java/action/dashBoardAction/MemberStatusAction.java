package action.dashBoardAction;

import java.io.*;

import javax.servlet.http.*;

import action.*;
import svc.dashBoardSvc.*;
import vo.*;

public class MemberStatusAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		String id = request.getParameter("id");
		int grade = Integer.parseInt(request.getParameter("grade"));
//		CustomerBean member = new CustomerBean();
		
		MemberStatusUpdateService service = new MemberStatusUpdateService();
		boolean isUpdate = service.MemberStatusUpdate(id,grade);
//		System.out.println(isUpdate);
//		System.out.println(id);
		
		
		
		  if(!isUpdate) { 
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('status 변경 실패..!')");
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
