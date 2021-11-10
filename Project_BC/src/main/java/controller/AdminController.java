package controller;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.*;
import action.dashBoardAction.*;
import action.productAction.BoardListAction;
import action.productAction.BoardWriteProAction;
import vo.*;
@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
//		System.out.println("command : " + command);
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/main.ad")) {			
			action = new DashBoardMainAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}else if(command.equals("/CustomerInfo.ad")) {			
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/SellerInfo.ad")) {			
			forward = new ActionForward();
			forward.setPath("/adminPage/sellerInfo.jsp");
			forward.setRedirect(false); // Dispatcher 방식(기본값이므로 생략 가능)

		}else if(command.equals("/ProductList.ad")) {
            // 글쓰기 작업을 위한 뷰페이지로 포워딩
        	action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/ProductRegister.ad")) {			
				forward = new ActionForward();
				forward.setPath("/adminPage/productRegister.jsp");
				forward.setRedirect(false); // Dispatcher 방식(기본값이므로 생략 가능)
		}else if (command.equals("/ProductWritePro.ad")) {
			action = new BoardWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 위임받은 Exception 예외처리 필요..!
		
			
//			-------------Notice----------------
		}else if(command.equals("/Notice.ad")) {			
			action = new NoticeListAction();
	            
	            try {
	                forward = action.execute(request, response);
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	            
	            
//	     -----------------Chart--------------
		}else if(command.equals("/Chart.ad")) {			
			action = new ChartDataAction();            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
		}
		
            
		}else if(command.equals("/NoticeWrite.ad")) {          
            forward = new ActionForward();
            forward.setPath("/adminPage/NoticeWrite.jsp");
            forward.setRedirect(false); // Dispatcher 방식(기본값이므로 생략 가능)
        }else if(command.equals("/NoticeWritePro.ad")) {
            action = new NoticeWriteProAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(command.equals("/NoticeView.ad")) {
        	action = new NoticeSelectAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		//------------Member권한/탈퇴 -------------------------
		
        else if(command.equals("/MemberStatus.ad")) {
        	action = new MemberStatusAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(command.equals("/MemberLeave.ad")) {
        	action = new MemberLeaveAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		
		
		
		
		
		

		
		
		if(forward != null) {
			if(forward.isRedirect()) { // true = Redirect 
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
