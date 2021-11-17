package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.orderAction.OrderDeleteAction;
import action.orderAction.OrderDetailAction;
import action.orderAction.OrderFormAction;
import action.orderAction.OrderListAction;
import action.orderAction.OrderProAction;
import vo.ActionForward;

@WebServlet("*.or")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/text; charset=utf8");
	
		request.setCharacterEncoding("UTF-8");
			
		String command = request.getServletPath();
		Action action = null;
		ActionForward forward = null;
			
		if(command.equals("/OrderSheet.or")) {			
			action = new OrderFormAction();
		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}                                                                                                                                                     
		}else if(command.equals("/Payment.or")) {
			forward = new ActionForward();
			forward.setPath("/order/payment.jsp");
		
		}else if(command.equals("/orderComplete.or")) {
			action = new OrderListAction();
		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/OrderPro.or")) {			
			action = new OrderProAction();
		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if(command.equals("/OrderDetail.or")) {			
			action = new OrderDetailAction();
	
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if(command.equals("/OrderDelete.or")) {			
			action = new OrderDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			
			
			
		if(forward != null) {
			if(forward.isRedirect()) { // true = Redirect 방식
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
