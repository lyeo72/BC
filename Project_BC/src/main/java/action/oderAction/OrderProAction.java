package action.oderAction;

import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.orderSvc.OrderProService;
import vo.ActionForward;
import vo.OrderBean;

public class OrderProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderProAction!");
		
		ActionForward forward = null;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		//주문 금액 할인정보 배송비
		int total_price = Integer.parseInt(request.getParameter("total_price"));
//		total_price = new (total_price.getBytes("8859_1"),"UTF-8".toString();
		int total_discount = Integer.parseInt(request.getParameter("total_discount"));
		int shipping_fee = Integer.parseInt(request.getParameter("shipping_fee"));
		
		
		
		String[] nums = request.getParameterValues("num");
		
		String code = request.getParameter("imp_uid");
		System.out.println(code);
		for(String str : nums) {
			System.out.println("orderDetailProAction : "+str);
		}
		
		
		OrderBean order = new OrderBean();
		
		order.setCode(request.getParameter("imp_uid"));
		order.setCustomer_id(request.getParameter("customer_id"));
		order.setShipping_name(request.getParameter("shipping_name"));
		order.setShipping_phone(request.getParameter("shipping_phone"));
		
		order.setShipping_zonecode(request.getParameter("postcode"));
		order.setShipping_address(request.getParameter("shipping_addr"));
		order.setShipping_memo(request.getParameter("shipping_memo"));
		order.setOrder_date(date);
		order.setPay_method(request.getParameter("pay_method"));
		order.setOrder_status("결제완료");
		order.setOrder_price(Integer.parseInt(request.getParameter("paid_amount")));
		order.setTrans_num("운송장 번호");
		
		
		OrderProService orderService = new OrderProService();
		
		
		boolean isInsertSuccecc = orderService.InsertOrder(order, nums);
		
		if(!isInsertSuccecc) {
			out.println("<script>");
			out.println("alert('주문 등록 실패-재고부족')");
			out.println("location.href='Cart.ca'");
			out.println("</script>");



		} else {
			System.out.println("넘어갈 오더넘:"+order.getOrder_num());
			int order_num =order.getOrder_num();
			request.setAttribute("order_num", order_num);
			request.setAttribute("total_price", total_price);
			request.setAttribute("total_discount", total_discount);
			request.setAttribute("shipping_fee", shipping_fee);
			forward = new ActionForward();
			forward.setPath("orderComplete.or");
		}
		
		
		return forward;
	}
	
	
	
		
	

}
