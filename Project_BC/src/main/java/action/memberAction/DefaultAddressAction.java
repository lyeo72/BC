package action.memberAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.memberSvc.AddressService;
import vo.ActionForward;
import vo.CustomerAddress;

public class DefaultAddressAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String customerId = null;
		HttpSession hs= request.getSession();
		customerId = (String)hs.getAttribute("sId");
		
		CustomerAddress address = (CustomerAddress) request.getAttribute("address");
		
		String roadAddress = address.getRoadAddress();
		String zonecode = address.getZonecode();
		String dtl_addr = address.getDtl_addr();
		int set_default = address.getAddress_priority();
		
		address.setCustomerId(customerId);
		System.out.println(roadAddress+" | "+zonecode+" | "+dtl_addr+" | "+set_default);
		
		AddressService service = new AddressService();
		boolean isChangeSet = service.changeDefault(address);
		
		if(!isChangeSet) {
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
