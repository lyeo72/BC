package action.cartAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.cartSvc.CartListService;
import vo.ActionForward;

public class CheckAddressAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CheckAddressAction");
		ActionForward forward = null;
		
		// 세션으로 커스터머 아이디 받아오기
        HttpSession session = request.getSession();
        String customer_id = (String)session.getAttribute("sId"); 
        String[] nums = request.getParameterValues("cart_checkbox");
        int total_amt = Integer.parseInt(request.getParameter("total_amt"));
        
        // 넘겨받은 프로덕트넘을 오더시트로 넘겨주기 위해 프로덕트 넘을 하나의 문자열로 결합하여 저장할 변수
        String product_num = "";
        
        // 넘겨받은 프로덕트넘을 구분자를 포함하여 하나의 문자열로 결합
        for(String num : nums) {
        	System.out.println(num);
        	product_num += num + "/";
        }
        
        CartListService cart = new CartListService();
        
        // 배송지가 입력됐는지 여부를 판단하기 위해 getAddressList() 메소드 호출
        boolean hasAddress = cart.getAddressInfo(customer_id);
        
        System.out.println(product_num);
        request.setAttribute("product_num", product_num);
        
        response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
        
		// 구매 금액이 10000원 이상인지 판별
		if(total_amt < 10000) {
			
			out.println("<script>");
			out.println("alert('10,000원 이상부터 주문이 가능합니다.')");
			out.println("history.back()");
			out.println("</script>");
			
		} else {
			
			// 배송지가 입력된 회원인지 판별 후 입력되지 않았을 경우 배송지 입력 페이지로 포워딩
			if(!hasAddress) {
				out.println("<script>");
				out.println("alert('배송지 입력이 필요합니다.')");
				out.println("location.href='" + request.getContextPath() + "/DeliveryLocation.my'");
				out.println("</script>");
			} else {
				// 배송지가 입력된 회원일 경우 결제 폼으로 포워딩
				forward = new ActionForward();
				forward.setPath("OrderSheet.or?product_num=" + product_num);
				forward.setRedirect(true);
				
			}
		}

		
		return forward;
	}

}
