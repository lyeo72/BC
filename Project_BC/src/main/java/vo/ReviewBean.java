package vo;

import java.sql.Date;

public class ReviewBean {
	
	private int review_idx;
	private int product_num;
	private String review_id;
	private String review_content;
	private String review_img;
	
	private double review_score;
	private Date review_date;
	/**
	 * @return the review_idx
	 */
	public int getReview_idx() {
		return review_idx;
	}
	/**
	 * @param review_idx the review_idx to set
	 */
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	/**
	 * @return the product_num
	 */
	public int getProduct_num() {
		return product_num;
	}
	/**
	 * @param product_num the product_num to set
	 */
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	/**
	 * @return the review_id
	 */
	public String getReview_id() {
		return review_id;
	}
	/**
	 * @param review_id the review_id to set
	 */
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	/**
	 * @return the review_content
	 */
	public String getReview_content() {
		return review_content;
	}
	/**
	 * @param review_content the review_content to set
	 */
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	/**
	 * @return the review_img
	 */
	public String getReview_img() {
		return review_img;
	}
	/**
	 * @param review_img the review_img to set
	 */
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	/**
	 * @return the review_score
	 */
	public double getReview_score() {
		return review_score;
	}
	/**
	 * @param review_score the review_score to set
	 */
	public void setReview_score(double review_score) {
		this.review_score = review_score;
	}
	/**
	 * @return the review_date
	 */
	public Date getReview_date() {
		return review_date;
	}
	/**
	 * @param review_date the review_date to set
	 */
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
	
	
	
	
}
