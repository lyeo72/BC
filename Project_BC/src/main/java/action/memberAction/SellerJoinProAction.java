package action.memberAction;

import java.io.PrintWriter;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.memberSvc.SellerJoinProService;
import vo.ActionForward;
import vo.SellerBean;

public class SellerJoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SellerJoinProAction 작동");
		ActionForward forward = null;

		
		String id = request.getParameter("member_id");
		String password = request.getParameter("member_pass");
		String name = request.getParameter("member_name"); 
		int grade = Integer.parseInt(request.getParameter("grade"));
		
		
		String seller_id = request.getParameter("member_id");
		int sNo = Integer.parseInt(request.getParameter("member_BRN"));
		String sName = request.getParameter("member_Cname"); 
		String address = request.getParameter("address");
		
		String dtl_addr = request.getParameter("dtl_address");
		
		String phone = request.getParameter("member_phone");
		String email = request.getParameter("email");
	
		System.out.println(dtl_addr);

		String[] adary = address.split(",");
		
		System.out.println(adary[0]);
		System.out.println(adary[1]);
		
		String zoneCode = adary[0];
		String roadAddress = adary[1];
	
		SellerBean sBean = new SellerBean();
		sBean.setId(id);
		sBean.setPassword(password);
		sBean.setName(name);
		sBean.setGrade(grade);
	
		sBean.setSeller_id(seller_id);
		sBean.setsNO(sNo);
		sBean.setsName(sName);
		sBean.setZoneCode(zoneCode);
		sBean.setRoadAddress(roadAddress);
		sBean.setDtl_addr(dtl_addr);
		sBean.setPhone(phone);
		sBean.setEmail(email);
		
	
		SellerJoinProService service = new SellerJoinProService();
		boolean isJoinSuccess = service.joinSeller(sBean);
		
		if(!isJoinSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else { 
			forward = new ActionForward();
			forward.setPath("main_fail.jsp");
			forward.setRedirect(true);
		}
	
				
	
		
		return forward;
	}

	
}
