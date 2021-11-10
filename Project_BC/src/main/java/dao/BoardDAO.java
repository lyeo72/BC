package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.*;

import static db.JdbcUtil.*;

public class BoardDAO {

	private BoardDAO() {
	}

	private static BoardDAO instance;

	public static BoardDAO getInstance() {
		// 기존의 인스턴스가 존재하지 않을 경우에만 인스턴스를 생성
		if (instance == null) {
			instance = new BoardDAO();
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

	public int insertArticle(BoardBean board) {
//		System.out.println("insertArticle - DAO");
		int insertCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(board.getProduct_name());

		int num = 1; // 새 글 번호를 저장할 변수 선언

		try {

			String sql = "SELECT MAX(product_num) FROM product";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 조회된 글 번호가 하나라도 존재할경우.
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

			// 다음 작업을 위해 PreparedStatement 객체 반환
			// 하나의 메서드에서 복수개의 PreparedStatement 가 생성되는 것을 방지
			close(rs);
			close(pstmt);

			// 글 등록 작업을 위한 INSERT 작업 수행
			// => 등록일(board_date)은 now() 함수 활용
			sql = "INSERT INTO product VALUES (null,?,?,?,?,?,?,now(),?,?,?,?,0)";
			pstmt = con.prepareStatement(sql);
			// 첫 문장은 auto_increment 이므로 null값 넣음
			pstmt.setString(1, board.getProduct_name()); // 상품명
			pstmt.setString(2, board.getSeller_id());// 회사명-FK
			pstmt.setString(3, board.getProduct_category());// 상품 카테고리
			pstmt.setInt(4, board.getProduct_price()); // 상품가격
			pstmt.setInt(5, board.getProduct_weight());// 상품무게
			pstmt.setInt(6, board.getProduct_discount()); // 상품 할인률
//            pstmt.setDate(7, board.getProduct_date());//					now로 들어감
			pstmt.setInt(7, board.getProduct_stock()); // 상품 수량
			pstmt.setString(8, board.getProduct_expiration_date());// 유통기한
			pstmt.setString(9, board.getProduct_handling());// 보관법
			pstmt.setString(10, board.getProduct_material());// 제품 품질

//            pstmt.setDate(num, null);

			// INSERT 구문 실행 및 결과 리턴받기 => insertCount 에 저장IN
			insertCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertArticle() 오류 - " + e.getMessage());
		} finally {
			// 자원 반환(주의! Connection 객체는 DAO 에서 반환하지 않도록 해야한다!)
//          if(rs != null) try { rs.close(); } catch(Exception e) {}
//          if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}			
			close(pstmt);
		}

		return insertCount;
	}

	public int selectListCount() {
//      System.out.println("BoardDAO - selectListCount()");
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 3단계. SQL 구문 작성 및 전달
			// => 전체 레코드 갯수를 조회하기 위해 COUNT(*) 함수 사용(또는 COUNT(num))
			String sql = "SELECT COUNT(*) FROM product";
			pstmt = con.prepareStatement(sql);

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

	public ArrayList<BoardBean> selectArticleList(String sId) {
		ArrayList<BoardBean> articleList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			String sql = "SELECT * FROM product WHERE seller_id=? ORDER BY product_num DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sId);

			rs = pstmt.executeQuery();

			articleList = new ArrayList<BoardBean>();

			while (rs.next()) {

				BoardBean board = new BoardBean();
				board.setProduct_num(rs.getInt("product_num"));
				board.setProduct_name(rs.getString("product_name"));
				board.setSeller_id(rs.getString("seller_id"));
				board.setProduct_date(rs.getDate("product_date"));
				board.setProduct_category(rs.getString("product_category"));
				board.setProduct_price(rs.getInt("product_price"));
				board.setProduct_stock(rs.getInt("product_stock"));

				// 1개 레코드가 저장된 BoardBean 객체를 List 객체에 추가
				articleList.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}

		return articleList;
	}

	public BoardBean selectArticle(int product_num) {
//		System.out.println("BoardDAO - selectArticle()");
		BoardBean article = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			// 3단계. SQL 구문 작성 및 전달
			// -> 글번호(num)에 해당하는 게시물 상세 정보 조회 후 BoardBean 객체에 저장
			String sql = "SELECT * FROM product WHERE product_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				// 조회된 상세 정보를 BoardBean 객체에 저장
				article = new BoardBean();

				article.setProduct_num(rs.getInt("product_num"));
				article.setProduct_name(rs.getString("product_name"));
				article.setSeller_id(rs.getString("seller_id"));
				article.setProduct_category(rs.getString("product_category"));
				article.setProduct_price(rs.getInt("product_price"));
				article.setProduct_weight(rs.getInt("product_weight"));
				article.setProduct_discount(rs.getInt("product_discount"));
				article.setProduct_date(rs.getDate("product_date"));
				article.setProduct_stock(rs.getInt("product_stock"));
				article.setProduct_expiration_date(rs.getString("product_expiration_date"));
				article.setProduct_handling(rs.getString("product_handling"));
				article.setProduct_material(rs.getString("product_material"));
				article.setProduct_review_score(rs.getDouble("product_review_score"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}

		return article;
	}

	public int insertImgArticle(ProductImg productimg) {

		int imgCount = 0;

		PreparedStatement pstmt = null;

		try {

			String sql = "INSERT INTO product_img VALUES (?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productimg.getProduct_num());
			pstmt.setString(2, productimg.getProduct_original_img());
			pstmt.setString(3, productimg.getProduct_img());
			pstmt.setInt(4, productimg.getProduct_img_location());

			imgCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertArticle() 오류 - " + e.getMessage());
		} finally {

			close(pstmt);
		}

		return imgCount;
	}

	public int getProductNum(BoardBean boardBean) {
		int productNum = 0;
//		System.out.println("BoardDAO- getProductNum");
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			// 3단계. SQL 구문 작성 및 전달
			// -> 글번호(num)에 해당하는 게시물 상세 정보 조회 후 BoardBean 객체에 저장
			String sql = "SELECT MAX(product_num) FROM product";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				productNum = rs.getInt("MAX(product_num)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}
		return productNum;
	}

	public ArrayList<ProductImg> selectArticleImg(int product_num) {
		ArrayList<ProductImg> articleImg = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			// 3단계. SQL 구문 작성 및 전달
			// -> 글번호(num)에 해당하는 게시물 상세 정보 조회 후 BoardBean 객체에 저장
			String sql = "SELECT * FROM product_img WHERE product_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);

			rs = pstmt.executeQuery();

			articleImg = new ArrayList<ProductImg>();

			while (rs.next()) {

				ProductImg productImg = new ProductImg();
				productImg.setProduct_original_img(rs.getString("product_original_img"));
				productImg.setProduct_img(rs.getString("product_img"));
				productImg.setProduct_img_location(rs.getInt("product_img_location"));

				articleImg.add(productImg);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}

		return articleImg;
	}

	public ArrayList<ProductImg> selectDetailImg(int product_num) {
		ArrayList<ProductImg> detailImg = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "SELECT * FROM product_img WHERE product_num=? AND product_img_location=2";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);

			rs = pstmt.executeQuery();

			detailImg = new ArrayList<ProductImg>();

			while (rs.next()) {
				// 조회된 상세 정보를 BoardBean 객체에 저장
				ProductImg productImg = new ProductImg();

				productImg.setProduct_original_img(rs.getString("product_original_img"));
				productImg.setProduct_img(rs.getString("product_img"));
				productImg.setProduct_img_location(rs.getInt("product_img_location"));

				detailImg.add(productImg);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}

		return detailImg;
	}

	public ArrayList<BoardBean> selectProducList() {
		ArrayList<BoardBean> productList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			String sql = "SELECT * FROM product ORDER BY product_num DESC";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			productList = new ArrayList<BoardBean>();

			while (rs.next()) {

				BoardBean board = new BoardBean();
				board.setProduct_num(rs.getInt("product_num"));
				board.setProduct_name(rs.getString("product_name"));
				board.setSeller_id(rs.getString("seller_id"));
				board.setProduct_date(rs.getDate("product_date"));
				board.setProduct_category(rs.getString("product_category"));
				board.setProduct_price(rs.getInt("product_price"));
				board.setProduct_stock(rs.getInt("product_stock"));

				// 1개 레코드가 저장된 BoardBean 객체를 List 객체에 추가
				productList.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}

		return productList;
	}
	
	public int productDelete(int product_num) {
		int deleteCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from product where product_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return deleteCount;
		
	}

}