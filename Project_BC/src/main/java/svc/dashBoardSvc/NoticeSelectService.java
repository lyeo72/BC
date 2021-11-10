package svc.dashBoardSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.NoticeBoardDAO;
import vo.NoticeBean;

public class NoticeSelectService {

	public NoticeBean getArticle(int notice_num) {
		NoticeBean article = new NoticeBean();
		
		Connection con = getConnection();
		NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
		article = dao.selectNotice(notice_num);
		
		close(con);
		
		
		return article;
	}

}
