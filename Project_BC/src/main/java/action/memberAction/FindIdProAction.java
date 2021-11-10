package action.memberAction;
import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.memberSvc.FindIdProService;
import vo.ActionForward;
import vo.MemberBean;

public class FindIdProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String id = null;
		
		String name = request.getParameter("id_name");
		String email = request.getParameter("id_email");
		
		MemberBean member = new MemberBean();
		
		FindIdProService service = new FindIdProService();
		int findGrade = service.FindGrade(name);
		
		System.out.println(findGrade);
		
		
		
		if(findGrade == 3) {
			id = service.findCustomerId(name,email);
			System.out.println("아이디찾기 service1로 이동함");
			HttpSession session = request.getSession();
			session.setAttribute("fId", id);
		}
		if(findGrade == 2) {
			id = service.findSellerId(name,email);
			System.out.println("아이디찾기 service2로 이동함");
			HttpSession session = request.getSession();
			session.setAttribute("fId", id);
		}
		
		return forward;
		
	}

}
