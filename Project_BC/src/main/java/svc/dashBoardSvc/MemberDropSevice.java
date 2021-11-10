package svc.dashBoardSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.*;

import dao.*;

public class MemberDropSevice {

	public boolean dropMemeber(String id) {
		
		boolean idDropMember =false;
		int dropCount = 0;
		
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.setConnection(con);
		
		dropCount = dao.isDropMember(id);
	
		if(dropCount>0) {
			commit(con);
			idDropMember=true;
		}else {
			rollback(con);
		}
		
		
		close(con);
	
		return idDropMember;
	}
	
	

}
