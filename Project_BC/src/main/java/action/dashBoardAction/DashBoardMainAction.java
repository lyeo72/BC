package action.dashBoardAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.dashBoardSvc.*;
import vo.*;

public class DashBoardMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		
		NoticeListService notice = new NoticeListService();
		MemberListService member = new MemberListService();
		
		ArrayList<NoticeBean> noticeList =  notice.getArticleList();
		ArrayList<CustomerBean> memberList = member.getMemberList();
		
		
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("memberList", memberList);
		
		forward = new ActionForward();
		forward.setPath("adminPage/admin_main.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

}
