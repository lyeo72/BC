package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.dashBoardAction.*;
import action.mainAction.*;
import vo.ActionForward;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/main")
public class MainController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST 방식 요청에 대한 한글 처리(UTF-8)
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
		System.out.println("command : " + command);
	
		ActionForward forward = null;
		// 각 Action 클래스의 인스턴스를 공통으로 관리하는 Action 타입 변수 선언
		Action action = null;
		
		if(command.equals("/main")) {			
			action = new MainAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(forward != null) {
			// 2. ActionForward 객체 내의 isRedirect 값이 true(= Redirect 방식) 인지 판별
			if(forward.isRedirect()) { // true = Redirect 방식
				// response 객체의 sendRedirect() 메서드를 호출하여 Redirect 방식 포워딩
				// => 파라미터 : ActionForward 객체의 포워딩 경로(path)
				response.sendRedirect(forward.getPath());
			} else { // false = Dispatcher 방식
				// request 객체의 getRequestDispatcher() 메서드를 호출하여 포워딩 경로 설정
				// => 파라미터 : ActionForward 객체의 포워딩 경로(path)
				//    리턴타입 : RequestDispatcher
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				// RequestDispatcher 객체의 forward() 메서드를 호출하여 포워딩 작업 수행
				// => 파라미터 : request, response 객체
				dispatcher.forward(request, response);
			}
		}else {
			
		}
		
		
	
	}
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


}
