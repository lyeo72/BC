package svc.memberSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;

public class FindIdProService {

	public int FindGrade(String name) {
		int FindGrade=0;
		
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		FindGrade = dao.findGrade(name);
		
		
		close(con);
		
		
		return FindGrade;
	}

	public String findCustomerId(String name, String email) {
		String id = null;
		System.out.println("아이디찾기 서비스로 옴");
		
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		id = dao.findCustomerId(name,email);
		
		System.out.println("아이디는 : " + id + "입니다");
		
		close(con);
		
		return id;
	}
	
	public String findSellerId(String name, String email) {
		String id = null;
		System.out.println("아이디찾기 서비스로 옴 (셀러)");
		
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		id = dao.findSellerId(name,email);
		
		System.out.println("아이디는 : " + id);
		
		close(con);
		
		return id;
	}

}
