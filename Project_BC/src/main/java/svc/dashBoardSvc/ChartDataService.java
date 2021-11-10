package svc.dashBoardSvc;

import static db.JdbcUtil.getConnection;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.ChartDAO;
import vo.ChartBean;

public class ChartDataService {

	public ArrayList<ChartBean> monthData() {
		Connection con = getConnection();
		
		ChartDAO dao = ChartDAO.getInstance();
		
		dao.setConnection(con);
		
		ArrayList<ChartBean> monthChart = dao.selectMonthChart();
		System.out.println("chart svc");
		close(con);
		
		return monthChart;
	}

//	public ArrayList dayData() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	public ArrayList categoryData() {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
	
	
	
	
	

}
