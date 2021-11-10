package vo;
/*
   CREATE TABLE member_BC (
         member_id VARCHAR(16) NOT NULL PRIMARY_KEY,
         member_pass VARCHAR(20) NOT NULL
         member_name VARCHAR(12) NOT NULL,
         member_phone VARCHAR(13) NOT NULL,
         member_email VARCHAR(50) NOT NULL UNIQUE,
         member_recommendID INT(20) NOT NULL UNIQUE,
         member_personalData VARCHAR(1) NOT NULL,
         member_grand INT(4) NOT NULL
   );
 */
public class CustomerBean extends MemberBean {
	private String customer_id;
	private String phone;
	private String email;
    private String recommend_id;
    private int personal_data;
    private int member_status;
    
	



	public CustomerBean() {}
	
	
	
	public CustomerBean(String customer_id, String phone, String eamil, String recommend_id, int personal_data) {
		super();
		this.customer_id = customer_id;
		this.phone = phone;
		this.email = eamil;
		this.recommend_id = recommend_id;
		this.personal_data = personal_data;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String eamil) {
		this.email = eamil;
	}

	public String getRecommend_id() {
		return recommend_id;
	}

	public void setRecommend_id(String recommend_id) {
		this.recommend_id = recommend_id;
	}

	public int getPersonal_data() {
		return personal_data;
	}

	public void setPersonal_data(int personal_data) {
		this.personal_data = personal_data;
	}
	
	public int getMember_status() {
		return member_status;
	}



	public void setMember_status(int member_status) {
		this.member_status = member_status;
	}




    @Override
    public String toString() {
        return "CustomerBean [id=" + id + ", phone=" + phone + ", email=" + email + ", password="
                + password + ", recommend_id=" + recommend_id + ", personal_data=" + personal_data + "]";
    }
	
	
	
	
}







