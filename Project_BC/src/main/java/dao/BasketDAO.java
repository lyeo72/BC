package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BasketBean;
import vo.ProductImg;

import static db.JdbcUtil.*;

public class BasketDAO {

    private BasketDAO() {}
    
    private static BasketDAO instance;

    public static BasketDAO getInstance() {
        // 기존의 인스턴스가 존재하지 않을 경우에만 인스턴스를 생성
        if(instance == null) {
            instance = new BasketDAO();
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
    
	// 사용자의 장바구니에 해당 상품이 이미 존재하는지 체크 후 존재할 경우 수량만 업데이트
	public int checkDupProduct(BasketBean basket) {
		System.out.println("BasketDAO - checkDupProduct()");
		int updateCount = 0;
		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
        ResultSet rs = null;
        
        try {
        	
    		String sql = "SELECT product_qty FROM basket WHERE product_num=? AND customer_id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, basket.getProduct_num());
    		pstmt.setString(2, basket.getCutomer_id());
    		rs = pstmt.executeQuery();
    		
    		int qty = 0;
    		if(rs.next()) {
    			// 기존에 장바구니에 담겨있던 제품 수량을 저장
    			qty = rs.getInt("product_qty");
    			
    			String sql2 = "UPDATE basket SET product_qty=? WHERE product_num=? AND customer_id=?";
    			pstmt2 = con.prepareStatement(sql2);
    			pstmt2.setInt(1, qty + basket.getProduct_qty());
    			pstmt2.setInt(2, basket.getProduct_num());
    			pstmt2.setString(3, basket.getCutomer_id());
    			
    			updateCount = pstmt2.executeUpdate();
    			
    		}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("checkDupProduct() 오류 - " + e.getMessage());
		} finally {
        	// 자원 반환
        	close(rs);
        	if(pstmt2 != null) {
        		close(pstmt2);
        	}
            close(pstmt);
        }
        
		
		return updateCount;
	}
    
    // 장바구니에 새로운 제품 담기
    public int insertBasket(BasketBean basket) {
    	System.out.println("BasketDAO - insertBasket()");
        int insertCount = 0;
        
        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;
        PreparedStatement pstmt3 = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        
        int idx = 1; 
		
        try {
        	// 현재 basket 테이블의 인덱스 최대 번호를 조회하여 조회된 결과 값에 + 1 값을 새 인덱스 번호로 지정
        	// => 만약, 조회된 제품이 하나도 없을 경우 새 인덱스 번호는 1번 그대로 사용
        	String sql = "SELECT MAX(basket_idx) FROM basket";
        	pstmt = con.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	// 조회된 인덱스 번호가 하나라도 존재할 경우
        	if(rs.next()) {
        		idx = rs.getInt(1) + 1;
        	}
        	
        	
        	// product_img는 product_img 테이블에서 product_num으로 조회해서 제품번호에 맞는 이미지 찾아서 
        	// 변수에 저장하고 밑에서 set
        	String product_img = "";
        	String sql2 = "SELECT product_img FROM product_img WHERE product_num=? AND product_img_location=1";
        	pstmt2 = con.prepareStatement(sql2);
        	pstmt2.setInt(1, basket.getProduct_num());
        	rs2 = pstmt2.executeQuery();
        	
        	if(rs2.next()) {
        		product_img = rs2.getString(1);
        	}
        	
        
            // 데이터 추가 작업을 위한 INSERT 작업 수행
            String sql3 = "INSERT INTO basket VALUES (?,?,?,?,?,?,?,?,?)";
            pstmt3 = con.prepareStatement(sql3);
            
            pstmt3.setInt(1, idx); // 인덱스
            pstmt3.setString(2, basket.getCutomer_id());	 //		고객 아이디
            pstmt3.setInt(3, basket.getProduct_num());   	 //		재품 번호
            pstmt3.setString(4, basket.getProduct_name());	 //		제품명
            pstmt3.setInt(5, basket.getProduct_price());     // 		재품 가격
            pstmt3.setInt(6, basket.getProduct_qty());		 // 		주문 수량
            pstmt3.setInt(7, basket.getProduct_discount());  //		상품 할인률
            pstmt3.setString(8, product_img); 				 //		제품 이미지
            pstmt3.setString(9, basket.getSname());			 // 		회사명
               
            insertCount = pstmt3.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("insertBasket() 오류 - " + e.getMessage());
        } finally {
        	// 자원 반환
        	close(rs);
        	close(rs2);
            close(pstmt);
            close(pstmt2);
            close(pstmt3);
        }
        
        return insertCount;
    }
    
    // 장바구니 페이지에 출력할 내용을 ArrayList에 저장
	public ArrayList<BasketBean> selectCartList(String customer_id) {
		System.out.println("BasketDAO - selectCartList()");
		ArrayList<BasketBean> cartList = null;
		
		PreparedStatement pstmt = null;
        ResultSet rs = null;
		
		try {
			
			String sql = "SELECT b.basket_idx, b.product_num, b.product_name, b.product_price, b.product_qty, b.product_discount, b.product_img, b.Sname, p.product_stock FROM basket b LEFT JOIN product p ON p.product_num = b.product_num WHERE customer_id=? ORDER BY b.basket_idx DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer_id);
			rs = pstmt.executeQuery();
			
			cartList = new ArrayList<BasketBean>();
			
			while(rs.next()) {
				BasketBean basket = new BasketBean();
				
				basket.setProduct_num(rs.getInt("product_num"));
				basket.setProduct_name(rs.getString("product_name"));
				basket.setProduct_price(rs.getInt("product_price"));
				basket.setProduct_qty(rs.getInt("product_qty"));
				basket.setProduct_discount(rs.getInt("product_discount"));
				basket.setProduct_img(rs.getString("product_img"));
				basket.setSname(rs.getString("Sname"));
				basket.setProduct_stock(rs.getInt("product_stock"));
				
				cartList.add(basket);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("selectCartList() 오류 - " + e.getMessage());
		} finally {
        	// 자원 반환
        	close(rs);
            close(pstmt);
        }
		
		
		return cartList;
	}

//-------------결제후 장바구니 비우기 작업 - 삭제할수도 있음
	public int cartDelete(String[] nums) {
		System.out.println("CartDAO - cartDelete");
		int deleteCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			for(String str : nums) {

				String sql = "select * from basket where product_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(str));
				rs = pstmt.executeQuery();
				
				if(rs.next()) {

					sql = "delete from basket where product_num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(str));
					
					deleteCount = pstmt.executeUpdate();
				}
			}
		} catch (Exception e) {
			System.out.println("cartDAO - cartDelete() 오류! - ");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return deleteCount;
	}


	
	// 장바구니 제품 수량 수정
	public int updateCart(int product_num, int product_qty, String customer_id) {
		System.out.println("BasketDAO - updateCart()");
		int updateCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE basket SET product_qty=? WHERE product_num=? AND customer_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_qty);
			pstmt.setInt(2, product_num);
			pstmt.setString(3, customer_id);
			
			updateCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("updateCart() 오류 - " + e.getMessage());
		} finally {
        	// 자원 반환
            close(pstmt);
        }
		
		return updateCount;
	}

	// 장바구니에서 제품 삭제
	public int deleteCart(int product_num, String customer_id) {
		System.out.println("basketDAO - deleteCart()");
		int deleteCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM basket WHERE product_num=? AND customer_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.setString(2, customer_id);
			
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
        	// 자원 반환
            close(pstmt);
        }
		
		return deleteCount;
	}

	public int CartCount(String customer_id) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) FROM basket WHERE customer_id =?";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1,customer_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
        	// 자원 반환
			close(rs);
            close(pstmt);
        }
		
		
		
		return count;
	}

	
}