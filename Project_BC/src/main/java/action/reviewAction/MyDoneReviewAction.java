package action.reviewAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.reviewSvc.MyReviewService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ReviewBean;

public class MyDoneReviewAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = null;

        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("sId");
        
        MyReviewService service = new MyReviewService();
        
        ArrayList<ReviewBean> reviewList = service.getArticleList(id);
        
        request.setAttribute("reviewList", reviewList);
        
        forward = new ActionForward();
        forward.setPath("/myPage/myReviewpage2.jsp");
        forward.setRedirect(false);
        
        return forward;
    }

}
