package action.cartAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.cartSvc.CartListService;
import vo.ActionForward;

public class CartCountAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("CartCountAction");
		ActionForward forward = null;
		HttpSession session = request.getSession();
        String customer_id = (String)session.getAttribute("sId");
//        System.out.println("id = "+customer_id);
        CartListService cart = new CartListService();
        
        int CartCount = cart.getCartCount(customer_id); 
        session.setAttribute("CartCount", CartCount);
        
         forward = new ActionForward();
		 forward.setPath("inc/count.jsp");
		 forward.setRedirect(true);

		
		return forward;
	}

}
