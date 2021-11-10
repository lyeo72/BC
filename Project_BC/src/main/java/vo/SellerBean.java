package vo;

public class SellerBean extends MemberBean{

	String seller_id;
	int sNO;
	String sName;
	String zoneCode;
	String dtl_addr;
	String roadAddress;
	String phone;
	String email;
	int status;

	public SellerBean() {}
	
	public SellerBean(String seller_id, int sNO, String sName,	String zoneCode ,String dtl_addr,String roadAddress ,String phone, String email, int status) {
		super();
		this.seller_id = seller_id;
		this.sNO = sNO;
		this.sName = sName;
		this.zoneCode = zoneCode;
		this.dtl_addr = dtl_addr;
		this.roadAddress = roadAddress;
		this.phone = phone;
		this.email = email;
		this.status = status;
	}

	public String getZoneCode() {
		return zoneCode;
	}

	public void setZoneCode(String zoneCode) {
		this.zoneCode = zoneCode;
	}

	public String getDtl_addr() {
		return dtl_addr;
	}

	public void setDtl_addr(String dtl_addr) {
		this.dtl_addr = dtl_addr;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public int getsNO() {
		return sNO;
	}

	public void setsNO(int sNO) {
		this.sNO = sNO;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
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

	public void setEmail(String email) {
		this.email = email;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
