package svc.dashBoardSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BoardDAO;

public class SellerDeleteService {

	public boolean isProductDelete(int product_num) {

		boolean isDeleteSuccess = false;

		// 공통작업 1
		Connection con = getConnection();
		// 공통작업 2
		BoardDAO dao = BoardDAO.getInstance();
		// 공통작업 3
		dao.setConnection(con);

		// BoardDAO 객체의 isBoardArticleWriter() 메서드를 호출하여 패스워드 확인 작업 요청
		// => 파라미터 : 글번호, 패스워드 리턴타입 : boolean(isArticleWriter)
		int DeleteCount = dao.productDelete(product_num);

		if(DeleteCount>0) {//삭제 성공
			commit(con);
			isDeleteSuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		return isDeleteSuccess;
	}

}
