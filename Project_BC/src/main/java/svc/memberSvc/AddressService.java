package svc.memberSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AddressDAO;
import dao.MemberDAO;
import vo.CustomerAddress;

public class AddressService {

	public boolean isAddress(CustomerAddress add) {
		
		boolean isAddressSuccess = false;
		
		Connection con = getConnection();
		
		AddressDAO dao = AddressDAO.getInstance();
		int insertCount = 0;
	
		dao.setConnection(con);
		insertCount = dao.insertAddress(add);
		
		
		if(insertCount > 0) {
			commit(con);
			isAddressSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return isAddressSuccess;
	}
	
	public ArrayList<CustomerAddress> getAddressList(String id) {
        Connection con = getConnection();
        
        AddressDAO dao = AddressDAO.getInstance();
        
        dao.setConnection(con);
        
        ArrayList<CustomerAddress> addressList = dao.selectAddressList(id);
        close(con);
        
        return addressList;
    }

	public String getCustomerName(String customer_id) {
		 String customer_name = "";
		 
		 Connection con = getConnection();
	        
	        // 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
	     MemberDAO dao = MemberDAO.getInstance();
	        
	        // 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
	     dao.setConnection(con);
		 
	     customer_name = dao.getName(customer_id);
	     
	     close(con);
	     
		return customer_name;
	}

	public boolean changeDefault(CustomerAddress address) {
		boolean isChangeSet = false;
		
		Connection con = getConnection();
		
		AddressDAO dao = AddressDAO.getInstance();
		int updateCount = 0;
	
		dao.setConnection(con);
		updateCount = dao.updateAddress(address);
		
		
		if(updateCount > 0) {
			commit(con);
			isChangeSet = true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return isChangeSet;
	}
	
}
