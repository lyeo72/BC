package svc.productSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.SideDAO;
import vo.BoardBean;

public class SearchService {
	
	public ArrayList<BoardBean> isSearch(String keyword){
		System.out.println(keyword);
		Connection con = getConnection();
		
		SideDAO dao = SideDAO.getInstance();
				
		dao.setConnection(con);
		ArrayList<BoardBean> searchList = dao.selectSearch(keyword);
				
		close(con);		
				
		return searchList;
	}

}
