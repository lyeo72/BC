package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BoardBean;
import vo.QnaBoardBean;

import static db.JdbcUtil.*;

public class QnaBoardDAO {
	/*
	 */
	private QnaBoardDAO() {
	}

	private static QnaBoardDAO instance;

	public static QnaBoardDAO getInstance() {
		// 기존의 인스턴스가 존재하지 않을 경우에만 인스턴스를 생성
		if (instance == null) {
			instance = new QnaBoardDAO();
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

	// ========================================================================
	// Service 클래스로부터 비즈니스 로직을 요청받아 처리하는 메서드 정의
	// 글등록 작업을 위한 insertArticle() 메서드 정의
	// => 파라미터 : BoardBean 객체, 리턴타입 : int(insertCount)
	public int insertArticle(QnaBoardBean board) {
		int insertCount = 0;

		PreparedStatement pstmt = null;

		try {

			String sql = "INSERT INTO qna VALUES (null,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getCustomer_id());
			pstmt.setInt(2, board.getProduct_num());
			pstmt.setString(3, board.getQna_subject());
			pstmt.setString(4, board.getQna_password());
			pstmt.setString(5, board.getQna_content());

			// INSERT 구문 실행 및 결과 리턴받기 => insertCount 에 저장
			insertCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertArticle() 오류 - " + e.getMessage());
		} finally {

			close(pstmt);
		}

		return insertCount;
	}

	public int selectListCount() {

		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 3단계. SQL 구문 작성 및 전달
			// => 전체 레코드 갯수를 조회하기 위해 COUNT(*) 함수 사용(또는 COUNT(num))
			String sql = "SELECT COUNT(*) FROM qna";
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

	// 글 상세 정보 조회를 위한 selectArticle() 메서드 정의
	public ArrayList<QnaBoardBean> selectArticleList(String seller_id) {
		QnaBoardBean qna = null;
		ArrayList<QnaBoardBean> qnaList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 3단계. SQL 구문 작성 및 전달
			// => 글번호(board_num)에 해당하는 게시물 상세 정보 조회 후 BoardBean 객체에 저장
			String sql = "SELECT * FROM qna WHERE product_num IN("
					+ "   SELECT PRO.product_num FROM product AS PRO JOIN seller AS SEL"
					+ "   ON PRO.seller_id = SEL.seller_id WHERE PRO.seller_id = ?" + " )ORDER BY qna_idx asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, seller_id);

			qnaList = new ArrayList<QnaBoardBean>();
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 조회된 상세 정보를 BoardBean 객체에 저장
				qna = new QnaBoardBean();
				qna.setQna_idx(rs.getInt("qna_idx"));
				qna.setCustomer_id(rs.getString("customer_id"));
				qna.setProduct_num(rs.getInt("product_num"));
				qna.setQna_subject(rs.getString("qna_subject"));
				qna.setQna_password(rs.getString("qna_password"));
				qna.setQna_content(rs.getString("qna_content"));

				qnaList.add(qna);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}

		return qnaList;
	}

	public boolean isBoardArticleWriter(int qna_idx, String qna_password) {
		boolean isArticleWriter = false;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 3단계. SQL 구문 작성 및 전달
			// => board_num 에 해당하는 레코드의 board_pass 조회
			String sql = "SELECT qna_password FROM qna WHERE qna_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qna_idx);

			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 조회된 패스워드와 입력받은 패스워드가 일치할 경우
				// isArticleWriter 를 true 로 변경
				if (qna_password.equals(rs.getString("qna_password"))) {
					isArticleWriter = true;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}

		return isArticleWriter;
	}

	public int deleteArticle(int qna_idx) {
		int deleteCount = 0;

		PreparedStatement pstmt = null;

		try {
			// 3단계. SQL 구문 작성 및 전달
			// => board_num 에 해당하는 레코드 삭제
			String sql = "DELETE FROM qna WHERE qna_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qna_idx);

			// 4단계. SQL 구문 실행 및 결과 처리
			deleteCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(pstmt);
		}

		return deleteCount;
	}

	// 글 수정 작업을 수행하는 updateArticle() 메서드 정의
	public int updateArticle(QnaBoardBean board) {
		int updateCount = 0;

		PreparedStatement pstmt = null;

		try {
			// 글번호(board_num)에 해당하는 레코드의 작성자, 제목, 내용 수정(UPDATE)
			String sql = "UPDATE qna " + "SET customer_id=?,qna_subject=?,qna_content=? " + "WHERE qna_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getCustomer_id());
			pstmt.setString(2, board.getQna_subject());
			pstmt.setString(3, board.getQna_content());
			pstmt.setInt(4, board.getQna_idx());

			updateCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateArticle() 오류 - " + e.getMessage());
		} finally {
			close(pstmt);
		}

		return updateCount;
	}

	public int insertReplyArticle(QnaBoardBean board) {
		int insertCount = 0;

		PreparedStatement pstmt = null;

		try {

			String sql = "INSERT INTO qna_reply VALUES (?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getQna_idx());
			pstmt.setString(2, board.getSeller_id());
			pstmt.setString(3, board.getQna_reply_content());
			// INSERT 구문 실행 및 결과 리턴받기 => insertCount 에 저장
			insertCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertArticle() 오류 - " + e.getMessage());
		} finally {

			close(pstmt);
		}

		return insertCount;
	}

	public QnaBoardBean selectArticle(int qna_idx) {
		// TODO Auto-generated method stub
		QnaBoardBean qna = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql="SELECT * FROM qna WHERE qna_idx=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,qna_idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				qna=new QnaBoardBean();
				
				qna.setQna_idx(rs.getInt("qna_idx"));
				qna.setCustomer_id(rs.getString("customer_id"));
				qna.setProduct_num(rs.getInt("product_num"));
				qna.setQna_subject(rs.getString("qna_subject"));
				qna.setQna_password(rs.getString("qna_password"));
				qna.setQna_content(rs.getString("qna_content"));				
				
				}
			
		
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertArticle() 오류 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return qna;
	}
	
	
	
}
