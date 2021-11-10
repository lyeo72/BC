package svc.productSvc;

import static db.JdbcUtil.*;


import java.sql.Connection;
import java.util.ArrayList;

import dao.SideDAO;
import vo.BoardBean;

public class BrandNewService {
	public ArrayList<BoardBean> isBrandNew(){
		
		Connection con = getConnection();
		
		SideDAO dao = SideDAO.getInstance();
	
		dao.setConnection(con);
		
		ArrayList<BoardBean> brandNewList = dao.selectBrandNew();
		
		close(con);
		
		return brandNewList;
		
		
		
	}

}
