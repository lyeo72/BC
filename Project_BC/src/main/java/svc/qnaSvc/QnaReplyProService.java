package svc.qnaSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BoardDAO;
import dao.QnaBoardDAO;
import vo.BoardBean;
import vo.QnaBoardBean;

public class QnaReplyProService {

	public boolean replyArticle(QnaBoardBean board) {
		
		boolean isReplySuccess = false;
		
		Connection con = getConnection();
		
		// 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
		dao.setConnection(con);
		
		int insertCount = dao.insertReplyArticle(board);
		
		if(insertCount > 0) {
			commit(con);
			isReplySuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isReplySuccess;
	}
	
}














