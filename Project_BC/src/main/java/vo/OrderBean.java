package vo;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderBean {
	  private String code;
	  private int order_num;
	  private String customer_id;
	  private String shipping_name;
	  private String shipping_phone;
	  private String shipping_zonecode;
	  private String shipping_address;

	  private String shipping_memo;
	  private int order_price;
	  private String pay_method;
	  private Timestamp order_date;
	  private String order_status;
	  private String trans_num;
	
	  
	  public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getTotal_discount() {
		return total_discount;
	}
	public void setTotal_discount(int total_discount) {
		this.total_discount = total_discount;
	}
	public int getShipping_fee() {
		return shipping_fee;
	}
	public void setShipping_fee(int shipping_fee) {
		this.shipping_fee = shipping_fee;
	}
	private int total_price;
	  private int total_discount;
	  private int shipping_fee; 
	  
	  
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getShipping_name() {
		return shipping_name;
	}
	public void setShipping_name(String shipping_name) {
		this.shipping_name = shipping_name;
	}
	public String getShipping_phone() {
		return shipping_phone;
	}
	public void setShipping_phone(String shipping_phone) {
		this.shipping_phone = shipping_phone;
	}
	public String getShipping_zonecode() {
		return shipping_zonecode;
	}
	public void setShipping_zonecode(String shipping_zonecode) {
		this.shipping_zonecode = shipping_zonecode;
	}
	public String getShipping_address() {
		return shipping_address;
	}
	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}
	
	public String getShipping_memo() {
		return shipping_memo;
	}
	public void setShipping_memo(String shipping_memo) {
		this.shipping_memo = shipping_memo;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public Timestamp setOrder_date(Timestamp date) {
		return this.order_date = date;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getTrans_num() {
		return trans_num;
	}
	public void setTrans_num(String trans_num) {
		this.trans_num = trans_num;
	}

	  
	  
	
	  
	  
}
