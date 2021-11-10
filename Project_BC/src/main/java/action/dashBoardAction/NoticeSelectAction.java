package action.dashBoardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import action.Action;
import svc.dashBoardSvc.NoticeSelectService;
import vo.ActionForward;
import vo.NoticeBean;

public class NoticeSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		NoticeSelectService service = new NoticeSelectService();
		NoticeBean article = service.getArticle(notice_num);
		
		request.setAttribute("article", article);
		
		forward = new ActionForward();
		forward.setPath("/adminPage/NoticeView.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
