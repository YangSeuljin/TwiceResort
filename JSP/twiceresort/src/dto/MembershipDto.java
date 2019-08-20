package dto;

public class MembershipDto {
	//DTO는 레코드 1개를 저장하는 클래스이다.

	private String id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String eagree;
	private String smsagree;


	//toString
	@Override
	public String toString() {
		return "MembershipDto [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email +",phone="+phone+",eagree="+eagree+",smsagree="+smsagree+"]";
	}
	//디폴트 생성자
	public MembershipDto() {
		super();
	}

	//매개변수가 들어가는 생성자
	public MembershipDto(String id, String password,String name, String email,
			String phone, String eagree, String smsagree) {
		this();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone= phone;
		this.eagree=eagree;
		this.smsagree=smsagree;
	

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

	public void setname(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String geteAgree() {
		return eagree;
	}

	public void seteagree(String eagree) {
		this.eagree = eagree;
	}

	public String getSmsagree() {
		return smsagree;
	}

	public void setSmsagree(String smsagree) {
		this.smsagree = smsagree;
	}



}
