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
		SaleService sale = new SaleService();
		BrandNewService newList = new BrandNewService();
		
		
		int listCount = service.getListCount();//글갯수 불러옴.			
		
		ArrayList<BoardBean> productList = service.getBoardList();	
		ArrayList<BoardBean> saleList = sale.isSale();
		ArrayList<BoardBean> brandNewList = newList.isBrandNew();

		
		request.setAttribute("productList", productList);
		request.setAttribute("saleList", saleList);
		request.setAttribute("brandNewList", brandNewList);
	
		
		
		forward = new ActionForward();
		forward.setPath("/main.jsp");
		forward.setRedirect(false);
		
		// ActionForward 객체 리턴
		return forward;
	}

}
