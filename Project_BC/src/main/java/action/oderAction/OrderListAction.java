package action.oderAction;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.orderSvc.OrderFormService;
import svc.orderSvc.OrderListService;
import vo.ActionForward;
import vo.BasketBean;
import vo.CustomerInfo;
import vo.OrderBean;
import vo.orderProductBean;

public class OrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		System.out.println("OrderListAction!");
		ActionForward forward = null;
		HttpSession session = request.getSession();

		int order_num = (int) request.getAttribute("order_num");//넘겨받은 오더넘의 정보를 출력
		String customer_id = (String)session.getAttribute("sId");  
		
//		//주문 금액 할인정보 배송비
//		int total_price = Integer.parseInt(request.getParameter("total_price"));
//		int total_discount = Integer.parseInt(request.getParameter("total_discount"));
//		int shipping_fee = Integer.parseInt(request.getParameter("shipping_fee"));
//				
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(customer_id == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("window.open('MemberLoginForm.me','_blank','height=500,width=500, status=yes,toolbar=no,menubar=no,location=no')");
			
			out.println("</script>");
			
			
		} else {
		
		
		OrderListService orderListService = new OrderListService();
		
		ArrayList<OrderBean> orderList = new ArrayList<OrderBean>();
		orderList = orderListService.getSelectOrder(order_num);
		
		System.out.println(orderList.get(0).getOrder_num());
		System.out.println(orderList.get(0).getCustomer_id());
		System.out.println(orderList.get(0).getOrder_price());
		System.out.println(orderList.get(0).getOrder_price());
		System.out.println(orderList.get(0).getOrder_status());
		System.out.println(orderList.get(0).getPay_method());
		System.out.println(orderList.get(0).getShipping_address());
		System.out.println(orderList.get(0).getShipping_name());
		System.out.println(orderList.get(0).getShipping_memo());
		System.out.println(orderList.get(0).getShipping_phone());
		System.out.println(orderList.get(0).getShipping_zonecode());
		System.out.println(orderList.get(0).getTrans_num());
		System.out.println(orderList.get(0).getOrder_date());
		
		
		
		
		request.setAttribute("orderList", orderList);
		

		
		forward = new ActionForward();
		forward.setPath("/order/orderComplete.jsp");
		
		
		//----------------------------------------------프로덕트 정보를 가져오는 객체
//		ArrayList<orderProductBean> orderProduct = new ArrayList<orderProductBean>();
//		orderProduct = orderListService.getOrderProduct(orderProduct);
//		System.out.println(orderProduct);
//		System.out.println(total_price);
//		System.out.println(total_discount);
//		System.out.println(shipping_fee);
//
//		request.setAttribute("orderProduct", orderProduct);
//		request.setAttribute("total_price", total_price);
//		request.setAttribute("total_discount", total_discount);
//		request.setAttribute("shipping_fee", shipping_fee);
		}
		
		return forward;
	}
		

}
