package svc.memberSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
import vo.CustomerBean;
import vo.MemberBean;


public class CustomerJoinProService {
	

	public boolean joinCustomer(CustomerBean cBean) {
		// TODO Auto-generated method stub
		boolean isJoinSuccess = false;
		
		Connection con = getConnection();
		
		MemberDAO dao = MemberDAO.getInstance();
		int insertCount = 0;
		int updateCount = 0;
		
	
		System.out.println(cBean.getName() + "service");
		dao.setConnection(con);
		System.out.println(cBean.getRecommend_id());
		updateCount = dao.foundRecommandID(cBean.getRecommend_id());
		
		if(updateCount > -1) {
			insertCount = dao.insertMember(cBean);
		}
		
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
