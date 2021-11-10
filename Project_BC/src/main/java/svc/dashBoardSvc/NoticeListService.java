package svc.dashBoardSvc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.NoticeBoardDAO;
import vo.NoticeBean;

public class NoticeListService {

	public ArrayList<NoticeBean> getArticleList() {
		 Connection con = getConnection();
		
		NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
		
		dao.setConnection(con);
		
		ArrayList<NoticeBean> articleList = dao.selectNoticeList();
		
		
		return articleList;
	}

}
