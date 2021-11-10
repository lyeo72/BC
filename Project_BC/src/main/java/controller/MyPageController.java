package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.memberAction.AddAddressAction;
import action.memberAction.DefaultAddressAction;
import action.memberAction.MyPageModifyAction;
import action.memberAction.MypageModifyProAction;
import action.memberAction.OrderCheckAction;
import action.memberAction.ShowAddressAction;
import vo.ActionForward;


@WebServlet("*.my")
public class MyPageController extends HttpServlet {
       
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MyPageController");
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		System.out.println("command : " + command);
		
		ActionForward forward = null;
		Action action = null;
		
		HttpSession session = request.getSession();
		int grade;
		if (session.getAttribute("grade")!=null) {
			grade = (int)session.getAttribute("grade");
		}else {
			grade = 3;
		}
		System.out.println(grade);
		if (grade!=3) {	
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 접근입니다')");
			out.println("location.href='./'");
			out.println("</script>");
			
		}else {
			
			if(command.equals("/DeliveryLocation.my")) {
				action = new ShowAddressAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/Resell.my")) {
				forward = new ActionForward();
				forward.setPath("/myPage/resell.jsp");
			}else if(command.equals("/OrderCheck.my")) {
				action = new OrderCheckAction();
                try {
                    forward = action.execute(request, response);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
			}else if(command.equals("/Mypage.my")) {
			    forward = new ActionForward();
                forward.setPath("/myPage/myPage.jsp");
			}else if(command.equals("/Mypage2.my")) {
			    action = new MyPageModifyAction();
                try {
                    forward = action.execute(request, response);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
			}else if(command.equals("/Mypage3.my")) {
                action = new MypageModifyProAction();
                try {
                    forward = action.execute(request, response);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }else if(command.equals("/QnA.my")) {
				forward = new ActionForward();
				forward.setPath("/myPage/qNa.jsp");
			}else if(command.equals("/Delete.my")) {
				action = new DeleteMemberAction();
                try {
                    forward = action.execute(request, response);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
				
			}else if(command.equals("/Review.my")) {
				forward = new ActionForward();
				forward.setPath("/myPage/myReview.jsp");
			}else if(command.equals("/Review1.my")) {
				forward = new ActionForward();
				forward.setPath("/review/myReviewpage1.jsp");
			}else if(command.equals("/Review2.my")) {
				forward = new ActionForward();
				forward.setPath("/review/myReviewpage2.jsp");
			}else if(command.equals("/myPage/AddAddress.my")) {
				action = new AddAddressAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/Default.my")) {
				action = new DefaultAddressAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	    
		}
		    if(forward != null) {
				if(forward.isRedirect()) { 
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