package svc.dashBoardSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.NoticeBoardDAO;
import vo.NoticeBean;

public class NoticeWriteProService {

    public boolean registArticle(NoticeBean board) {
       
        // 1. 글쓰기 작업 요청 처리 결과를 저장할 boolean 타입 변
        boolean isWriteSuccess = false;
        
        // 2. JdbcUtil 객체로부터 Connection Pool에 저장된 Connection 객체 가져오기(공통) 
//      Connection con = JdbcUtil.getConnection();
        Connection con = getConnection();
        
        // 3. BoardDAO 클래스로부터 생성된 BoardDAO 객체 가져오기(공통)
        NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
        
        // 4. BoardDAO 객체에서 DB 작업을 수행하기 위해 Connection 객체를 전달하기(공통)
        dao.setConnection(con);
        

        int insertCount = dao.insertArticle(board);
     
        if(insertCount > 0) { // 작업 성공 시
//          JdbcUtil.commit(con);
            commit(con);
            isWriteSuccess = true;
        } else { // 작업 실패 시
//          JdbcUtil.rollback(con);
            rollback(con);
        }
        
        // 7. JdbcUtil 객체로부터 가져온 Connection 객체 반환(공통)
//      JdbcUtil.close(con);
        close(con);
        
        // 8. Action 클래스로 글쓰기 작업 결과 리턴
        return isWriteSuccess;
    }
    
    
    
}
