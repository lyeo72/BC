package action.memberAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.memberSvc.MypageModifyProService;
import vo.ActionForward;
import vo.CustomerBean;

public class MypageModifyProAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      System.out.println("BoardModifyProAction");
        ActionForward forward = null;
        
        // 파라미터로 전달받은 데이터 가져오기//
        
        HttpSession session = request.getSession();
        
        session.getAttribute("sId");
        
        CustomerBean customer = new CustomerBean();
        
        String id =   (String) session.getAttribute("sId");
        String name = request.getParameter("mbr_nm");
        String passwd = request.getParameter("pwd");System.out.println(passwd);
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        
        customer.setId(id);
        customer.setName(name);
        customer.setPassword(passwd);
        customer.setPhone(phone);
        customer.setEmail(email);
        
      
        // BoardModifyProService 클래스 인스턴스 생성 후
        // isArticleWrite() 메서드를 호출하여 패스워드 일치 여부 판별(본인 확인)
        // => 파라미터 : 글번호, 패스워드   리턴타입 : boolean(isRightUser)
        MypageModifyProService service = new MypageModifyProService();
        boolean isModifySuccess = service.updateMember(customer);
            // 수정 작업 요청 후 결과를 리턴받아 판별 작업 수행
            // => 삭제 실패 시 자바스크립트를 사용하여 "수정 실패" 출력하고 이전페이지로 돌아가기
            // 아니면, ActionForward 객체를 생성하여 "BoardDetail.bo" 서블릿 주소 요청
            // => 주소 파라미터 : 글번호(board_num), 현재페이지(page), 포워딩 방식 : Redirect 방식
            if(!isModifySuccess) {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('수정 실패')");
                out.println("history.back()");
                out.println("</script>");
            } else {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert(' 회원정보수정완료')");
                out.println("</script>");
                forward = new ActionForward();
                forward.setPath("./");
                forward.setRedirect(true);
            }

        
        return forward;
    }

}





