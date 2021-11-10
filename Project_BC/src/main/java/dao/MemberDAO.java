package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import static db.JdbcUtil.*;

import vo.BoardBean;
import vo.CustomerBean;
import vo.MemberBean;
import vo.SellerBean;

public class MemberDAO {

	private static MemberDAO instance = new MemberDAO();

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {

		return instance;
	}

	Connection con = null;

	public void setConnection(Connection con) {
		this.con = con;
	}

	// ==================================================================================================

	public int insertMember(CustomerBean cBean) {

		int insertCount = 0;

		PreparedStatement pstmt = null;

		try {

			String sql = "INSERT INTO member VALUES(?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, cBean.getId());
			pstmt.setString(2, cBean.getPassword());
			pstmt.setString(3, cBean.getName());
			pstmt.setInt(4, cBean.getGrade());

			pstmt.executeUpdate();

			close(pstmt);

			sql = "INSERT INTO customer VALUES(?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, cBean.getCustomer_id());
			pstmt.setString(2, cBean.getPhone());
			pstmt.setString(3, cBean.getEmail());
			pstmt.setInt(4, cBean.getPersonal_data());

			insertCount = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(pstmt);
		}
		return insertCount;

	}

	public int foundRecommandID(String recommendId) {
		PreparedStatement pstmt = null;

		int isFoundSuccess = 0;
		try {

			String sql = "UPDATE customer SET recommend_id=recommend_id+1 WHERE customer_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, recommendId);

			isFoundSuccess = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(pstmt);
		}

		return isFoundSuccess;
	}

	public int insertSeller(SellerBean sBean) {
		int insertCount = 0;

		PreparedStatement pstmt = null;

		try {

			String sql = "INSERT INTO member VALUES(?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, sBean.getId());
			pstmt.setString(2, sBean.getPassword());
			pstmt.setString(3, sBean.getName());
			pstmt.setInt(4, sBean.getGrade());

			pstmt.executeUpdate();

			close(pstmt);

			sql = "INSERT INTO seller VALUES(?,?,?,?,?,?,?,?,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sBean.getSeller_id());
			pstmt.setInt(2, sBean.getsNO());
			pstmt.setString(3, sBean.getsName());
			pstmt.setString(4, sBean.getRoadAddress());
			pstmt.setString(5, sBean.getZoneCode());
			pstmt.setString(6, sBean.getDtl_addr());
			pstmt.setString(7, sBean.getPhone());
			pstmt.setString(8, sBean.getEmail());

			System.out.println(sBean.getDtl_addr() +" DAO");
			insertCount = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(pstmt);
		}
		return insertCount;
	}

	public boolean dupCheckId(String id) {
		boolean isDuplicate = false;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "SELECT id FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 아이디 붕복 체크 변수값을 true(중복)으로 변경
				isDuplicate = true;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}

		return isDuplicate ;
	}

	public int selectMember(MemberBean member) {
		System.out.println("MemberDAO - selectMember");
		int grade = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(member.getPassword());
		try {
			// 아이디, 패스워드 모두 전달하여 결과가 조회되면 성공 , 아니면 실패
			String sql = "SELECT id,grade FROM member WHERE id=? AND password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println("selectMember - 정상작동");
				grade = rs.getInt("grade");

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);

		}

		return grade;
	}

	public String getName(String id) {
		String name = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT name FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				name = rs.getString("name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return name;
	}

	///////////////////////////////////////////////////////////////////// ~~~~~~~~~~~~~~~~

	public int updateMember(CustomerBean customer) {

		int updateCount = 0;

		PreparedStatement pstmt = null;
		System.out.println(customer);
		try {

			String sql = "UPDATE customer set phone=?, email=? WHERE customer_id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer.getPhone());
			pstmt.setString(2, customer.getEmail());
			pstmt.setString(3, customer.getId());

			pstmt.executeUpdate();

			close(pstmt);

			sql = "UPDATE member set name=?, password=? WHERE id=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, customer.getName());
			pstmt.setString(2, customer.getPassword());
			pstmt.setString(3, customer.getId());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(pstmt);
		}
		return updateCount;

	}

	public int updateNonePasswordMember(CustomerBean customer) {

		int updateCount = 0;

		PreparedStatement pstmt = null;

		try {

			String sql = "UPDATE customer set phone=?, email=? WHERE customer_id=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, customer.getPhone());
			pstmt.setString(2, customer.getEmail());
			pstmt.setString(3, customer.getId());

			updateCount = pstmt.executeUpdate();

			close(pstmt);

			sql = "UPDATE member set name=? WHERE id=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, customer.getName());
			pstmt.setString(2, customer.getId());

			updateCount += pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return updateCount;
	}

	public CustomerBean selectCustomerInfo(MemberBean member) {

		CustomerBean customer = new CustomerBean();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			// 아이디, 패스워드 모두 전달하여 결과가 조회되면 성공 , 아니면 실패
			String sql = "SELECT id,name,password,email,phone FROM customer AS CUS JOIN member AS MEM ON CUS.customer_id = MEM.id WHERE MEM.id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {

				customer.setCustomer_id(rs.getString("id"));

				customer.setName(rs.getString("name"));
				customer.setPassword(rs.getString("password"));
				customer.setEmail(rs.getString("email"));
				customer.setPhone(rs.getString("phone"));
			}
			System.out.println(customer);
			System.out.println("3");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);

		}

		return customer;
	}

	public ArrayList<CustomerBean> selectMemberList() {
		ArrayList<CustomerBean> memberList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			String sql = "SELECT id,phone,email,grade,member_status FROM member AS mem Join customer AS cus ON mem.id = cus.customer_id "
					+ "union "
					+ "SELECT id,phone,email,grade,member_status FROM member AS mem Join seller AS sel ON mem.id = sel.seller_id";
//			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
     
			rs = pstmt.executeQuery();		
			memberList = new ArrayList<CustomerBean>();

		
			while (rs.next()) {
			
				CustomerBean member = new CustomerBean();
				
				member.setId(rs.getString("id"));	
				member.setPhone(rs.getString("phone"));
				member.setEmail(rs.getString("email"));
				member.setGrade(rs.getInt("grade"));
				member.setMember_status(rs.getInt("member_status"));
				

				// 1개 레코드가 저장된 BoardBean 객체를 List 객체에 추가
				memberList.add(member);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}
		
		
		
		
		return memberList;
	}

	public int isUpdateSellerStatus(String id) {
		int isUpdate=0;
		PreparedStatement pstmt = null;
		try {
			
			String sql = "update member MEM INNER JOIN seller SEL ON  MEM.id = SEL.seller_id"
			+" SET member_status=? WHERE MEM.id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setString(2, id);
			
			isUpdate = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return isUpdate;
	}
	
	public int isUpdateCustomerStatus(String id) {
		int isUpdate=0;
		PreparedStatement pstmt = null;
		try {
			
			String sql = "update member MEM INNER JOIN customer CUS ON  MEM.id = CUS.customer_id"
			+" SET member_status=? WHERE MEM.id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setString(2, id);
			
			isUpdate = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return isUpdate;
	}

	public int isDropMember(String id) {
		
		int idDrop=0;
		PreparedStatement pstmt = null;		
		try {
			
			String sql = "DELETE FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			idDrop = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return idDrop;		
	}	
	public int findGrade(String name) {
		int findGrade = 0;
		
		System.out.println("findGrade 작동중");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			// 아이디, 패스워드 모두 전달하여 결과가 조회되면 성공 , 아니면 실패 
			String sql = "SELECT grade FROM member WHERE name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,name);
			
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("findGrade- 정상작동");
				findGrade = rs.getInt("grade");
			
					
			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//자원 반환
			close(rs);
			close(pstmt);
			
		}
		return findGrade;
	}

	public String findCustomerId(String name, String email) {
		String id = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {
			
			// 아이디, 패스워드 모두 전달하여 결과가 조회되면 성공 , 아니면 실패 
			String sql = "SELECT customer_id"
					+ " FROM member , customer"
					+ " WHERE member.name=? AND customer.email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("findCustomerID - 정상작동");
				id = rs.getString("customer_id");
				
			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//자원 반환
			close(rs);
			close(pstmt);
			
		}

		return id;
	}

	public String findSellerId(String name, String email) {
		String id = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {
			
			// 아이디, 패스워드 모두 전달하여 결과가 조회되면 성공 , 아니면 실패 
			String sql = "SELECT seller_id"
					+ " FROM member , seller"
					+ " WHERE member.name=? AND seller.email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("findSellerId - 정상작동");
				id = rs.getString("seller_id");

			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//자원 반환
			close(rs);
			close(pstmt);
			
		}

		return id;
	}

	public String findCustomerEmail(String id) {
		String email = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {
			
			// 아이디, 패스워드 모두 전달하여 결과가 조회되면 성공 , 아니면 실패 
			String sql = "SELECT email FROM customer WHERE customer_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("findSellerId - 정상작동");
				email = rs.getString("email");

			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//자원 반환
			close(rs);
			close(pstmt);
			
		}

		return email;
	}

	public int findCustomerPwd(String id) {

		int pwd = 0; 
		
		PreparedStatement pstmt = null;
		try {
			

			String sql="UPDATE member SET password='123456789A' WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			
			pwd = pstmt.executeUpdate();
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("에러뜸");
		}finally {
			//자원 반환
			close(pstmt);
			
		}
		
		return pwd;

	}

	public int changePwd(String id,String newPwd) {
		int chageSuccess = 0;
		PreparedStatement pstmt = null;

		try {
			

			String  sql= "UPDATE member SET password=? WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, id);
			
			chageSuccess = pstmt.executeUpdate();
			
	
			System.out.println(chageSuccess);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("에러뜸");
		}finally {
			//자원 반환
			close(pstmt);
			
		}

		
		return chageSuccess;
	}

	public String findSellerEmail(String id) {
		String email = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {
			
			// 아이디, 패스워드 모두 전달하여 결과가 조회되면 성공 , 아니면 실패 
			String sql = "SELECT email FROM seller WHERE seller_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("findSellerId - 정상작동");
				email = rs.getString("email");

			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//자원 반환
			close(rs);
			close(pstmt);
			
		}

		return email;
	}


	
}
