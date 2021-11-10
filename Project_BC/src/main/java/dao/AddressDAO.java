package dao;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.CustomerAddress;

public class AddressDAO {

private static AddressDAO instance = new AddressDAO();
	
	private AddressDAO() {}

	public static AddressDAO getInstance() {

		return instance;
	}

	Connection con = null;

	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int insertAddress(CustomerAddress ca) {
		
			int insertCount = 0;
			
			PreparedStatement pstmt1 = null;
			PreparedStatement pstmt2 = null;
			
			try {
//				System.out.println(ca.toString());
				if(ca.getAddress_priority() == 1) {
					String sql = "UPDATE customer_address SET address_priority = 0";
					pstmt1 = con.prepareStatement(sql);
					pstmt1.executeUpdate();
				}
				
				String sql="INSERT INTO customer_address VALUES (?,?,?,?,?)";
				pstmt2 = con.prepareStatement(sql);
				
				pstmt2.setString(1, ca.getCustomerId());
				pstmt2.setString(2, ca.getRoadAddress());
				pstmt2.setString(3, ca.getZonecode());
				pstmt2.setString(4, ca.getDtl_addr());
				pstmt2.setInt(5, ca.getAddress_priority());
				
				insertCount = pstmt2.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("insertAddress() 오류 - " + e.getMessage());
			}finally {
				//자원 반환
				close(pstmt1);
				close(pstmt2);
			}
			return insertCount;
			
		}

	public ArrayList<CustomerAddress> selectAddressList(String id) {
		ArrayList<CustomerAddress> addressList = new ArrayList();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
//			con = getConnection();

			String sql = "SELECT * FROM customer_address WHERE customer_id=? ORDER BY address_priority DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 조회된 상세 정보를 BoardBean 객체에 저장
				CustomerAddress address = new CustomerAddress();
				
				address.setCustomerId(rs.getString("customer_id"));
				address.setRoadAddress(rs.getString("customer_roadAddress"));
				address.setZonecode(rs.getString("customer_zonecode"));
				address.setDtl_addr(rs.getString("customer_dtl_addr"));
				address.setAddress_priority(rs.getInt("address_priority"));
				
				addressList.add(address);
				
			}

		} catch (Exception e) {
			System.out.println("selectAddressList() 오류 - " + e.getMessage());
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}

		return addressList;
	}

	public int updateAddress(CustomerAddress address) {
		int updateCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE customer_address SET address_priority = 0";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql="UPDATE customer_address SET address_priority = 1 WHERE customer_id = ? AND customer_roadAddress = ? AND customer_zonecode = ? AND customer_dtl_addr = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, address.getCustomerId());
			pstmt.setString(2, address.getRoadAddress());
			pstmt.setString(3, address.getZonecode());
			pstmt.setString(4, address.getDtl_addr());
			
			updateCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateAddress() 오류 - " + e.getMessage());
		}finally {
			//자원 반환
			close(pstmt);	
		}
		return updateCount;
	}
	
}
