package svc.memberSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

public class MemberDeleteService {
	public boolean deleteMember(String id,String pwd) {
		System.out.println("deleteMember");
		
		boolean isMemberDelete = false;
		
		Connection con = getConnection();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.setConnection(con);
		
		
		isMemberDelete = dao.deleteMember(id, pwd);
		
		
		close(con);
	
		
		
		
		return isMemberDelete;
	}

	

}

