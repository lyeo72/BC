package action.memberAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.memberSvc.AddressService;
import vo.ActionForward;
import vo.CustomerAddress;

public class AddAddressAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String customerId = null;
		HttpSession hs= request.getSession();
		customerId = (String)hs.getAttribute("sId");
		
		String roadAddress = request.getParameter("roadAddress");
		String zonecode = request.getParameter("zonecode");
		String dtl_addr = request.getParameter("dtl_addr");
		String set_default_str = request.getParameter("set_default");
		System.out.println(set_default_str);
		int set_default = 0;
		if (set_default_str.equals("true")) {
			set_default = 1;
		}else {
			set_default = 0;
		}
		
		
		System.out.println(roadAddress+" | "+zonecode+" | "+dtl_addr+" | "+set_default_str+" | "+set_default);
		
		CustomerAddress ca = new CustomerAddress();
		ca.setCustomerId(customerId);
		ca.setRoadAddress(roadAddress);
		ca.setZonecode(zonecode);
		ca.setDtl_addr(dtl_addr);
		ca.setAddress_priority(set_default);
		
		
		AddressService service = new AddressService();
		boolean isAddressJoin = service.isAddress(ca);
		
		if(!isAddressJoin) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('주소값이 등록되지않았습니다')");
			out.println("window.close()");
			out.println("</script>");
		} else { 
			
		}
		
		
		
		
		
		 forward = new ActionForward();
	        forward.setPath("/myPage/locationList.jsp");
	        forward.setRedirect(false);
		
		return forward;
	}

}
