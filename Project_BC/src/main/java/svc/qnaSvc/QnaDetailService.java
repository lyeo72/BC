package svc.qnaSvc;

import vo.QnaBoardBean;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.QnaBoardDAO;

public class QnaDetailService {

	// 게시물 1개 상세 정보 조회를 요청하는 getArticle() 메서드 정의
	public QnaBoardBean getArticle(int qna_idx) {
	    QnaBoardBean article = null;
		
		// 공통작업-1. Connection Pool 로부터 Connection 객체 가져오기
		Connection con = getConnection();
		
		// 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
		dao.setConnection(con);
		
		
		// 글 상세 정보 조회를 위해 BoardDAO 객체의 selectArticle() 메서드 호출
		// => 파라미터 : 글번호(board_num)  리턴타입 : BoardBean(article)
		article = dao.selectArticle(qna_idx);
		
		
		// 공통작업-4. Connection 객체 반환
		close(con);
		
		return article;
	}



	
}













