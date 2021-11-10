package vo;

public class ProductImg {

    
    private int product_num;
    private String product_original_img;
    private String Product_img;
    private int product_img_location;//1 -썸네일 2 - 상세이미지 
    
    
    
    public int getProduct_num() {
        return product_num;
    }
    public void setProduct_num(int product_num) {
        this.product_num = product_num;
    }
    public String getProduct_original_img() {
        return product_original_img;
    }
    public void setProduct_original_img(String product_original_img) {
        this.product_original_img = product_original_img;
    }
    public String getProduct_img() {
        return Product_img;
    }
    public void setProduct_img(String product_img) {
        Product_img = product_img;
    }
	public int getProduct_img_location() {
		return product_img_location;
	}
	public void setProduct_img_location(int product_img_location) {
		this.product_img_location = product_img_location;
	}

    
    
    
}
