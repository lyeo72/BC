package action.cartAction;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.cartSvc.AddCartService;
import svc.cartSvc.CartListService;
import svc.memberSvc.*;
import vo.ActionForward;
import vo.BasketBean;

public class CartAddAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
        System.out.println("AddCartAction");
        
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
			 BasketBean basket = new BasketBean();
			 
			 // BasketBean 객체에 파라미터 받아서 저장
			 basket.setCutomer_id(customer_id);
			 basket.setProduct_num(Integer.parseInt(request.getParameter("product_num")));
			 basket.setProduct_name(request.getParameter("product_name"));
			 basket.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
			 basket.setProduct_qty(Integer.parseInt(request.getParameter("ord_qty")));
			 basket.setProduct_discount(Integer.parseInt(request.getParameter("product_discount")));
			 basket.setSname(request.getParameter("Sname"));
			 
			 // DupProdCheckService 인스턴스의 DupProdCheck() 메서드를 호출하여 사용자의 장바구니에 해당 상품이 존재하는지 확인
			 // 존재(true)할 경우 수량만 업데이트
			 DupProdCheckService dupProd = new DupProdCheckService();
			 boolean isDupProduct = dupProd.dupProductCheck(basket);
			 
			 // 존재하지 않을 경우 새로 장바구니에 담기
			 boolean isInsertSuccess = false;
			 
			 if(!isDupProduct) {
				 AddCartService addCart = new AddCartService();
				 isInsertSuccess = addCart.AddCart(basket);
				 
				 if(!isInsertSuccess) {
					 out.println("<script>");
			         out.println("alert('장바구니 담기 실패')");
			         out.println("history.back()");
			         out.println("</script>");
				 } else {
					 forward = new ActionForward();
					 forward.setPath("Cart.ca");
					 forward.setRedirect(true);
					 
				 }
			 }
			 
			
		}
        
        return forward;
    }

}
