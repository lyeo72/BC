package svc.productSvc;

import static db.JdbcUtil.*;


import java.sql.Connection;
import java.util.ArrayList;

import dao.SideDAO;
import vo.BoardBean;

public class SaleService {
	
	public ArrayList<BoardBean> isSale(){
		
		Connection con = getConnection();
		
		SideDAO dao = SideDAO.getInstance();
	
		dao.setConnection(con);
		
		ArrayList<BoardBean> saleList = dao.selectSale();
		
		close(con);
		
		return saleList;
		
	}

}
