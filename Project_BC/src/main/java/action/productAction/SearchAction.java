package action.productAction;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.productSvc.SearchService;
import vo.ActionForward;
import vo.BoardBean;

public class SearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		String keyword = request.getParameter("search");
		SearchService service = new SearchService();
		ArrayList<BoardBean> searchList = service.isSearch(keyword);
		request.setAttribute("searchList", searchList);
		
		if(searchList.size()==0) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('검색어가 없습니다')");
			out.println("window.history.back();");
			out.println("</script>");
			out.close();
		}else {
			forward = new ActionForward();
			forward.setPath("/side/search.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
