package vo;

//CREATE TABLE `qna` (
//        `qna_idx` int(11) NOT NULL AUTO_INCREMENT,
//        `customer_id` varchar(15) COLLATE utf8_bin NOT NULL,
//        `product_num` int(11) NOT NULL,
//        `qna_subject` varchar(50) COLLATE utf8_bin NOT NULL,
//        `qna_password` varchar(20) COLLATE utf8_bin NOT NULL,
//        `qna_content` varchar(500) COLLATE utf8_bin NOT NULL,
//        PRIMARY KEY (`qna_idx`),
//        KEY `qna_cus_cus_id_fk` (`customer_id`),
//        KEY `qna_pro_pro_num_fk` (`product_num`),
//        CONSTRAINT `qna_cus_cus_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
//        CONSTRAINT `qna_pro_pro_num_fk` FOREIGN KEY (`product_num`) REFERENCES `product` (`product_num`)
//      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




public class QnaBoardBean {

    private int qna_idx;
    private String customer_id;
    private String seller_id;
	public String getQna_reply_content() {
		return qna_reply_content;
	}
	public void setQna_reply_content(String qna_reply_content) {
		this.qna_reply_content = qna_reply_content;
	}
	private int product_num;
    private String qna_subject;
    private String qna_password;
    private String qna_content;
    private String qna_reply_content;
    
    
    public int getQna_idx() {
        return qna_idx;
    }
    public void setQna_idx(int qna_idx) {
        this.qna_idx = qna_idx;
    }
    public String getCustomer_id() {
        return customer_id;
    }
    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }
    public int getProduct_num() {
        return product_num;
    }
    public void setProduct_num(int product_num) {
        this.product_num = product_num;
    }
    public String getQna_subject() {
        return qna_subject;
    }
    public void setQna_subject(String qna_subject) {
        this.qna_subject = qna_subject;
    }
    public String getQna_password() {
        return qna_password;
    }
    public void setQna_password(String qna_password) {
        this.qna_password = qna_password;
    }
    public String getQna_content() {
        return qna_content;
    }
    public void setQna_content(String qna_content) {
        this.qna_content = qna_content;
    }
    public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
    
    
    
    
    
    
}
