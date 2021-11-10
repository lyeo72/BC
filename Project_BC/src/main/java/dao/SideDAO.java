package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BoardBean;
import vo.ReviewBean;

public class SideDAO {

	private SideDAO() {
	}

	private static SideDAO instance;

	public static SideDAO getInstance() {
		if (instance == null) {
			instance = new SideDAO();
		}
		return instance;
	}

	Connection con = null;

	public void setConnection(Connection con) {
		this.con = con;
	}

	public ArrayList<BoardBean> selectCategory(String category) {

		ArrayList<BoardBean> sideList = null;

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 =null;

		try {
			con = getConnection();

			String sql = "";
			if (category.equals("all")) {
				sql = "select * from product where product_category in ('SideDishside','SideDishmeat', 'SideDishfish', 'Kimchikimchi', 'Soupsoup')";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select * from product where product_category=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
			}

			// 4단계
			rs = pstmt.executeQuery();

			// 모든 레코드를 저장할 List객체(ArrayList) 생성
			sideList = new ArrayList<BoardBean>();

			// while문을 사용하여 rs객체의 모든 레코드 접근
			while (rs.next()) {
				// BoardBean 객체를 생성하여 1개 레코드 정보는 BoardBean 객체에 저장
				// 답글에 대한 들여쓰기를 위해 re_lev 추가

				BoardBean board = new BoardBean();
				board.setProduct_num(rs.getInt("product_num"));
				board.setProduct_name(rs.getString("product_name"));
				board.setSeller_id(rs.getString("seller_id"));
				board.setProduct_category(category);
				board.setProduct_price(rs.getInt("product_price"));
				board.setProduct_weight(rs.getInt("product_weight"));
				board.setProduct_discount(rs.getInt("product_discount"));
				board.setProduct_date(rs.getDate("product_date"));
				board.setProduct_stock(rs.getInt("product_stock"));
				board.setProduct_expiration_date(rs.getString("product_expiration_date"));
				board.setProduct_handling(rs.getString("product_handling"));
				board.setProduct_material(rs.getString("product_material"));
				board.setProduct_review_score(rs.getInt("product_review_score"));

				// 1개 레코드가 저장된 BoardBean 객체를 List객체에 추가

				
				sql = "SELECT * FROM review where product_num=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, board.getProduct_num());
				
				rs2 = pstmt2.executeQuery();
				
				int count = 0;
				while (rs2.next()) {
					count++;
				}
				board.setReviewCount(count);
				sideList.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(rs2);
			close(pstmt);
			close(pstmt2);
		}

		return sideList;

	}

	// ================================================================================

	public ArrayList<BoardBean> selectSale(String category) {

		ArrayList<BoardBean> saleList = null;

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		try {
			con = getConnection();

			String sql = "select * from product where product_discount >0 order by product_discount ASC;";

			pstmt = con.prepareStatement(sql);

			// 4단계
			rs = pstmt.executeQuery();

			// 모든 레코드를 저장할 List객체(ArrayList) 생성
			saleList = new ArrayList<BoardBean>();

			// while문을 사용하여 rs객체의 모든 레코드 접근
			while (rs.next()) {
				// BoardBean 객체를 생성하여 1개 레코드 정보는 BoardBean 객체에 저장
				// 답글에 대한 들여쓰기를 위해 re_lev 추가

				BoardBean board = new BoardBean();
				board.setProduct_num(rs.getInt("product_num"));
				board.setProduct_name(rs.getString("product_name"));
				board.setSeller_id(rs.getString("seller_id"));
				board.setProduct_category(rs.getString("product_category"));
				board.setProduct_price(rs.getInt("product_price"));
				board.setProduct_discount(rs.getInt("product_discount"));
				board.setProduct_weight(rs.getInt("product_weight"));
				board.setProduct_date(rs.getDate("product_date"));
				board.setProduct_stock(rs.getInt("product_stock"));
				board.setProduct_expiration_date(rs.getString("product_expiration_date"));
				board.setProduct_handling(rs.getString("product_handling"));
				board.setProduct_material(rs.getString("product_material"));
				board.setProduct_review_score(rs.getInt("product_review_score"));

				sql = "SELECT * FROM review where product_num=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, board.getProduct_num());
				
				rs2 = pstmt2.executeQuery();
				
				int count = 0;
				while (rs2.next()) {
					count++;
				}
				board.setReviewCount(count);
				saleList.add(board);
				
				// 1개 레코드가 저장된 BoardBean 객체를 List객체에 추가

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(rs2);
			close(pstmt);
			close(pstmt2);
		}

		return saleList;
	}

	// ==========================================================

	public ArrayList<BoardBean> selectBrandNew(String category) {

		ArrayList<BoardBean> brandNewList = null;

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		try {
			con = getConnection();

			String sql = "select * from product order by product_date DESC;";

			pstmt = con.prepareStatement(sql);

			// 4단계
			rs = pstmt.executeQuery();

			// 모든 레코드를 저장할 List객체(ArrayList) 생성
			brandNewList = new ArrayList<BoardBean>();

			// while문을 사용하여 rs객체의 모든 레코드 접근
			while (rs.next()) {
				// BoardBean 객체를 생성하여 1개 레코드 정보는 BoardBean 객체에 저장
				// 답글에 대한 들여쓰기를 위해 re_lev 추가

				BoardBean board = new BoardBean();
				board.setProduct_num(rs.getInt("product_num"));
				board.setProduct_name(rs.getString("product_name"));
				board.setSeller_id(rs.getString("seller_id"));
				board.setProduct_category(rs.getString("product_category"));
				board.setProduct_price(rs.getInt("product_price"));
				board.setProduct_discount(rs.getInt("product_discount"));
				board.setProduct_weight(rs.getInt("product_weight"));
				board.setProduct_date(rs.getDate("product_date"));
				board.setProduct_stock(rs.getInt("product_stock"));
				board.setProduct_expiration_date(rs.getString("product_expiration_date"));
				board.setProduct_handling(rs.getString("product_handling"));
				board.setProduct_material(rs.getString("product_material"));
				board.setProduct_review_score(rs.getInt("product_review_score"));

				sql = "SELECT * FROM review where product_num=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, board.getProduct_num());
				
				rs2 = pstmt2.executeQuery();
				
				int count = 0;
				while (rs2.next()) {
					count++;
				}
				board.setReviewCount(count);
				// 1개 레코드가 저장된 BoardBean 객체를 List객체에 추가
				brandNewList.add(board);
				

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(rs2);
			close(pstmt);
			close(pstmt2);
		}

		return brandNewList;
	}

	// =====================================================

	public ArrayList<BoardBean> selectBest(String category) {

		ArrayList<BoardBean> bestList = null;

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		try {
			con = getConnection();

			String sql = "select * from product order by product_review_score DESC;";

			pstmt = con.prepareStatement(sql);

			// 4단계
			rs = pstmt.executeQuery();

			// 모든 레코드를 저장할 List객체(ArrayList) 생성
			bestList = new ArrayList<BoardBean>();

			// while문을 사용하여 rs객체의 모든 레코드 접근
			while (rs.next()) {
				// BoardBean 객체를 생성하여 1개 레코드 정보는 BoardBean 객체에 저장
				// 답글에 대한 들여쓰기를 위해 re_lev 추가

				BoardBean board = new BoardBean();
				board.setProduct_num(rs.getInt("product_num"));
				board.setProduct_name(rs.getString("product_name"));
				board.setSeller_id(rs.getString("seller_id"));
				board.setProduct_category(rs.getString("product_category"));
				board.setProduct_price(rs.getInt("product_price"));
				board.setProduct_discount(rs.getInt("product_discount"));
				board.setProduct_weight(rs.getInt("product_weight"));
				board.setProduct_date(rs.getDate("product_date"));
				board.setProduct_stock(rs.getInt("product_stock"));
				board.setProduct_expiration_date(rs.getString("product_expiration_date"));
				board.setProduct_handling(rs.getString("product_handling"));
				board.setProduct_material(rs.getString("product_material"));
				board.setProduct_review_score(rs.getInt("product_review_score"));

				
				sql = "SELECT * FROM review where product_num=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, board.getProduct_num());
				
				rs2 = pstmt2.executeQuery();
				
				int count = 0;
				while (rs2.next()) {
					count++;
				}
				board.setReviewCount(count);
				// 1개 레코드가 저장된 BoardBean 객체를 List객체에 추가
				bestList.add(board);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(rs2);
			close(pstmt);
			close(pstmt2);
		}

		return bestList;
	}

	// ===========================================================

	public ArrayList<BoardBean> selectSearch(String keyword) {

		ArrayList<BoardBean> searchList = null;

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		try {
			con = getConnection();

			String sql = "select * from product " + "where product_name like '%" + keyword + "%'";

			pstmt = con.prepareStatement(sql);

			// 4단계
			rs = pstmt.executeQuery();

			// 모든 레코드를 저장할 List객체(ArrayList) 생성
			searchList = new ArrayList<BoardBean>();

			// while문을 사용하여 rs객체의 모든 레코드 접근
			while (rs.next()) {
				// BoardBean 객체를 생성하여 1개 레코드 정보는 BoardBean 객체에 저장
				// 답글에 대한 들여쓰기를 위해 re_lev 추가

				BoardBean board = new BoardBean();
				board.setProduct_num(rs.getInt("product_num"));
				board.setProduct_name(rs.getString("product_name"));
				board.setSeller_id(rs.getString("seller_id"));
				board.setProduct_category(rs.getString("product_category"));
				board.setProduct_price(rs.getInt("product_price"));
				board.setProduct_discount(rs.getInt("product_discount"));
				board.setProduct_weight(rs.getInt("product_weight"));
				board.setProduct_date(rs.getDate("product_date"));
				board.setProduct_stock(rs.getInt("product_stock"));
				board.setProduct_expiration_date(rs.getString("product_expiration_date"));
				board.setProduct_handling(rs.getString("product_handling"));
				board.setProduct_material(rs.getString("product_material"));
				board.setProduct_review_score(rs.getInt("product_review_score"));

				sql = "SELECT * FROM review where product_num=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, board.getProduct_num());
				
				rs2 = pstmt2.executeQuery();
				
				int count = 0;
				while (rs2.next()) {
					count++;
				}
				board.setReviewCount(count);
				// 1개 레코드가 저장된 BoardBean 객체를 List객체에 추가
				searchList.add(board);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(rs2);
			close(pstmt);
			close(pstmt2);
		}

		return searchList;

	}

}
