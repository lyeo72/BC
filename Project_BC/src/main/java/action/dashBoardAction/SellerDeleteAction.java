package action.dashBoardAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.dashBoardSvc.SellerDeleteService;
import vo.ActionForward;

public class SellerDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("del ACtion");
		ActionForward forward = null;
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		System.out.println(product_num+"ss");
		SellerDeleteService service = new SellerDeleteService();
				
		boolean isDeleteSuccess = service.isProductDelete(product_num);
				
		if(!isDeleteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패')");
			out.println("window.history.back();");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setPath("/ProductList.sc");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
