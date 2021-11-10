package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.*;
import action.dashBoardAction.SellerDeleteAction;
import action.dashBoardAction.sellerDashBoardAction;
import action.productAction.BoardListAction;
import vo.ActionForward;

/**
 * Servlet implementation class SellerController
 */
@WebServlet("*.sc")
public class SellerController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String command = request.getServletPath();
        System.out.println("command : " + command);
        
        Action action = null;
        ActionForward forward = null;
        
        
        if(command.equals("/Seller.sc")) {
//            메인 들어갈떄  갱신될것들 공지 상품 리뷰.
        	
        	action = new sellerDashBoardAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        
        } else if(command.equals("/AddProduct.sc")) {
            // 글쓰기 작업을 위한 뷰페이지로 포워딩
            forward = new ActionForward();        
            forward.setPath("/sellerPage/productRegister.jsp");
            forward.setRedirect(false); // Dispatcher 방식(기본값이므로 생략 가능)
        }else if(command.equals("/ProductList.sc")) {
            // 글쓰기 작업을 위한 뷰페이지로 포워딩
        	action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 위임받은 Exception 예외처리 필요..!

		}else if(command.equals("/Del.sc")) {
			action = new SellerDeleteAction();
			
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
