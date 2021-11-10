package svc.memberSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;
import vo.CustomerBean;
import vo.MemberBean;

public class MypageModifyService {

    public boolean passwordCheck(MemberBean member) {
//      System.out.println("MemberLoginProService - joinMember()");
        
        
        boolean isLoginSuccess =false;
        
        // 공통작업-1. Connection Pool 로부터 Connection 객체 가져오기
        Connection con = getConnection();
        
        // 공통작업-2. MemberDAO 클래스로부터 MemberDAO 객체 가져오기
        MemberDAO dao = MemberDAO.getInstance();
        
        // 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
        dao.setConnection(con);
        
        
        // MemberDAO 객체의 selectMember() 메서드를 호출하여 회원 등록 작업 수행
        // => 파라미터 : MemberBean 객체    리턴타입 : boolean(isLoginSuccess)
        int idCheck = dao.selectMember(member);
        System.out.println(idCheck);
        if(idCheck==3) {
            
            isLoginSuccess=true;
            
        }
        
        close(con);
        
        return isLoginSuccess;
    }

    public CustomerBean customerInfo(MemberBean member) {
        CustomerBean customer = new CustomerBean();
        Connection con = getConnection();
        
        // 공통작업-2. MemberDAO 클래스로부터 MemberDAO 객체 가져오기
        MemberDAO dao = MemberDAO.getInstance();
        
        // 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
        dao.setConnection(con);
        
        
        // MemberDAO 객체의 selectMember() 메서드를 호출하여 회원 등록 작업 수행
        // => 파라미터 : MemberBean 객체    리턴타입 : boolean(isLoginSuccess)
        customer = dao.selectCustomerInfo(member);
       
        
        close(con);
        
        return customer;
        
    }
    
}
