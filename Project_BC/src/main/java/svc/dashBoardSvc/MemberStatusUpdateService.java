package svc.dashBoardSvc;

import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.*;

import java.sql.*;

import dao.*;

public class MemberStatusUpdateService {
	
	public boolean MemberStatusUpdate(String id, int grade) {
		
		boolean isUpdateMemberStatus =false;
		int upDateCount = 0;
		
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.setConnection(con);
		
		if(grade == 2) {
		upDateCount = dao.isUpdateSellerStatus(id);
		}else {
			upDateCount = dao.isUpdateCustomerStatus(id);
		}

		if(upDateCount>0) {
			commit(con);
			isUpdateMemberStatus=true;
		}else {
			rollback(con);
		}
		
		
		close(con);
	
		return isUpdateMemberStatus;
	}
	
	

}
