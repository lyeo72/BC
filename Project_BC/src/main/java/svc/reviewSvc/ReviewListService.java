package svc.reviewSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;

import vo.ReviewBean;

public class ReviewListService {
	public int getListCount(int product_num) {
		System.out.println("BoardListService - getListCount()");
		// 공통작업-1. Connection Pool 로부터 Connection 객체 가져오기
//		Connection con = JdbcUtil.getConnection();
		Connection con = getConnection();
		
		ReviewDAO dao = ReviewDAO.getInstance();
		dao.setConnection(con);
		
		
		// BoardDAO 객체의 selectListCount() 메서드를 호출하여 게시물 총 갯수 구하기
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		int listCount = dao.selectListCount(product_num);
		System.out.println("listCount = " + listCount);
		
		// 공통작업-4. Connection 객체 반환
		close(con);
		
		return listCount;
		
	}
	
	public ArrayList<ReviewBean> getReviewList(int product_num,int page, int limit) {
		// 공통작업-1. Connection Pool 로부터 Connection 객체 가져오기
		Connection con = getConnection();
		
		// 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
		ReviewDAO dao = ReviewDAO.getInstance();
	
		
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
		dao.setConnection(con);
		
		
		
		//Arra
		ArrayList<ReviewBean> reviewList = dao.selectReviewList(product_num,page,limit);
		// 공통작업-4. Connection 객체 반환
		close(con);
		
		return reviewList;
	}
	
	public double getTotalReviewScore(int product_num) {
		System.out.println("ReviewListService - getAvgReviewScore()");
		double avgScore = 0.0;
		
		Connection con = getConnection();
		
		// 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
		ReviewDAO dao = ReviewDAO.getInstance();
	
		
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
		dao.setConnection(con);
		
		avgScore = dao.selectTotalScore(product_num);
		
		close(con);
		
		return avgScore;
		
	}
	
	public ArrayList<ReviewBean> getArticleList(String id,int page, int limit) {
       
		Connection con = getConnection();
        
        ReviewDAO dao = ReviewDAO.getInstance();
        
        dao.setConnection(con);
        
        
        ArrayList<ReviewBean> articleList = dao.selectMyReviewArticleList(id);
        
        close(con);
        
        return articleList;
    }
}
