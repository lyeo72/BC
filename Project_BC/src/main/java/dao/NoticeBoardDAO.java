package dao;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BoardBean;
import vo.NoticeBean;

public class NoticeBoardDAO {
    private NoticeBoardDAO() {}
    
    private static NoticeBoardDAO instance;

    public static NoticeBoardDAO getInstance() {
        // 기존의 인스턴스가 존재하지 않을 경우에만 인스턴스를 생성
        if(instance == null) {
            instance = new NoticeBoardDAO();
        }
        
        // 인스턴스 턴
        return instance;
    }
    // ========================================================================
    // DB 작업을 수행하기 위해 사용하는 Connection 타입 멤버변수 선언
    Connection con;

    // Connection 객체를 외부로부터 전달받아 저장하기 위한 Setter 메서드 정의
    public void setConnection(Connection con) {
        this.con = con;
    }
    
    public int insertArticle(NoticeBean board) {
        int insertCount = 0;
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        int num = 1; // 새 글 번호를 저장할 변수 선언
        
        try {
            
            // 글 등록 작업을 위한 INSERT
            // => 등록일(board_date)은 now() 함수 활용
            String sql = "INSERT INTO notice VALUES (null,?,?,now())";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, board.getNotice_subject());
            pstmt.setString(2, board.getNotice_content());
         
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

	public ArrayList<NoticeBean> selectNoticeList() {
		ArrayList<NoticeBean> articleList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM notice ORDER BY notice_num DESC";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			articleList = new ArrayList<NoticeBean>();
			
			while (rs.next()) {
				// BoardBean 객체를 생성하여 1개 레코드 정보를 BoardBean 객체에 저장
				// => 글번호, 작성자, 제목, 날짜, 조회수만 필요
				// (답글에 대한 들여쓰기를 위해 board_re_lev 값도 추가)
				NoticeBean notice = new NoticeBean();
				notice.setNotice_num(rs.getInt("notice_num"));
				notice.setNotice_subject(rs.getString("notice_subject"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_date(rs.getDate("notice_date"));

				// 1개 레코드가 저장된 BoardBean 객체를 List 객체에 추가
				articleList.add(notice);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}

		return articleList;
	}

	public NoticeBean selectNotice(int notice_num) {
		
		NoticeBean article = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			// 3단계. SQL 구문 작성 및 전달
			// -> 글번호(num)에 해당하는 게시물 상세 정보 조회 후 BoardBean 객체에 저장
			String sql = "SELECT * FROM notice WHERE notice_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 조회된 상세 정보를 BoardBean 객체에 저장
				article = new NoticeBean();

				article.setNotice_num(rs.getInt("notice_num"));
				article.setNotice_subject(rs.getString("notice_subject"));
				article.setNotice_content(rs.getString("notice_content"));
				article.setNotice_date(rs.getDate("notice_date"));
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

}
