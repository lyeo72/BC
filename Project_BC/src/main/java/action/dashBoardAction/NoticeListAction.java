package action.dashBoardAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.dashBoardSvc.NoticeListService;
import vo.ActionForward;
import vo.NoticeBean;

public class NoticeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		NoticeListService service = new NoticeListService();
		
		ArrayList<NoticeBean> articleList = service.getArticleList();
		
		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("/adminPage/Notice.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
