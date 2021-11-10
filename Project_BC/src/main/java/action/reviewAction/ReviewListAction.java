package action.reviewAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.productSvc.BoardListService;
import svc.reviewSvc.ReviewListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;
import vo.ReviewBean;

public class ReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewListAction");
		ActionForward forward = null;
		
		String arrange = request.getParameter("arrange");
		System.out.println("arrange:"+arrange);
		
		
		
		//페이징 처리를 위한 변수 선언
		int page = 1;//현재 체이지 번호를 저장할 변수(기본값1)
		int limit = 5; //한페이지에 표시할 게시물수를 저장할 변수 (최대 10개 설정)
		int product_num = Integer.parseInt(request.getParameter("product_num")); //일단 2로 설정 나중에 변경해야됨	(내가 했어,,,)
		//만약 page파라미터가 존재할 경우 해당
		System.out.println("product_num: "+product_num);
				
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));//정수화 필요
		}
		ReviewListService service = new ReviewListService();
		int listCount = service.getListCount(product_num);
		double totalScore = service.getTotalReviewScore(product_num);
		double avgScore = (double)totalScore / listCount;
		
		ArrayList<ReviewBean> reviewList = service.getReviewList(product_num, page, limit);
		
		// 페이지 계산 작업 수행
		// 1. 전체 페이지 수 계산(총 게시물 수 / 페이지 당 게시물 수 + 0.95 결과를 정수화시킴)
			int maxPage = (int)((double)listCount / limit + 0.95); // 0.95 는 올림처리를 위한 덧셈
				
		// 2. 현재 페이지에서 보여줄 시작 페이지 수(1, 11, 21 페이지 등)
			int startPage = ((int)((double)page / 10 + 0.9) - 1) * 10 + 1;
				
		// 3. 현재 페이지에서 보여줄 마지막 페이지 수(10, 20, 30 페이지 등)
			int endPage = startPage + 10 - 1;
				
		// 4. 마지막 페이지가 현재 페이지에서 표시할 최대 페이지(전체 페이지 수)보다 클 경우
			//    마지막 페이지 번호를 전체 페이지 번호로 대체
			if(endPage > maxPage) {
				endPage = maxPage;
			}
				
				
			// 계산된 페이지 정보를 PageInfo 객체에 저장
			PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
			      
			// request 객체에 PageInfo 객체와 ArrayList<BoardBean> 객체 저장
			// -> setAttribute() 메서드 사용
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("reviewList", reviewList);
		
		double score = 0;
		
		for(int i=0; i< reviewList.size(); i++) {
			
			score += reviewList.get(i).getReview_score();
			
		}
		
//		double avgPercent = Double.parseDouble(String.format("%.1f", avgScore/5*100));
		
		
		
		request.setAttribute("score", score);
		
		request.setAttribute("avgScore", avgScore);
		request.setAttribute("product_num", product_num);
//		request.setAttribute("avgPercent", avgPercent);
		
		//ActionForward객체를 생성하여 board폴더내의 qna_board_list.jsp페이지로 포워딩
		//=>게시물 정보를 request 객체에 담아 전달해야 하므로 request객체가 유지되어야 하며
		//요청받은 URL(BoardList.bo)이 유지되어야 함 (qna_board)lis,jsp 주소숨김)
		
		forward = new ActionForward();
		forward.setPath("/review/productReview.jsp");
		forward.setRedirect(false);
		
		
		
		
		
		return forward;	
			
		
	}

}
