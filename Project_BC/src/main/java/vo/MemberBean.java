package vo;

public class MemberBean {
	String id;
	String password;
	String name;
	int grade;
	
	
	
	public MemberBean() {}
	
	public MemberBean(String id, String password, String name, int grade) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.grade = grade;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
	
	
}