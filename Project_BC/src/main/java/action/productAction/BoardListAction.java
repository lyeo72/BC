package action.productAction;

import java.util.ArrayList;

import javax.servlet.http.*;

import action.Action;
import svc.productSvc.BoardListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("BoardListAction");
		
		// 포워딩 정보 관리를 위한 ActionForward 타입 변수 선언
		ActionForward forward = null;		
		HttpSession session = request.getSession();
		String sId = (String) session.getAttribute("sId");
		
		BoardListService service = new BoardListService();
		int listCount = service.getListCount();//글갯수 불러옴.
		
		
		
		ArrayList<BoardBean> articleList = service.getArticleList(sId);		
		
		request.setAttribute("articleList", articleList);
	
		
		
		forward = new ActionForward();
		forward.setPath("/sellerPage/seller_productList.jsp");
		forward.setRedirect(false);
		
		// ActionForward 객체 리턴
		return forward;
	}

}
