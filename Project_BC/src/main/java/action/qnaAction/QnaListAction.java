package action.qnaAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.productSvc.BoardListService;
import svc.qnaSvc.QnaListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;
import vo.QnaBoardBean;

public class QnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		
		int page = 1; 
		int limit = 10;
		
	
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); 
		}
		
		
		QnaListService service = new QnaListService();
		int listCount = service.getListCount();
		HttpSession session = request.getSession();
		String seller_id = (String)session.getAttribute("sId");
		ArrayList<QnaBoardBean> articleList = service.getArticleList(seller_id);		
	
		int maxPage = (int)((double)listCount / limit + 0.95);				
		int startPage = ((int)((double)page / 10 + 0.9) - 1) * 10 + 1;		
		int endPage = startPage + 10 - 1;	
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 계산된 페이지 정보를 PageInfo 객체에 저장
		PageInfo pageInfo = new PageInfo(0,0,0,0,listCount);
		
		// request 객체에 PageInfo 객체와 ArrayList<BoardBean> 객체 저장
		// => setAttribute() 메서드 사용
//		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		
		// ActionForward 객체를 생성하여 board 폴더내의 qna_board_list.jsp 페이지로 포워딩
		// => 게시물 정보를 request 객체에 담아 전달해야하므로 request 객체가 유지되어야하며
		//    요청받은 URL(BoardList.bo)이 유지되어야 함(qna_board_list.jsp 주소 숨김)
		// => 따라서, Dispatcher 방식 포워딩
		forward = new ActionForward();
		forward.setPath("/qna/qna_board_list.jsp");
		forward.setRedirect(false);
		
		// ActionForward 객체 리턴
		return forward;
	}

}
















