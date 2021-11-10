package action.dashBoardAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.dashBoardSvc.MemberListService;
import vo.*;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		MemberListService service = new MemberListService();
		ArrayList<CustomerBean> memberList = service.getMemberList();
		
		
		request.setAttribute("memberList", memberList);
		
		forward = new ActionForward();
		forward.setPath("/adminPage/memberList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
