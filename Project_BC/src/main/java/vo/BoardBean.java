package vo;

import java.sql.Date;

public class BoardBean {


    private int product_num; // 제품 번호
    private String product_name; //상품이름
    private String seller_id; // 회사이름
    private String product_category;// 상품 카테고리
    private int product_price; // 상품 가격
    private int product_weight; // 상품 무게
    private int product_discount; // 할인율
    private Date product_date; // 게시글 등록 일
    private int product_stock; // 제품 수량
    private String product_expiration_date;// 제품 유통기한
    private String product_handling; // 제품 보관방법
    private String product_material;//  제품 원재료명 및 함량.
    private double product_review_score; // 리뷰 평점
    private int reviewCount;
    private String Sname;
    
    public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public double getProduct_review_score() {
		return product_review_score;
	}
	public void setProduct_review_score(double product_review_score) {
		this.product_review_score = product_review_score;
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
    public String getSeller_id() {
        return seller_id;
    }
    public void setSeller_id(String seller_id) {
        this.seller_id = seller_id;
    }
    public String getProduct_category() {
        return product_category;
    }
    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }
    public int getProduct_price() {
        return product_price;
    }
    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }
    public int getProduct_weight() {
        return product_weight;
    }
    public void setProduct_weight(int product_weight) {
        this.product_weight = product_weight;
    }
    public int getProduct_discount() {
        return product_discount;
    }
    public void setProduct_discount(int product_discount) {
        this.product_discount = product_discount;
    }

    public Date getProduct_date() {
        return product_date;
    }
    public void setProduct_date(Date product_date) {
        this.product_date = product_date;
    }
    public int getProduct_stock() {
        return product_stock;
    }
    public void setProduct_stock(int product_stock) {
        this.product_stock = product_stock;
    }
    public String getProduct_expiration_date() {
        return product_expiration_date;
    }
    public void setProduct_expiration_date(String product_expiration_date) {
        this.product_expiration_date = product_expiration_date;
    }
    public String getProduct_handling() {
        return product_handling;
    }
    public void setProduct_handling(String product_handling) {
        this.product_handling = product_handling;
    }
    public String getProduct_material() {
        return product_material;
    }
    public void setProduct_material(String product_material) {
        this.product_material = product_material;
    }
    
    
    
    
    
}
