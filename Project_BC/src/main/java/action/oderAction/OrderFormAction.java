package action.oderAction;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.orderSvc.OrderFormService;
import vo.ActionForward;
import vo.BasketBean;
import vo.CustomerAddress;
import vo.CustomerBean;
import vo.CustomerInfo;
import vo.MemberBean;


public class OrderFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderFormAction!");
		ActionForward forward = null;
		HttpSession session = request.getSession();

		String customer_id = (String)session.getAttribute("sId");  
		
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(customer_id == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("window.open('MemberLoginForm.me','_blank','height=500,width=500, status=yes,toolbar=no,menubar=no,location=no')");
			
			out.println("</script>");
			
			
		} else {
			
		String product_qty = null;
		product_qty = request.getParameter("product_qty");
		String product_num = request.getParameter("product_num");
		product_num= product_num.substring(0, product_num.lastIndexOf("/"));
		String[] nums = product_num.split("/");
		
		
		for(String num : nums) {
			System.out.println("액션에서의 : "+num);
			System.out.println(num);
		}
		
		
		OrderFormService orderService = new OrderFormService();
		ArrayList<BasketBean> cartList;
		if(product_qty==null) {
			
			cartList = new ArrayList<BasketBean>();
			cartList = orderService.getSelectCart(nums);
		
		}else{
			
			cartList = new ArrayList<BasketBean>();
			cartList = orderService.getSelectCart(nums, product_qty, customer_id);
			
		}
		
		request.setAttribute("cartList", cartList);
		

		
		forward = new ActionForward();
		forward.setPath("/order/orderSheet.jsp");
		
		ArrayList<CustomerInfo> customerInfo = new ArrayList<CustomerInfo>();
		customerInfo = orderService.getCustomerInfo(customer_id);
		
		for(int i = 0 ; i <customerInfo.size() ; i++) {
			System.out.println("커스터머 이메일 : "+customerInfo.get(i).getEmail());
			System.out.println("커스터머 네임 : "+customerInfo.get(i).getName());
			System.out.println("커스터머 폰 : "+customerInfo.get(i).getPhone());
			System.out.println("도로명 : "+customerInfo.get(i).getRoadAddress());
			System.out.println("우편번호 : "+customerInfo.get(i).getZonecode());
			System.out.println("상세주소 : "+customerInfo.get(i).getDtl_addr());
		}


		request.setAttribute("customerInfo", customerInfo);
		
		}
		
		return forward;
	}


}