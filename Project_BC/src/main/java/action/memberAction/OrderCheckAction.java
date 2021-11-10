package action.memberAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.MemberDAO;
import svc.memberSvc.AddressService;
import svc.orderSvc.OrderListService;
import vo.ActionForward;
import vo.CustomerAddress;
import vo.OrderBean;
import vo.orderProductBean;

public class OrderCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("OrderCheckAction");
        
        ActionForward forward = null;
        
        HttpSession session = request.getSession();
        String customer_id = (String)session.getAttribute("sId");       
        OrderListService service = new OrderListService();
        ArrayList<OrderBean> orderList = service.getOrderProductList(customer_id);
        String customer_name = service.getCustomerName(customer_id);
        request.setAttribute("orderCusList", orderList);
        request.setAttribute("customer_name", customer_name);
        
        
        forward = new ActionForward();
		forward.setPath("/myPage/orderCheck.jsp");
        forward.setRedirect(false);
        
        return forward;
	}

}
