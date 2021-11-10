package svc.memberSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;

public class FindCustomerInfoService {

	public String FindCustomerEmail(String id) {
		String email = null;
		System.out.println("email 찾기 서비스로 옴");
		
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		
		email = dao.findCustomerEmail(id);
		
		close(con);
		
		
		return email;
	}

	public void FindCustomerPwd(String id) {
	
		int updateCount = 0;
		
		
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		
		updateCount = dao.findCustomerPwd(id);
		
		
		if(updateCount > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);

	}

}
