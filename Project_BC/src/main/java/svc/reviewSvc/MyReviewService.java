package svc.reviewSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.Productbean;
import vo.ReviewBean;
import vo.orderProductBean;

public class MyReviewService {
    public int getListCount(String id) {
//      System.out.println("BoardListService - getListCount()");
        // 공통작업-1. Connection Pool 로부터 Connection 객체 가져오기
//      Connection con = JdbcUtil.getConnection();
        Connection con = getConnection();
        
        // 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
        ReviewDAO dao = ReviewDAO.getInstance();
        
        // 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
        dao.setConnection(con);
        
        
        int listCount = dao.selectReviewListCount(id);
        System.out.println("listCount = " + listCount);
        
        // 공통작업-4. Connection 객체 반환
        close(con);
        
        return listCount;
    }

    public ArrayList<ReviewBean> getArticleList(String id) {
        // 공통작업-1. Connection Pool 로부터 Connection 객체 가져오기
//      Connection con = JdbcUtil.getConnection();
        Connection con = getConnection();
        
        // 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
        ReviewDAO dao = ReviewDAO.getInstance();
        
        // 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
        dao.setConnection(con);
        
        
        ArrayList<ReviewBean> articleList = dao.selectMyReviewArticleList(id);
        
        
        // 공통작업-4. Connection 객체 반환
        close(con);
        
        return articleList;
    }

    public ArrayList<Productbean> getOrderProductList(String id) {
        Connection con = getConnection();
        
        // 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
        ReviewDAO dao = ReviewDAO.getInstance();
        
        // 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
        dao.setConnection(con);
        
        
        ArrayList<Productbean> articleList = dao.selectMyOrderProductList(id);
        
        
        // 공통작업-4. Connection 객체 반환
        close(con);
        
        return articleList;
    }

}
