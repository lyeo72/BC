package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.memberSvc.MemberDeleteService;
import vo.ActionForward;

public class DeleteMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DeleteMemberAction");
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sId");
		String pwd = request.getParameter("m_pw");
		
		boolean isMemberDelete = false;
		
		MemberDeleteService service = new MemberDeleteService();
		service.deleteMember(id, pwd);
		forward = new ActionForward();
		forward.setPath("/myPage/deleteMydata.jsp");
		return forward;
	}

}
