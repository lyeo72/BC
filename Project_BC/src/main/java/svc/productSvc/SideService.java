package svc.productSvc;

import static db.JdbcUtil.*;


import java.sql.Connection;
import java.util.ArrayList;

import dao.SideDAO;
import vo.BoardBean;


public class SideService {
	
public ArrayList<BoardBean> isSide(String category) {
				
		Connection con = getConnection();
		
		SideDAO dao = SideDAO.getInstance();
	
		dao.setConnection(con);
		
		ArrayList<BoardBean> sideList = dao.selectCategory(category);
		
		close(con);
		
		return sideList;
	}

}
