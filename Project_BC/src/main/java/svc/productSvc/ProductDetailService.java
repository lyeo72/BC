package svc.productSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.*;

import dao.BoardDAO;
import dao.ReviewDAO;
import vo.*;

public class ProductDetailService {

	// 게시물 1개 상세 정보를 조회를 요청하는 getArticle() 메소드 정의
	public BoardBean getArticle(int product_num) {
//		System.out.println("ProductDetailService - getArticle()");

		BoardBean article = new BoardBean();

		Connection con = getConnection();

		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);

		// 글 상세 정보 조회를 위해 BoardDAO 객체의 selectArticle() 메소드 호출
		// -> 파라미터 : 글번호(board_num) 리턴타입 : BoardBean(article)
		article = dao.selectArticle(product_num);

		close(con);

		return article;
	}

	public ArrayList<ProductImg> getArticleImg(int product_num) {
//		System.out.println("ProductDetailService - getArticleImg()");

		Connection con = getConnection();

		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);

		// 글 상세 정보 조회를 위해 BoardDAO 객체의 selectArticle() 메소드 호출
		// -> 파라미터 : 글번호(board_num) 리턴타입 : BoardBean(article)
		ArrayList<ProductImg> productImg = dao.selectArticleImg(product_num);

		close(con);

		return productImg;
	}

	public ArrayList<ProductImg> getDetailImg(int product_num) {
		System.out.println("ProductDetailService - getDetailImg()");

		Connection con = getConnection();

		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);

		ArrayList<ProductImg> detailImg = dao.selectDetailImg(product_num);

		close(con);

		return detailImg;
	}

	public int getReviewCount(int product_num) {
		int reviewCount = 0;
		
		Connection con = getConnection();
		
		ReviewDAO dao = ReviewDAO.getInstance();
		dao.setConnection(con);
		
		
		// BoardDAO 객체의 selectListCount() 메서드를 호출하여 게시물 총 갯수 구하기
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		reviewCount = dao.selectListCount(product_num);
		System.out.println("reviewCount = " + reviewCount);
		
		// 공통작업-4. Connection 객체 반환
		close(con);
		
		return reviewCount;
	}

}
