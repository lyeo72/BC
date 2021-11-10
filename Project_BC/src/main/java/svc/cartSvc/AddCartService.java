package svc.cartSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BasketDAO;
import vo.BasketBean;


public class AddCartService {
	
	public boolean AddCart(BasketBean basket) {
		System.out.println("AddCartService - AddCart()");
		boolean isInsertSuccess = false;
		
		Connection con = getConnection();
		
		BasketDAO dao = BasketDAO.getInstance();
		dao.setConnection(con);
		
		// BasketDAO 객체의 insertBasket() 메소드를 호출하여 장바구니 테이블에 추가 작업 수행
		int insertCount = dao.insertBasket(basket);
		
		if(insertCount > 0) {
			commit(con);
			isInsertSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isInsertSuccess;
	}

	

}
