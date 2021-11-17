package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.cartAction.CartAddAction;
import action.cartAction.CartCountAction;
import action.cartAction.CartDeleteAction;
import action.cartAction.CartListAction;
import action.cartAction.CartUpdateAction;
import action.cartAction.CheckAddressAction;
import vo.ActionForward;


@WebServlet("*.ca")
public class CartController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
		
		ActionForward forward = null;
		Action action = null;
		
			
		if (command.equals("/AddCart.ca")) {
			// 장바구니 추가 
			action = new CartAddAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/Cart.ca")) {
			// 장바구니 리스트 출력
			action = new CartListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/CartDel.ca")) {
			// 장바구니에서 삭제 버튼을 누르면 해당 제품 삭제
			action = new CartDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/CartUpdate.ca")) {
			// 장바구니 제품 수량 업데이트
			action = new CartUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/CheckAddress.ca")) {
			action = new CheckAddressAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/Cartcount.ca")) {
			action = new CartCountAction();
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
