package action.mainAction;

import java.util.*;

import javax.servlet.http.*;

import action.*;
import svc.productSvc.*;
import svc.reviewSvc.ReviewListService;
import vo.*;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;				
		
		BoardListService service = new BoardListService();
		ReviewListService reviewService = new ReviewListService();
		
		int listCount = service.getListCount();//글갯수 불러옴.			
		
		ArrayList<BoardBean> productList = service.getBoardList();	
		
//		int reviewCount = reviewService.getListCount()
		
		
		request.setAttribute("productList", productList);
	
		
		
		forward = new ActionForward();
		forward.setPath("/main.jsp");
		forward.setRedirect(false);
		
		// ActionForward 객체 리턴
		return forward;
	}

}
