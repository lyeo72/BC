package svc.productSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BoardDAO;
import vo.*;

public class BoardWriteProService {

	public boolean registArticle(BoardBean board) {
		System.out.println("registArticle - WriteProService");
		// 1. 글쓰기 작업 요청 처리 결과를 저장할 boolean 타입 변수 선언
		boolean isWriteSuccess = false;

		// 2. JdbcUtil 객체로부터 Connection Pool 에 저장된 Connection 객체 가져오기(공통)
//      Connection con = JdbcUtil.getConnection();
		Connection con = getConnection();

		// 3. BoardDAO 클래스로부터 생성된 BoardDAO 객체 가져오기(공통)
		BoardDAO dao = BoardDAO.getInstance();

		// 4. BoardDAO 객체에서 DB 작업을 수행하기 위해 Connection 객체를 전달하기(공통)
		dao.setConnection(con);
		System.out.println(board.getProduct_name().toString());

		int insertCount = dao.insertArticle(board);

		if (insertCount > 0) { // 작업 성공 시
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
	public int getProductNum(BoardBean boardBean) {
		System.out.println("getProductNum - boardWriteProService");
		int productNum = 0;
		Connection con = getConnection();		
		BoardDAO dao = BoardDAO.getInstance();		
		dao.setConnection(con);
		
		productNum = dao.getProductNum(boardBean);
		
		close(con);
		
		return productNum;
	}

	public boolean registImgArticle(ProductImg productimg) {
		System.out.println("registImgArticle - boardWriteProService");
		boolean isImgSuccess=false;

		Connection con = getConnection();		
		BoardDAO dao = BoardDAO.getInstance();		
		dao.setConnection(con);
		
		int insertCount = dao.insertImgArticle(productimg);		 

		if (insertCount > 0) { // 작업 성공 시
//          JdbcUtil.commit(con);
			commit(con);
			isImgSuccess = true;
		} else { // 작업 실패 시
//          JdbcUtil.rollback(con);
			rollback(con);
		}
		
		close(con);
		

		return isImgSuccess;
	}


}
