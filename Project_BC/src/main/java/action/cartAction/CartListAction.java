package action.cartAction;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.cartSvc.CartListService;
import svc.memberSvc.AddressService;
import vo.ActionForward;
import vo.BasketBean;
import vo.CustomerAddress;
import vo.ProductImg;

public class CartListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
        System.out.println("CartListAction");
        
        ActionForward forward = null;
        
        // 세션으로 커스터머 아이디 받아오기
        HttpSession session = request.getSession();
        String customer_id = (String)session.getAttribute("sId");  
        
        CartListService cart = new CartListService();
        ArrayList<BasketBean> cartList = cart.getCartList(customer_id);
        
        
        // 장바구니에 있는 제품의 총 가격을 합산할 변수
        int total_amt = 0;
        // 할인된 최종 구매 금액을 합산할 변수
        int discounted_amt = 0;
        
        for(int i = 0; i < cartList.size(); i++) {
        	discounted_amt += (cartList.get(i).getProduct_price() * (100 - cartList.get(i).getProduct_discount())/100) * cartList.get(i).getProduct_qty();
        	total_amt += cartList.get(i).getProduct_price() * cartList.get(i).getProduct_qty();
        }
        
        request.setAttribute("cartList", cartList);
        request.setAttribute("total_amt", total_amt);
        request.setAttribute("discounted_amt", discounted_amt);

        forward = new ActionForward();
        forward.setPath("/cart/cart.jsp");
        forward.setRedirect(false);
        
        return forward;
    }

}
