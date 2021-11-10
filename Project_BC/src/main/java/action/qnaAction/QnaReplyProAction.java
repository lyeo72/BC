package action.qnaAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.qnaSvc.QnaReplyProService;
import vo.ActionForward;
import vo.QnaBoardBean;

public class QnaReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String page = request.getParameter("page");
		
		// BoardBean 객체에 전달받은 파라미터 저장
		QnaBoardBean board = new QnaBoardBean();
		
		// BoardReplyProService 클래스 인스턴스 생성 후 replyArticle() 메서드 호출
		// => 파라미터 : BoardBean 객체   리턴타입 : boolean(isReplySuccess)
		QnaReplyProService service = new QnaReplyProService();
		boolean isReplySuccess = service.replyArticle(board);
		
		if(!isReplySuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답글 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("QnaList.qa?page=" + page);
			forward.setRedirect(true);
		}
		
		return forward;
	}

}













