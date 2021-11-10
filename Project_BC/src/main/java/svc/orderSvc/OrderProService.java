package svc.orderSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BasketDAO;
import dao.OrderDAO;

import vo.OrderBean;

public class OrderProService {

	public boolean InsertOrder(OrderBean order, String[] nums) {
		System.out.println("OrderProService - InsertOrder!");
		boolean isInsertSuccess = false;
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		orderDAO.setConnection(con);
		
		BasketDAO basketDao = BasketDAO.getInstance();
		basketDao.setConnection(con);
		
		
		for(String str : nums) {
			System.out.println("orderPro : "+str);
		}
		
		int insertCount = orderDAO.insertOrder(order, nums);
		int deleteCount = basketDao.cartDelete(nums);
		System.out.println("deleteCount : "+deleteCount);
		if(insertCount > 0 &&deleteCount>0) {
			commit(con);
			isInsertSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isInsertSuccess;
	}



}
