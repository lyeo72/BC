package action.reviewAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.reviewSvc.MyReviewService;
import vo.ActionForward;
import vo.PageInfo;
import vo.Productbean;
import vo.ReviewBean;
import vo.orderProductBean;

public class MyYetReviewListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = null;
        
        
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("sId");
        
      
        MyReviewService service = new MyReviewService();
        
        // BoardListService 클래스의 getArticleList() 메서드를 호출하여 전체 게시물 조회 요청
        // => 파라미터 : page, limit   리턴타입 : ArrayList<BoardBean>(articleList)
        ArrayList<Productbean> articleList = service.getOrderProductList(id);
        
        System.out.println(articleList);
        
        request.setAttribute("articleList", articleList);
        
        // ActionForward 객체를 생성하여 board 폴더내의 qna_board_list.jsp 페이지로 포워딩
        // => 게시물 정보를 request 객체에 담아 전달해야하므로 request 객체가 유지되어야하며
        //    요청받은 URL(BoardList.bo)이 유지되어야 함(qna_board_list.jsp 주소 숨김)
        // => 따라서, Dispatcher 방식 포워딩
        forward = new ActionForward();
        forward.setPath("/myPage/myReviewpage1.jsp");
        forward.setRedirect(false);
        
        // ActionForward 객체 리턴
        return forward;
    }

}
