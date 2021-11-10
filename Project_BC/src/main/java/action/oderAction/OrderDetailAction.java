package action.oderAction;

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
import vo.orderDetailBean;
import vo.orderProductBean;

public class OrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderDetailAction!");
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String customer_id = (String)session.getAttribute("sId");  
		
		int order_num = Integer.parseInt(request.getParameter("order_num"));
		System.out.println("앞에서 파라미터로 받아온 오더 넘 "+order_num);
		
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
		
		
		request.setAttribute("orderList", orderList);
		
		
		//----------------------------------------------프로덕트 정보를 가져오는 객체
		ArrayList<orderProductBean> orderProductList = new ArrayList<orderProductBean>();
		orderProductList = orderListService.getOrderProduct(order_num);

		int product_nums[] = new int[orderProductList.size()];
		
		for(int i = 0; i < orderProductList.size(); i++) {
			product_nums[i] = orderProductList.get(i).getProduct_num();
			
		}
		for(int product_num : product_nums) {
			System.out.println("액션에서의 : "+product_num);
			
		}
		
		OrderDetailService orderService = new OrderDetailService();
		
		ArrayList<orderDetailBean> orderDetailList = new ArrayList<orderDetailBean>();
		orderDetailList = orderService.getSelectProduct(product_nums);
		
		for(int i=0; i<orderDetailList.size(); i++) {
			System.out.println(orderDetailList.get(i).getProduct_num());
			System.out.println(orderDetailList.get(i).getProduct_name());
			System.out.println(orderDetailList.get(i).getSname());
			System.out.println(orderDetailList.get(i).getProduct_price());
			System.out.println(orderDetailList.get(i).getProduct_discount());
//			System.out.println(orderDetailList.get(i).getProduct_stock());
			System.out.println(orderDetailList.get(i).getProduct_qty());
			System.out.println(orderDetailList.get(i).getProduct_original_img());
		}
		
		
		request.setAttribute("orderDetailList", orderDetailList);
		

		request.setAttribute("orderProductList", orderProductList);
				
		
		forward = new ActionForward();
		forward.setPath("/order/orderDetail.jsp");
		}
		
		return forward;
	}

}