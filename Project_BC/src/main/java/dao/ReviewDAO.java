package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.Productbean;
import vo.ReviewBean;
import vo.orderProductBean;

public class ReviewDAO {
	private ReviewDAO() {
	}

	private static ReviewDAO instance;

	public static ReviewDAO getInstance() {
		// 기존의 인스턴스가 존재하지 않을 경우에만 인스턴스를 생성
		if (instance == null) {
			instance = new ReviewDAO();
		}

		// 인스턴스 리턴
		return instance;
	}

	// ========================================================================
	// DB 작업을 수행하기 위해 사용하는 Connection 타입 멤버변수 선언
	Connection con;

	// Connection 객체를 외부로부터 전달받아 저장하기 위한 Setter 메서드 정의
	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertReview(ReviewBean review) {
		System.out.println("insertReview");
		int insertCount = 0;

		PreparedStatement pstmt = null;

		try {

			// 글 등록 작업을 위한 INSERT 작업 수행
			// => 등록일(board_date)은 now() 함수 활용
			String sql = "INSERT INTO review VALUES (null,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review.getProduct_num());
			pstmt.setString(2, review.getReview_id());
			pstmt.setString(3, review.getReview_content());
			pstmt.setString(4, review.getReview_img());
			pstmt.setDouble(5, review.getReview_score());

			System.out.println(review.getProduct_num());
			System.out.println(review.getReview_id());
			System.out.println(review.getReview_content());
			System.out.println(review.getReview_img());
			System.out.println(review.getReview_score());

			// INSERT 구문 실행 및 결과 리턴받기 => insertCount 에 저장
			insertCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertArticle() 오류 - " + e.getMessage());
		} finally {
			// 자원 반환(주의! Connection 객체는 DAO 에서 반환하지 않도록 해야한다!)
//				if(rs != null) try { rs.close(); } catch(Exception e) {}
//				if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}

			close(pstmt);
		}

		return insertCount;
	}

	// 전체 게시물 총 갯수 조회하여 리턴하는 selectListCount() 메서드 정의
	public int selectListCount(int product_num) {
//			System.out.println("BoardDAO - selectListCount()");
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 3단계. SQL 구문 작성 및 전달
			// => 전체 레코드 갯수를 조회하기 위해 COUNT(*) 함수 사용(또는 COUNT(num))
			String sql = "SELECT COUNT(*) FROM review WHERE product_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);

			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1); // 또는 "COUNT(*)" 지정
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}

		return listCount;
	}

	public ArrayList<ReviewBean> selectReviewList(int product_num, int page, int limit) {
		ArrayList<ReviewBean> reviewList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 조회시작 게시물 (레코드) 번호 계산 (= 행번호 계산)
		int startRow = (page - 1) * limit;

		try {

			// 3단계. SQL 구문 작성 및 전달
			// -> funweb_board 테이블의 모든 레코드 조회(번호(num) 컬럼 기준 내림차순 정렬)
			// -> 단, 시작행번호부터 페이지당 게시물 수만큼만 조회
			// LIMIT 시작행번호, 페이지당게시물수
			String sql = "SELECT * FROM review WHERE product_num=? ORDER BY review_idx DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.setInt(2, startRow); // 시작행번호
			pstmt.setInt(3, limit); // 페이지당 게시물 수

			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();

			// 모든 레코드를 저장할 List 객체(ArrayList) 생성
			reviewList = new ArrayList<ReviewBean>();

			// while문을 사용하여 ResultSet 객체의 모든 레코드 접근
			while (rs.next()) {
				// BoardBean 객체를 생성하여 1개 레코드 정보를 BoardBean 객체에 저장
				// -> 글번호, 작성자, 제목, 날짜, 조회수만 필요
				ReviewBean review = new ReviewBean();

				review.setReview_id(rs.getString("review_id"));
				review.setProduct_num(rs.getInt("product_num"));
				review.setReview_idx(rs.getInt("review_idx"));
				review.setReview_content(rs.getString("review_content"));
				review.setReview_score(rs.getDouble("review_score")); // 답글에 대한 들여쓰기를 위해 Board_re_lev 추가
				review.setReview_date(rs.getDate("review_date"));
				review.setReview_img(rs.getString("review_img"));

				// 1개 레코드가 저장된 BoardBean 객체를 List 객체에 추가
				reviewList.add(review);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}

		return reviewList;
	}

	public int updateScore(ReviewBean review) {
		System.out.println("updateScore");
		int updateCount = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;

		try {

			// 글 등록 작업을 위한 INSERT 작업 수행
			// => 등록일(board_date)은 now() 함수 활용
			String sql = "select avg(review_score) from review where product_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review.getProduct_num());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				sql = "UPDATE product set product_review_score=? where product_num=?";
				System.out.println("update쿼리 실핵!");
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setDouble(1, rs.getDouble(1));
				pstmt2.setInt(2, review.getProduct_num());
				updateCount = pstmt2.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateCount() 오류 - " + e.getMessage());
		} finally {

			close(rs);
			close(pstmt);
			close(pstmt2);

		}

		return updateCount;
	}

	// 제품번호별 리뷰스코어를 모두 조회하는 메소드
	public double selectTotalScore(int product_num) {
		double avgScore = 0.0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT review_score FROM review WHERE product_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				avgScore += rs.getDouble(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return avgScore;
	}

	// 리뷰 작성 시 order_product의 check상태를 변동시키는 메소드
	public int reviewStatus(ReviewBean review, int order_num) {
		int updateReviewStatus = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;

		try {

			// 글 등록 작업을 위한 INSERT 작업 수행
			// => 등록일(board_date)은 now() 함수 활용
			String sql = "select product_check from order_product where order_num =? and product_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order_num);
			System.out.println(order_num);
			pstmt.setInt(2, review.getProduct_num());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				
				if((rs.getInt("product_check"))==0) {
				sql = "UPDATE order_product set product_check=? where order_num =? and product_num=?";
				System.out.println("리뷰 작성 시 product_check를 1로 바꾸는 업데이트 실행!");
				pstmt2 = con.prepareStatement(sql);
				
				pstmt2.setInt(1, 1);
				pstmt2.setInt(2, order_num);
				pstmt2.setInt(3, review.getProduct_num());
				updateReviewStatus = pstmt2.executeUpdate();
				
				}else if((rs.getInt("product_check"))==1){
					
					updateReviewStatus=0;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateCount() 오류 - " + e.getMessage());
		} finally {

			close(rs);
			close(pstmt);
			
			if(pstmt2!=null) {
				close(pstmt2);
			}

		}

		return updateReviewStatus;
	}

	public int selectReviewListCount(String id) {

		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// => 전체 레코드 갯수를 조회하기 위해 COUNT(*) 함수 사용(또는 COUNT(num))
			String sql = "SELECT COUNT(*) FROM review WHERE review_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1); // 또는 "COUNT(*)" 지정
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	public ArrayList<ReviewBean> selectMyReviewArticleList(String id) {
		ArrayList<ReviewBean> reviewList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			String sql = "SELECT * FROM review WHERE review_id=? " + "ORDER BY review_idx ";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);// 페이지당 게시물 수

			rs = pstmt.executeQuery();

			reviewList = new ArrayList<ReviewBean>();

			while (rs.next()) {
				ReviewBean review = new ReviewBean();

				review.setProduct_num(rs.getInt("product_num"));
				review.setReview_idx(rs.getInt("review_idx"));
				review.setReview_content(rs.getString("review_content"));
				review.setReview_score(rs.getDouble("review_score"));

				reviewList.add(review);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return reviewList;

	}

	public ArrayList<Productbean> selectMyOrderProductList(String id) {
		ArrayList<Productbean> orderList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;


		try {

			String sql = "SELECT * FROM order_product WHERE customer_id=?AND product_check=? ";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);// 페이지당 게시물 수
			pstmt.setInt(2, 0);

			rs = pstmt.executeQuery();
			
			orderList = new ArrayList<Productbean>();

			while (rs.next()) {
				Productbean product = new Productbean();

				product.setProduct_num(rs.getInt("product_num"));
				
				sql = "SELECT * FROM product WHERE product_num=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, product.getProduct_num());
				
				rs2 = pstmt2.executeQuery();
				
				if(rs2.next()) {
					
					product.setProduct_name(rs2.getString("product_name"));
					product.setProduct_review_score(rs2.getInt("product_review_score"));
					
				}
				orderList.add(product);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(rs2);
			close(pstmt2);
		}

		return orderList;
	}

}
