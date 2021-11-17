package action.orderAction;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.orderSvc.OrderDetailService;
import svc.orderSvc.OrderFormService;
import svc.orderSvc.OrderListService;
import vo.ActionForward;
import vo.BasketBean;
import vo.CustomerInfo;
import vo.OrderBean;
import vo.Productbean;
import vo.OrderDetailBean;
import vo.OrderProductBean;

public class OrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderDetailAction!");
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String customer_id = (String)session.getAttribute("sId");  
		
		int order_num = Integer.parseInt(request.getParameter("order_num"));
		
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
		System.out.println("메모"+orderList.get(0).getShipping_memo());
		
		request.setAttribute("orderList", orderList);
		
		//----------------------------------------------프로덕트 정보를 가져오는 객체
		ArrayList<OrderDetailBean> orderProductList = new ArrayList<OrderDetailBean>();
		orderProductList = orderListService.getOrderProduct(order_num);

		request.setAttribute("orderProductList", orderProductList);
		
		forward = new ActionForward();
		forward.setPath("/order/orderDetail.jsp");
		}
		
		return forward;
	}

}