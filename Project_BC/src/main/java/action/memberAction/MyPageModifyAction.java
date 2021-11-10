package action.memberAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.memberSvc.MypageModifyService;
import vo.ActionForward;
import vo.CustomerBean;
import vo.CustomerInfo;
import vo.MemberBean;

public class MyPageModifyAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("MyPageModifyAction");
        ActionForward forward = null;
        
        //
        MemberBean member = new MemberBean();
      
        HttpSession session = request.getSession();
        String customer_id = (String)session.getAttribute("sId");
        
        String password = request.getParameter("password");
        
        
        member.setId(customer_id);
        member.setPassword(password);
        
        
       MypageModifyService service = new MypageModifyService();
       boolean isLoginSuccess = service.passwordCheck(member);
       
       CustomerBean customerInfo = service.customerInfo(member);
       request.setAttribute("customerInfo", customerInfo);
       System.out.println(customerInfo);
    System.out.println(isLoginSuccess);
    
 
       if(!isLoginSuccess) {
           response.setContentType("text/html; charset=UTF-8");
           PrintWriter out = response.getWriter();
           out.println("<script>");
           out.println("alert('패스워드가 틀립니다.')");
           out.println("history.back()");
           out.println("</script>");
       }else {
           request.setAttribute("customerInfo",customerInfo );
           forward = new ActionForward();
           forward.setPath("/myPage/myPage2.jsp");
           forward.setRedirect(false);
       }
       
       return forward;
   }
       
    }
        
        
