package svc.memberSvc;


import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;


import java.sql.Connection;

import dao.MemberDAO;

public class FindSellerInfoService {

	public String FindSellerEmail(String id) {
		String email = null;
		System.out.println("(셀러)email 찾기 서비스로 옴");
		
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		
		email = dao.findSellerEmail(id);
		
		close(con);
		
		
		return email;
	}




}
