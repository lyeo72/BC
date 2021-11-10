package svc.memberSvc;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

import static db.JdbcUtil.*;

public class MemberLoginProService {

	public int loginMember(MemberBean member) {
		System.out.println("MemberLoginProService");
		int grade = 0;
		
		Connection con = getConnection();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.setConnection(con);
		
		
		grade = dao.selectMember(member);
		
		
		
		
		close(con);
	
		
		
		
		return grade;
	}

	public int autoLoginFindGrade(String login_id) {
		int grade = 0;
		
		Connection con = getConnection();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.setConnection(con);
		
		
		grade = dao.autoLoginFindGrade(login_id);
		
		
		
		
		close(con);
		

		return grade;
	}

}

