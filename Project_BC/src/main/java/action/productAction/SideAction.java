package action.productAction;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.productSvc.SideService;
import vo.ActionForward;
import vo.BoardBean;
import vo.Productbean;

public class SideAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String category = request.getParameter("category");		
		SideService service = new SideService();
		ArrayList<BoardBean> sideList = service.isSide(category);
		
		
		
		request.setAttribute("sideList", sideList);
		
		
		
		
		if(sideList.size()==0) {
			// html로 목록 없음 출력
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('목록이 없습니다')");
			out.println("window.history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("/side/sideDish.jsp");
			forward.setRedirect(false); // Dispatcher 방식(기본값이므로 생략 가능)
		}
		
		return forward;
	}

}
