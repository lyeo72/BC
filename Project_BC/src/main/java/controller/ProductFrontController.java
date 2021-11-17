package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.productAction.ProductDetailAction;
import vo.ActionForward;


@WebServlet("*.do")
public class ProductFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
		
		ActionForward forward = null;
		Action action = null;
		
					
		if(command.equals("/BoardWriteForm.do")) {
	            forward = new ActionForward();
	            forward.setPath("/sellerPage/productRegister.jsp");
	            forward.setRedirect(false); 
	    } else if(command.equals("/Product.do")) {
			action = new ProductDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }

		
		if(forward != null) {
			if(forward.isRedirect()) { // true = Redirect 방식
				response.sendRedirect(forward.getPath());
			} else { // false = Dispatcher 방식
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
