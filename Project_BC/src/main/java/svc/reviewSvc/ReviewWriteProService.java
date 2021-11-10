package svc.reviewSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewBean;

public class ReviewWriteProService {

	public boolean registReview(ReviewBean review, int order_num) {
		System.out.println("ReviewWriteProService");
		boolean isWriteSuccess = false; // 글쓰기 작업 결과를 저장할 변수
		
		//2. DB연결을 위한 Connection 객체 가져오기 - 공통
//		Connection con = JdbcUtil.getConnection();
		Connection con = getConnection();
		
		//3. BoardBAO 클래스로 부터 생성된 BoardDAO  객체 가져오기 (공통)
		ReviewDAO dao = ReviewDAO.getInstance();
		
		//4.BoardDAO 객체에서 DB작업을 수행하기 위해 Connection객체를 전달하기(공통)
		dao.setConnection(con);
		
		//5.BoardDAO 객체의 메서드를 호출하여 XXX작없 수행 및 결과 리턴받기
		//글쓰기 작업을 수행하기 위해 insertArticle  메서드 호출
		//=>파라미터 
		
		int insertCount = dao.insertReview(review);// 리뷰 테이블에 넣는 메소드
		
		System.out.println(review.getProduct_num());
		int updateCount = dao.updateScore(review);// 리뷰 작성 시 프로덕트 리뷰스코어를 업데이트 하는 메소드
		
		int updateReviewStatus = dao.reviewStatus(review, order_num);
		
		System.out.println(insertCount);
		
		
		//6.작업수행 결과를 리턴받아 판별 후 결과 처리
		//작업 성곡 시 (=insertCount >0일 경우)
		//	=> commit 작업 수행, isWriteSuccess 를 true 로 변경
		//2) 작업 실패 시 (=insertCount ==0 일 경우) 
		//	=>Rollback 작업 수행, isWriteSuccess 를 false로 변경(생략가능)
		
		if(insertCount >0 && updateCount>0 &&updateReviewStatus>0) {
			commit(con);
			isWriteSuccess = true;
		}else {
			rollback(con);
			isWriteSuccess = false;
		}
		
		
		
		
		//7. JdbcUtil 객체로부터 가져온Connection 객체 반환(공통)
		close(con);
		
		
		//Acrion 클래스로 글쓰기 작업 결과 리턴
		return isWriteSuccess;
	}
		
		
	

}
