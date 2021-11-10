package svc.qnaSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BoardDAO;
import dao.QnaBoardDAO;

public class QnaDeleteProService {
	// 패스워드 확인을 통해 본인 여부를 판별 작업을 요청 isArticleWriter() 메서드 정의
	public boolean isArticleWriter(int qna_idx, String qna_password) {
//		System.out.println("BoardDeleteProService - isArticleWriter()");
		boolean isArticleWriter = true;
		
		
		Connection con = getConnection();
		
		// 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
		dao.setConnection(con);
		
		
		isArticleWriter = dao.isBoardArticleWriter(qna_idx, qna_password);
//		System.out.println("isArticleWriter = " + isArticleWriter);
		

		// 공통작업-4. Connection 객체 반환
		close(con);
		
		return isArticleWriter;
	}

	// 글 삭제 작업을 요청하는 removeArticle() 메서드 정의
	public boolean removeArticle(int qna_idx) {
		boolean isDeleteSuccess = false;
		

		// 공통작업-1. Connection Pool 로부터 Connection 객체 가져오기
		Connection con = getConnection();
		
		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		
		dao.setConnection(con);
		
		
		int deleteCount = dao.deleteArticle(qna_idx);
		
		if(deleteCount > 0) { // 삭제 성공 시
			commit(con);
			isDeleteSuccess = true;
		} else {
			rollback(con);
		}
		

		// 공통작업-4. Connection 객체 반환
		close(con);
		
		
		return isDeleteSuccess;
	}
	
}
