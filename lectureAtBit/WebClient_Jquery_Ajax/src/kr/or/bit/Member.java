package kr.or.bit;

public class Member {
	private String username="bituser";
	private String password="1004";
	private String address="서울시강남구";
	private String amin="1";
	
	
	
	public Member() {
		super();
	}
	
	public Member(String username, String password, String address,String amin) {
		this.username = username;
		this.password = password;
		this.address = address;
		this.amin = amin;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAmin() {
		return amin;
	}
	public void setAmin(String amin) {
		this.amin = amin;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "username:"+username+"password:"+password+"address:"+address+"amin"+ amin;
	}
	
	
	
}
