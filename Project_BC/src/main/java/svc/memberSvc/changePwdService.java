package svc.memberSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;

public class changePwdService {

	public boolean changePwd(String id ,String newPwd) {
		boolean chageSuccess = false;
		int updateCount = 0;
		
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		System.out.println("비밀번호 변경 서비스로옴");
		
		
		
		updateCount = dao.changePwd(id,newPwd);
		
		System.out.println("서비스 아이디" + id);
		
		
		if(updateCount > 0) {
			commit(con);
			chageSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return chageSuccess;
	}

}
