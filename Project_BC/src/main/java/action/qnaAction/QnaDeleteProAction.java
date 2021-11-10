package action.qnaAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.qnaSvc.QnaDeleteProService;
import vo.ActionForward;

public class QnaDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("BoardDeleteProAction");
		
		ActionForward forward = null;
		
		// board_num, page, password 가져오기
		int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
		String page = request.getParameter("page");
		
		String qna_password = request.getParameter("qna_password");
		
		// BoardDeleteProService 클래스 인스턴스 생성 후
		// isArticleWrite() 메서드를 호출하여 패스워드 일치 여부 판별(본인 확인)
		// => 파라미터 : 글번호, 패스워드   리턴타입 : boolean(isRightUser)
		QnaDeleteProService service = new QnaDeleteProService();
		boolean isRightUser = service.isArticleWriter(qna_idx, qna_password);
		
		// 만약, 게시물 삭제 권한이 없는 경우(패스워드가 틀린 경우)
		// => 자바스크립트를 통해 "삭제 권한 없음" 출력하고 이전페이지로 돌아가기
		// 아니면 removeArticle() 메서드를 호출하여 글 삭제 작업 요청
		// => 파라미터 : 글번호    리턴타입 : boolean(isDeleteSuccess)
		if(!isRightUser) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 권한 없음')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			boolean isDeleteSuccess = service.removeArticle(qna_idx);
			
			// 삭제 작업 요청 후 결과를 리턴받아 판별 작업 수행
			// => 삭제 실패 시 자바스크립트를 사용하여 "삭제 실패" 출력하고 이전페이지로 돌아가기
			// 아니면, ActionForward 객체를 생성하여 "BoardList.bo" 서블릿 주소 요청
			// => 주소 파라미터 : 현재페이지(page), 포워딩 방식 : Redirect 방식
			if(!isDeleteSuccess) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제 실패')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setPath("QnaList.qa");
				forward.setRedirect(true);
			}
		}
		
		return forward;
	}

}














