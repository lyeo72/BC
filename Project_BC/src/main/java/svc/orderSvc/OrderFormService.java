package svc.orderSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import vo.BasketBean;
import vo.CustomerAddress;
import vo.CustomerBean;
import vo.CustomerInfo;
import vo.MemberBean;
import vo.ReviewBean;


public class OrderFormService {

	public ArrayList<BasketBean> getSelectCart(String[] nums) {
		System.out.println("orderService - getSelectCart()");
		// 공통작업-1. Connection Pool 로부터 Connection 객체 가져오기
		Connection con = getConnection();
		// 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
		OrderDAO dao = OrderDAO.getInstance();
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
		dao.setConnection(con);
		
		
		ArrayList<BasketBean> cartList = new ArrayList<BasketBean>();
		BasketBean basket = null;
		
		basket = new BasketBean();
		
		while(cartList.size()!=nums.length) {
			for(String num : nums) {
				
				basket = dao.selectBasket(Integer.parseInt(num));
				
				cartList.add(basket);
				}
			}
			
			close(con);
		
		
		return cartList;
		
		
	}

	public ArrayList<BasketBean> getSelectCart(String[] nums, String product_qty, String customer_id) {
		System.out.println("orderService - getSelectCart()");
		// 공통작업-1. Connection Pool 로부터 Connection 객체 가져오기
		Connection con = getConnection();
		// 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
		OrderDAO dao = OrderDAO.getInstance();
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
		dao.setConnection(con);
		
		
		ArrayList<BasketBean> cartList = new ArrayList<BasketBean>();
		BasketBean basket = null;
		
		basket = new BasketBean();
		
		while(cartList.size()!=nums.length) {
			for(String num : nums) {
				
				basket = dao.selectBasket(Integer.parseInt(num),Integer.parseInt(product_qty), customer_id);
				
				cartList.add(basket);
				}
			}
			
			close(con);
		
		
		return cartList;
	}

	public ArrayList<CustomerInfo> getCustomerInfo(String customer_id) {
		System.out.println("orderService - getCustomerAddress()");
		// 공통작업-1. Connection Pool 로부터 Connection 객체 가져오기
		Connection con = getConnection();
		// 공통작업-2. BoardDAO 클래스로부터 BoardDAO 객체 가져오기
		OrderDAO dao = OrderDAO.getInstance();
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
		dao.setConnection(con);
		
		ArrayList<CustomerInfo> customerInfo = dao.selectCustomerInfo(customer_id);
		
		
		close(con);
		return customerInfo;
	}



	

}
