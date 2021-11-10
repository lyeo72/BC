package svc.dashBoardSvc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import vo.*;

import static db.JdbcUtil.*;

public class MemberListService {

	public ArrayList<CustomerBean> getMemberList() {
		Connection con = getConnection();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.setConnection(con);
		
		ArrayList<CustomerBean> memberList = dao.selectMemberList();
		
		
		close(con);
		
		return memberList;
	}

}
