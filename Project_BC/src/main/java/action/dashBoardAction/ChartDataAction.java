package action.dashBoardAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.dashBoardSvc.ChartDataService;
import vo.ActionForward;
import vo.ChartBean;

public class ChartDataAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;
		
		ChartDataService service = new ChartDataService();
		
		ArrayList<ChartBean> mData =  service.monthData();
		System.out.println("chart ACtion");
//		ArrayList dData = service.dayData();
//		ArrayList categoryData = service.categoryData();
		
		request.setAttribute("mData", mData);	
		
		
		forward = new ActionForward();
		forward.setPath("adminPage/charts.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
