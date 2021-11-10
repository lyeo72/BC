package svc.cartSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AddressDAO;
import dao.BasketDAO;
import dao.BoardDAO;
import vo.BasketBean;
import vo.CustomerAddress;
import vo.ProductImg;

public class CartListService {

	public ArrayList<BasketBean> getCartList(String customer_id) {
		
		Connection con = getConnection();
		
		BasketDAO dao = BasketDAO.getInstance();
		dao.setConnection(con);
		
		// 장바구니 목록 조회를 수행하는 getCartList() 메소드 호출
		ArrayList<BasketBean> cartList = null;
		cartList = dao.selectCartList(customer_id);
		
		close(con);
		
		return cartList;
	}

	// 주문하려는 회원이 입력된 배송지를 가지고 있는지 판별하는 메소드
	public boolean getAddressInfo(String customer_id) {
		boolean hasAddress = false;
		
		Connection con = getConnection();
        
        AddressDAO dao = AddressDAO.getInstance();
        
        dao.setConnection(con);
        
        ArrayList<CustomerAddress> addressList = dao.selectAddressList(customer_id);
        
        System.out.println(addressList.size());
        
        // 주소지를 조회하여 데이터를 담은 어레이리스트의 사이즈가 0보다 클 경우 배송지가 있는 회원이므로 hasAddress를 true로 변경
        if(addressList.size() > 0) {
        	hasAddress = true;
        }
        
        close(con);
		
		
		return hasAddress;
	}

	public int getCartCount(String customer_id) {
		int count =0;
		Connection con = getConnection();
		BasketDAO dao = BasketDAO.getInstance();
		dao.setConnection(con);		
		
		
		count = dao.CartCount(customer_id);
		
		close(con);
		
		
		return count;
	}


}
