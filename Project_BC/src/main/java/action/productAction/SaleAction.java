package action.productAction;

import java.io.PrintWriter;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.productSvc.SaleService;
import vo.ActionForward;
import vo.BoardBean;

public class SaleAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		ActionForward forward = null;
		
		String category = request.getParameter("category");
		
		SaleService service = new SaleService();
		ArrayList<BoardBean> saleList = service.isSale(category);
		
		request.setAttribute("saleList", saleList);
		
		if(saleList.size()==0) {
			// html로 목록 없음 출력
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('목록이 없습니다')");
			out.println("window.history.back();");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setPath("/side/sale.jsp");
			forward.setRedirect(false);
		}
		
	
	
		return forward;
	}

}
