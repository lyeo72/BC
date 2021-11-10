package svc.cartSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BasketDAO;

public class CartUpdateService {

	// 장바구니에 담긴 제품의 수량을 변경하는 메소드를 호출하는 서비스 메소드
	public boolean cartUpdate(int product_num, int product_qty, String customer_id) {
		System.out.println("CartUpdateService - cartUpdate()");
		boolean isUpdated = false;
		
		Connection con = getConnection();
		
		BasketDAO dao = BasketDAO.getInstance();
		dao.setConnection(con);
		
		int updateCount = dao.updateCart(product_num, product_qty, customer_id);
		
		if(updateCount > 0) {
			commit(con);
			isUpdated = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isUpdated;
	}

}
