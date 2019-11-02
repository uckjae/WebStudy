package kr.or.bit;

public class Emp {
	private int empno;
	private String name;
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return name;
	}
	public void setEname(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		
		return empno + name;
	}
	
	
}
