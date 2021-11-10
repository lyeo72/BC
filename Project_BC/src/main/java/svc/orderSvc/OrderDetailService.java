package svc.orderSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import vo.BasketBean;
import vo.Productbean;
import vo.orderDetailBean;

public class OrderDetailService {

	public ArrayList<orderDetailBean> getSelectProduct(int[] product_nums) {
		System.out.println("orderService - getSelectCart()");
		// 공통작업-1. Connection Pool 로부터 Connection 객체 가져오기
		Connection con = getConnection();
		// 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
		OrderDAO dao = OrderDAO.getInstance();
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
		dao.setConnection(con);
		
		
		ArrayList<orderDetailBean> orderDetailList = new ArrayList<orderDetailBean>();
		orderDetailBean orderDetail = null;
		
		orderDetail = new orderDetailBean();
		
		while(orderDetailList.size()!=product_nums.length) {
			for(int product_num : product_nums) {
				orderDetail = dao.selectProduct(product_num);
				
				orderDetailList.add(orderDetail);
				}
			}
			
			close(con);
		
		
		return orderDetailList;
		
	}

}