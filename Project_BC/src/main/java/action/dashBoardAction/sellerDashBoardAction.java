package action.dashBoardAction;

import java.util.*;

import javax.servlet.http.*;

import action.Action;
import svc.*;
import svc.dashBoardSvc.NoticeListService;
import svc.productSvc.BoardListService;
import vo.*;

public class sellerDashBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;

	
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("sId");

		BoardListService service = new BoardListService();
		NoticeListService noticeListService = new NoticeListService();
		int listCount = service.getListCount();// 글갯수 불러옴.
		
		
		
		ArrayList<BoardBean> articleList = service.getArticleList(sId);
		ArrayList<NoticeBean> noticeList = noticeListService.getArticleList();
		// 계산된 페이지 정보를 PageInfo 객체에 저장
		
		
		
		
		
	
		request.setAttribute("articleList", articleList);
		request.setAttribute("noticeList", noticeList);
		
		forward = new ActionForward();
		forward.setPath("/sellerPage/seller_main.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
