package dao;

import static db.JdbcUtil.close;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BasketBean;
import vo.CustomerAddress;
import vo.CustomerBean;
import vo.CustomerInfo;
import vo.MemberBean;
import vo.OrderBean;
import vo.Productbean;
import vo.ReviewBean;
import vo.orderDetailBean;
import vo.orderProductBean;

public class OrderDAO {
	private OrderDAO() {}
	
	private static OrderDAO instance;

	public static OrderDAO getInstance() {
		// 기존의 인스턴스가 존재하지 않을 경우에만 인스턴스를 생성
		if(instance == null) {
			instance = new OrderDAO();
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
//
//-------------------장바구니에서 상품번호와 일치하는 	
	public BasketBean selectBasket(int num) {
		System.out.println("orderDAO - selectCart()!");
		BasketBean basket = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from basket where product_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			basket = new BasketBean();
			
			while(rs.next()) {
				basket.setBasket_idx(rs.getInt("basket_idx"));
				basket.setCutomer_id(rs.getString("customer_id"));
				basket.setProduct_num(rs.getInt("product_num"));
				basket.setProduct_name(rs.getString("product_name"));
				basket.setProduct_price(rs.getInt("product_price"));
				basket.setProduct_qty(rs.getInt("product_qty"));
				basket.setProduct_discount(rs.getInt("product_discount"));
				basket.setProduct_img(rs.getString("product_img"));
				
			}
		} catch (Exception e) {
			System.out.println("selectCart() 오류! - "+e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return basket;
	}
	//바로구매 시 폼을 출력하기 위한 메소드
	public BasketBean selectBasket(int num, int product_qty, String customer_id) {
		System.out.println("orderDAO - selectCart()!");
		BasketBean basket = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product p left join product_img i on p.product_num = i.product_num where p.product_num = ? and i.product_img_location=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			basket = new BasketBean();
			
			while(rs.next()) {
				basket.setCutomer_id(customer_id);
				basket.setProduct_num(rs.getInt("product_num"));
				basket.setProduct_name(rs.getString("product_name"));
				basket.setProduct_price(rs.getInt("product_price"));
				basket.setProduct_qty(product_qty);
				basket.setProduct_discount(rs.getInt("product_discount"));
				basket.setProduct_img(rs.getString("product_img"));
				
			}
		} catch (Exception e) {
			System.out.println("selectCart() 오류! - "+e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return basket;
	}
	
	
	public ArrayList<CustomerInfo> selectCustomerInfo(String customer_id) {
		System.out.println("orderDAO - selectMemberInfo()!");
		ArrayList<CustomerInfo> customerInfo =null;
		
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try {
			String sql ="select m.id, m.name, c.phone, c.email, ca.customer_roadAddress, ca.customer_zonecode, ca.customer_dtl_addr, ca.address_priority from member m left join customer c on m.id= c.customer_id join customer_address ca on m.id=ca.customer_id where id=? and ca.address_priority=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer_id);
			
			rs = pstmt.executeQuery();
			
			customerInfo = new ArrayList<CustomerInfo>();
			
			while(rs.next()) {
			      // BoardBean 객체를 생성하여 1개 레코드 정보를 BoardBean 객체에 저장
			      // -> 글번호, 작성자, 제목, 날짜, 조회수만 필요
				CustomerInfo customer = new CustomerInfo();         
			      
				customer.setName(rs.getString("name"));
				customer.setEmail(rs.getString("email"));
				customer.setPhone(rs.getString("phone"));
				customer.setRoadAddress(rs.getString("customer_roadAddress"));
				customer.setZonecode(rs.getString("customer_zonecode"));
				customer.setDtl_addr(rs.getString("customer_dtl_addr"));
				
				customerInfo.add(customer); 
			}
	    
	    } catch (Exception e) {
			System.out.println("selectMemberInfo() 오류! - "+e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return customerInfo;
	}
	
	
	
	
//--------------------------------------멤버 객체 가져오기 끝
	public int insertOrder(OrderBean order, String[] nums) {
		System.out.println("OrderDAO - insertOrder()!");
		int insertCount = 1;
		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		
		int num = 1;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		
		try {
			// => 만약, 조회된 게시물이 하나도 없을 경우 새 글 번호는 1번 그대로 사용
			String sql = "SELECT MAX(order_num) FROM order_list";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// 조회된 글 번호가 하나라도 존재할 경우
			if(rs.next()) {
				num = rs.getInt(1) + 1;
				order.setOrder_num(num);
			}
			
		
			sql = "INSERT INTO order_list VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, num);
			pstmt2.setString(2, order.getCustomer_id());
			pstmt2.setString(3, order.getShipping_name());
			pstmt2.setString(4, order.getShipping_phone());
			pstmt2.setString(5, order.getShipping_zonecode());

			pstmt2.setString(6, order.getShipping_address());
			pstmt2.setString(7, order.getShipping_memo());
			pstmt2.setInt(8, order.getOrder_price());
			pstmt2.setString(9, order.getPay_method());
			pstmt2.setTimestamp(10, order.getOrder_date());
			pstmt2.setString(11, order.getOrder_status());
			pstmt2.setString(12, order.getTrans_num());
				
			
			
			int insertOrderCount = pstmt2.executeUpdate();
			
			if(insertOrderCount>0) {
				sql = "SELECT MAX(order_num) FROM order_product";
				pstmt3 = con.prepareStatement(sql);
				rs2 = pstmt3.executeQuery();
				
				// 조회된 글 번호가 하나라도 존재할 경우
				if(rs2.next()) {
					num = rs2.getInt(1) + 1;
					order.setOrder_num(num);
				}
				int qty = 0;
				for(String str : nums) {
					sql = "select * from basket where product_num = ?";
					pstmt3 = con.prepareStatement(sql);
					pstmt3.setInt(1, Integer.parseInt(str));
					rs2 = pstmt3.executeQuery();
					 
					if(rs2.next()) {
						System.out.println("OrderDAO - insertDetailOrder()-2!");

						qty =  rs2.getInt("product_qty");
						
							sql = "insert into order_product values(?,?,?,?,0)";
							pstmt4 = con.prepareStatement(sql);
							pstmt4.setInt(1, num);
							pstmt4.setString(2, order.getCustomer_id());
							pstmt4.setInt(3, Integer.parseInt(str));
							pstmt4.setInt(4, qty);
							
							pstmt4.executeUpdate();
							
							//메소드 불러오기
					
				}
			
			}
				if(insertCount>0) {
					insertCount = updateStock(order, nums);
				}
				
		}
			
	}
			catch (Exception e) {
			System.out.println("OrderDAO insertOrder() 오류! - " +e.getMessage());
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(pstmt2);
			close(pstmt3);
			close(pstmt4);
			close(rs);
			close(rs2);

			
		}
		
		return insertCount;
		
	}
	
//주문 완료 시 재고를 변경시키는 메소드
	public int updateStock(OrderBean order, String[] nums) {
		int updateStockCount = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		
		ResultSet rs = null;
		ResultSet rs2 = null;
		try {
			for(String str : nums) {
				System.out.println(str);
				String sql = "select product_stock from product where product_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(str));
				rs = pstmt.executeQuery();
				int stock=0;
				if(rs.next()) {
					
					stock =  rs.getInt("product_stock");
					
				sql = "select product_qty from basket where product_num=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, Integer.parseInt(str));
				System.out.println("stock :"+stock);
				
				rs2 = pstmt2.executeQuery();
					
				if(rs2.next()) {
					
					int qty = rs2.getInt("product_qty");
					if(stock-qty<0) {
						updateStockCount =0;
						System.out.println("주문등록 실패- 재고부족");
					}else {
					System.out.println("qty : "+qty);
					sql = "update product set product_stock=? where product_num=?";
					pstmt3 = con.prepareStatement(sql);
					pstmt3.setInt(1, stock-qty);
					pstmt3.setInt(2, Integer.parseInt(str));
					updateStockCount =pstmt3.executeUpdate();
					}
				}

				}	
				

}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return updateStockCount;
		
	}
	
	

//오더넘에 해당하는 오더리스트 출력

	public OrderBean selectOrderList(int order_num) {
		System.out.println("orderDAO - selectOrderList()!");
		OrderBean order = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from order_list where order_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order_num);
			
			rs = pstmt.executeQuery();
			
			order = new OrderBean();
			
			while(rs.next()) {
				order.setOrder_num(rs.getInt("order_num"));
				order.setCustomer_id(rs.getString("customer_id"));
				order.setShipping_name(rs.getString("shipping_name"));
				order.setShipping_phone(rs.getString("shipping_phone"));
				order.setShipping_zonecode(rs.getString("shipping_zonecode"));
				order.setShipping_address(rs.getString("shipping_address"));
				order.setOrder_price(rs.getInt("order_price"));
				order.setPay_method(rs.getString("pay_method"));
				order.setOrder_date(rs.getTimestamp("order_date"));
				order.setOrder_status(rs.getString("order_status"));
				order.setTrans_num(rs.getString("trans_num"));
				
			}
		} catch (Exception e) {
			System.out.println("selectCart() 오류! - "+e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return order;
	}
	
	
	public ArrayList<orderProductBean> selectOrderProductList(int order_num) {
		System.out.println("orderDAO - selectMemberInfo()!");
		System.out.println("BasketDAO - selectCartList()");
		ArrayList<orderProductBean> orderProductList = null;
		
		PreparedStatement pstmt = null;
        ResultSet rs = null;
		
		try {
			
			String sql = "SELECT * FROM order_product where order_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order_num);
			rs = pstmt.executeQuery();
			
			orderProductList = new ArrayList<orderProductBean>();
			
			while(rs.next()) {
				orderProductBean orderProduct = new orderProductBean();
				
				orderProduct.setOrder_num(rs.getInt("order_num"));
				orderProduct.setCustomer_id(rs.getString("customer_id"));
				orderProduct.setProduct_num(rs.getInt("product_num"));
				orderProduct.setProduct_qty(rs.getInt("product_qty"));
			
				
				orderProductList.add(orderProduct);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("selectCartList() 오류 - " + e.getMessage());
		} finally {
        	// 자원 반환
        	close(rs);
            close(pstmt);
        }
		
		
		return orderProductList;
	}
	
	//오더넘과 일치하는 프로덕트 넘들의 정보를 출력하는 메소드
	public orderDetailBean selectProduct(int product_num) {
		System.out.println("orderDAO - selectProduct()!");
		orderDetailBean orderDetail = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product p left join product_img i on p.product_num = i.product_num where p.product_num = ? and i.product_img_location=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			
			rs = pstmt.executeQuery();
			
			orderDetail = new orderDetailBean();
			
			while(rs.next()) {
				orderDetail.setProduct_num(rs.getInt("product_num"));
				orderDetail.setProduct_name(rs.getString("product_name"));
				orderDetail.setSname(rs.getString("seller_id"));
				orderDetail.setProduct_price(rs.getInt("product_price"));
				orderDetail.setProduct_discount(rs.getInt("product_discount"));
//				orderDetail.setProduct_stock(rs.getInt("product_stock"));
//				orderDetail.setProduct_qty(rs.getInt("product_qty"));
				orderDetail.setProduct_qty(rs.getInt("product_stock"));
				orderDetail.setProduct_discount(rs.getInt("product_discount"));
				orderDetail.setProduct_original_img(rs.getString("product_original_img"));
				orderDetail.setProduct_img(rs.getString("product_img"));
				
			}
		} catch (Exception e) {
			System.out.println("selectCart() 오류! - "+e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return orderDetail;
	}
	public ArrayList<OrderBean> selectCustomerOrderList(String id) {
		System.out.println("OrderDAO - selectCustomerOrderList()!");
		ArrayList<OrderBean> orderProduct =null;
		
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try {
			String sql ="select * from order_list where customer_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			orderProduct = new ArrayList<OrderBean>();
			
			while(rs.next()) {
			      // BoardBean 객체를 생성하여 1개 레코드 정보를 BoardBean 객체에 저장
			      // -> 글번호, 작성자, 제목, 날짜, 조회수만 필요
				OrderBean order = new OrderBean();         
			      
				order.setOrder_num(rs.getInt("order_num"));
				order.setOrder_price(rs.getInt("order_price"));
				order.setOrder_date(rs.getTimestamp("order_date"));
				order.setOrder_status(rs.getString("order_status"));
				orderProduct.add(order); 
			}
	    
	    } catch (Exception e) {
			System.out.println("selectCustomerOrderList() 오류! - "+e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return orderProduct;
	}
	
	
	
	
	
	

}


