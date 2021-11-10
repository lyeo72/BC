package svc.cartSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BasketDAO;

public class CartDeleteService {
	
	public boolean cartDelete(String[] nums, String customer_id) {
		System.out.println("CartDeleteService - cartDelete()");
		boolean isDeleted = false;
		
		Connection con = getConnection();
		
		BasketDAO dao = BasketDAO.getInstance();
		dao.setConnection(con);
		
		int deleteCount = 0;
		
		// nums 배열에 저장된 개수만큼 삭제작업 반복.
		for(String i : nums) {		
			deleteCount += dao.deleteCart(Integer.parseInt(i), customer_id);
		}
		
		if(deleteCount > 0) {
			commit(con);
			isDeleted = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isDeleted;
	}
	

}
