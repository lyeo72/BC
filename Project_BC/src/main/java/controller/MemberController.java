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
import action.memberAction.CustomerJoinProAction;
import vo.ActionForward;

@WebServlet("*.me")
public class MemberController extends HttpServlet {

	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/CustomerJoinForm.me")) {
			forward = new ActionForward();
			forward.setPath("/member/customerjoin.jsp");
			forward.setRedirect(false); 
		}else if(command.equals("/CustomerJoinPro.me")) {
			action = new CustomerJoinProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLoginForm.me")) {
			forward = new ActionForward();
			forward.setPath("/member/login.jsp");
			forward.setRedirect(false); 
		}else if(command.equals("/MemberJoinForm.me")) {
			forward = new ActionForward();
			forward.setPath("/member/JoinForm.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/SellerJoinForm.me")) {
			forward = new ActionForward();
			forward.setPath("/member/sellerJoin.jsp");
			forward.setRedirect(false); 
		}else if(command.equals("/SellerJoinPro.me")) {
			action = new SellerJoinProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLoginPro.me")) {
			action = new MemberLoginProAction();
			try {
				forward = action.execute(request, response);
				forward = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLogout.me")) {
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/SendEmail.me")) {
			action = new SendEmailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/FindIdForm.me")) {
			System.out.println("FineId.me 넘어옴");
			action = new FindIdAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
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
				e.printStackTrace();
			}
		}else if(command.equals("/changePwd.me")) {
			forward = new ActionForward();
			forward.setPath("/member/ChangePwd.jsp");
			forward.setRedirect(false); 
		}else if(command.equals("/ChangePwdPro.me")) {
			action = new ChangePwdProAction();
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




