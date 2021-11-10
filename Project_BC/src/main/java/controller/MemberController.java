package controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.memberAction.ChangePwdProAction;
import action.memberAction.FindIdAction;
import action.memberAction.FindIdProAction;
import action.memberAction.FindPwdProAction;
import action.memberAction.MemberLoginProAction;
import action.memberAction.MemberLogoutAction;
import action.memberAction.SellerJoinProAction;
import action.memberAction.SendEmailAction;
import action.memberAction.customerJoinProAction;
import vo.ActionForward;

@WebServlet("*.me")
public class MemberController extends HttpServlet {

	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController");
		// POST 방식 요청에 대한 한글 처리(UTF-8)
		request.setCharacterEncoding("UTF-8");
		
		// 요청 URL 에 대한 작업을 구분하기 위해 서블릿 주소 추출하여 command 변수에 저장
		String command = request.getServletPath();
		System.out.println("command : " + command);
		
		// Action 클래스로부터 리턴받아 포워딩 정보를 관리하는 ActionForward 타입 변수 선언
		ActionForward forward = null;
		// 각 Action 클래스의 인스턴스를 공통으로 관리하는 Action 타입 변수 선언
		Action action = null;
		
		if(command.equals("/CustomerJoinForm.me")) {
			forward = new ActionForward();
			forward.setPath("/member/customerjoin.jsp");
			forward.setRedirect(false); // Dispatcher 방식(기본값이므로 생략 가능)
		}else if(command.equals("/CustomerJoinPro.me")) {
			action = new customerJoinProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLoginForm.me")) {
			forward = new ActionForward();
			forward.setPath("/member/login.jsp");
			forward.setRedirect(false); // Dispatcher 방식(기본값이므로 생략 가능)
		}else if(command.equals("/MemberJoinForm.me")) {
			forward = new ActionForward();
			forward.setPath("/member/JoinForm.jsp");
			forward.setRedirect(false); // Dispatcher 방식(기본값이므로 생략 가능)
		}else if(command.equals("/SellerJoinForm.me")) {
			forward = new ActionForward();
			forward.setPath("/member/sellerJoin.jsp");
			forward.setRedirect(false); // Dispatcher 방식(기본값이므로 생략 가능)
		}else if(command.equals("/SellerJoinPro.me")) {
			action = new SellerJoinProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLoginPro.me")) {
			action = new MemberLoginProAction();
			try {
				forward = action.execute(request, response);
				forward = null;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLogout.me")) {
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/SendEmail.me")) {
			action = new SendEmailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/FindIdForm.me")) {
			System.out.println("FineId.me 넘어옴");
			action = new FindIdAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/FindIdAndPw.me")) {
			forward = new ActionForward();
			forward.setPath("/member/findId.jsp");
			forward.setRedirect(false); // Dispatcher 방식(기본값이므로 생략 가능)
		}else if(command.equals("/FindIdPro.me")) {
			action = new FindIdProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/FindPwdPro.me")) {
			action = new FindPwdProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/changePwd.me")) {
			forward = new ActionForward();
			forward.setPath("/member/ChangePwd.jsp");
			forward.setRedirect(false); // Dispatcher 방식(기본값이므로 생략 가능)
		}else if(command.equals("/ChangePwdPro.me")) {
			action = new ChangePwdProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
//	}
		
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
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		
	
	}

	
}




