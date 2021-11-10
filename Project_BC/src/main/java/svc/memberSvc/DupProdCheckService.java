package svc.memberSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BasketDAO;
import vo.BasketBean;

public class DupProdCheckService {
	
	public boolean dupProductCheck(BasketBean basket) {
		System.out.println("DupProdCheckService - dupProductCheck()");
		boolean isDupProduct = false;
		
		Connection con = getConnection();
		
		BasketDAO dao = BasketDAO.getInstance();
		dao.setConnection(con);
		
		int updateCount = dao.checkDupProduct(basket);
		
		if(updateCount > 0) {
			commit(con);
			isDupProduct = true;
		} else {
			rollback(con);
		}
		
		
		close(con);
		
		return isDupProduct;
	}

}
