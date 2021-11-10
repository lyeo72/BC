package svc.qnaSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BoardDAO;
import dao.QnaBoardDAO;
import vo.BoardBean;
import vo.QnaBoardBean;

public class QnaModifyProService {

	public boolean isArticleWriter(int board_num, String board_pass) {
		
		boolean isArticleWriter = false;
		
		Connection con = getConnection();
		
		// 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
		dao.setConnection(con);
		
		isArticleWriter = dao.isBoardArticleWriter(board_num, board_pass);
//		System.out.println("isArticleWriter = " + isArticleWriter);
		

		// 공통작업-4. Connection 객체 반환
		close(con);
		
		return isArticleWriter;
	}

	public boolean modifyArticle(QnaBoardBean board) {
//		System.out.println("BoardModifyProService - modifyArticle()");
		
		boolean isModifySuccess = false;
		
		// 공통작업-1. Connection Pool 로부터 Connection 객체 가져오기
		Connection con = getConnection();
		
		// 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
		dao.setConnection(con);
		
		
		int updateCount = dao.updateArticle(board);
		
		// 삭제 결과 판별
		// updateCount 가 0보다 클 경우 commit 수행 및 isModifySuccess 를 true 로 변경
		if(updateCount > 0) { // 삭제 성공 시
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		
		// 공통작업-4. Connection 객체 반환
		close(con);
		
		return isModifySuccess;
	}

}
