package vo;

public class BasketBean {
	
	private int basket_idx;
	private String cutomer_id;
	private int product_num;
	private String product_name;
	private int product_price;
	private int product_qty;
	private int product_discount;
	private String product_img;
	private String Sname;
	private int product_stock;
	
	
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public int getBasket_idx() {
		return basket_idx;
	}
	public void setBasket_idx(int basket_idx) {
		this.basket_idx = basket_idx;
	}
	public String getCutomer_id() {
		return cutomer_id;
	}
	public void setCutomer_id(String cutomer_id) {
		this.cutomer_id = cutomer_id;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_qty() {
		return product_qty;
	}
	public void setProduct_qty(int product_qty) {
		this.product_qty = product_qty;
	}
	public int getProduct_discount() {
		return product_discount;
	}
	public void setProduct_discount(int product_discount) {
		this.product_discount = product_discount;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	

}
