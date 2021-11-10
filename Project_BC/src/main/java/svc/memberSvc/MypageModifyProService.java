package svc.memberSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;


import dao.MemberDAO;
import vo.CustomerBean;

public class MypageModifyProService{
    
    
    public boolean updateMember(CustomerBean customer) {
        System.out.println("수정서비스");
        
        boolean ModifySuccess = false;
        int updateCount = 0;
        
        
        System.out.println(customer + "서비스");
        
        // 공통작업-1. Connection Pool 로부터 Connection 객체 가져오기
        Connection con = getConnection();
        
        // 공통작업-2. MemberDAO 클래스로부터 MemberDAO 객체 가져오기
        MemberDAO dao = MemberDAO.getInstance();
        
        // 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
        dao.setConnection(con);
        
         if(customer.getPassword()==null) {
             
             updateCount = dao.updateNonePasswordMember(customer);
    
         }else {
             
             updateCount = dao.updateMember(customer);
         }
       
    
        if(updateCount == 0) { // 작업 성공 시
    //      JdbcUtil.commit(con);
            commit(con);
            ModifySuccess = true;
        } else { // 작업 실패 시
    //      JdbcUtil.rollback(con);
            rollback(con);
        }
    
    
   
    
       close(con);
    
    return ModifySuccess;
}

}
