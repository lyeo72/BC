package action.qnaAction;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.qnaSvc.QnaWriteProService;
import vo.ActionForward;
import vo.QnaBoardBean;

public class QnaWriteProAction implements Action {
	// BoardFrontContoller 로부터 비즈니스 로직 처리를 위한 요청이 들어오면
	// 비즈니스 로직에 필요한 데이터를 준비하고 요청을 통해 작업을 수행한 후
	// 결과값을 리턴받아 포워딩 작업을 위한 준비 작업 처리
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 포워딩 정보를 관리하는 ActionForward 타입 변수 선언
		ActionForward forward = null;
		
		
		// BoardBean 객체에 전달받은 파라미터 저장
		QnaBoardBean board = new QnaBoardBean();
		board.setQna_idx(Integer.parseInt(request.getParameter("qna_idx")));
		board.setQna_password(request.getParameter("qna_pass"));
		board.setQna_subject(request.getParameter("qna_subject"));
		board.setQna_content(request.getParameter("qna_content"));
		
		
		QnaWriteProService service = new QnaWriteProService();
		
		// 2) BoardWriteProService 인스턴스의 registArticle() 메서드 호출하여 게시물 등록 요청
		//    => 파라미터 : BoardBean 객체, 리턴타입 : boolean(isWriteSuccess)
		boolean isWriteSuccess = service.registArticle(board);
		
		// 글쓰기 결과(isWriteSuccess)를 판별 
		if(!isWriteSuccess) { // 작업 결과가 false 일 경우
			// 1) 실패 시 자바스크립트를 사용하여 "게시물 등록 실패!" 출력 후 이전페이지로 돌아가기
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('게시물 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else { // 작업 결과가 true 일 경우
			// 2) 성공 시 ActionForward 객체를 통해 BoardList.bo 경로, Redirect 방식 포워딩 설정
			// ActionForward 객체를 생성하여 BoardList.bo 서블릿 주소 요청
			// => request 객체 유지 불필요, 주소 유지 불필요
			// => 새로운 요청을 발생시키므로 Redirect 방식 포워딩
			forward = new ActionForward();
			forward.setPath("QnaList.qa");
			forward.setRedirect(true);
		}
		
		// ActionForward 객체 리턴
		return forward;
	}

}

















