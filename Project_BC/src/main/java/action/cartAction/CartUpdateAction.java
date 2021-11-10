package action.cartAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.cartSvc.CartUpdateService;
import vo.ActionForward;

public class CartUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CartUpdateAction");
		ActionForward forward = null;
		
		// 세션으로 커스터머 아이디 받아오기
        HttpSession session = request.getSession();
        String customer_id = (String)session.getAttribute("sId"); 
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(customer_id == null) {
			// 사용자가 로그인하지 않았을 경우
			out.println("<script>");
	        out.println("alert('로그인이 필요합니다.')");
	        out.println("window.open('MemberLoginForm.me','_blank','height=500,width=500, status=yes,toolbar=no,menubar=no,location=no')");
	        out.println("</script>");
		} else {
			// 로그인 했을 경우 업데이트 작업 진행 
			int product_num = Integer.parseInt(request.getParameter("product_num"));
			int product_qty = Integer.parseInt(request.getParameter("qty"));
			
			System.out.println("customer_id : " + customer_id);
			System.out.println("product_num : " + product_num);
			System.out.println("product_qty : " + product_qty);
			
			CartUpdateService update = new CartUpdateService();
			boolean isUpdated = update.cartUpdate(product_num, product_qty, customer_id);
			
			if(!isUpdated) { // 수량 업데이트가 실패할 경우
				out.println("<script>");
				out.println("alert('수량 업데이트 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else { // 성공했을 경우 장바구니 페이지로 이동
				forward = new ActionForward();
				forward.setPath("Cart.ca");
				forward.setRedirect(true);
			}
			
		}
		
		return forward;
	}

}
