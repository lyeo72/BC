package svc.memberSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;
import vo.SellerBean;

public class SellerJoinProService {

	public boolean joinSeller(SellerBean sBean) {
		boolean isJoinSuccess = false;
		
		Connection con = getConnection();
		
		MemberDAO dao = MemberDAO.getInstance();
		int insertCount = 0;

		dao.setConnection(con);
		insertCount = dao.insertSeller(sBean);

		System.out.println(sBean.getDtl_addr() +" service");

		if(insertCount > 0) {
			commit(con);
			isJoinSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return isJoinSuccess;
	}

}
