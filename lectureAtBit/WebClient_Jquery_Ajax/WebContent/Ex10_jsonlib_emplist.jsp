
<%@page import="net.sf.json.JSONArray"%>
<%@page import="kr.or.bit.Emp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% response.addHeader("Access-Control-Allow-Origin", "*"); %>    
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bituser","1004");
	//out.print(conn.isClosed());
	
	stmt = conn.createStatement();
	String sql= "select empno ,ename , sal , job from emp";
	
	rs = stmt.executeQuery(sql);
	
	//여러건 데이터 (객체로 담아 놓고 싶어요 : collection)
	//객체 배열에 담을려면  DTO클래스(class Emp)
	List<Emp> list = new ArrayList();
	
	//while(rs.next()){rs.getInt("empno")}
	//if(rs.next()){}else{}
	//if(rs.next()){do{}while(rs.next())}
	
	//코드 처리
	while(rs.next()){
		Emp emp = new Emp();
		emp.setEmpno(rs.getInt(1));
		emp.setEname(rs.getString(2));
		emp.setSal(rs.getInt(3));
		emp.setJob(rs.getString(4));
		list.add(emp);
	}
	//for(Emp e :list){
	//	String json = "["+"{"+"empno:"+e.getEmpno()
	//}
	//변환 작업(JSON 객체)
	JSONArray jsonlist = JSONArray.fromObject(list);
	
	/*  
	[
	 {empno:7788,},
	 {}
	 
	 
	 ]
			 
	 [{"empno":7369,"ename":"SMITH","job":"CLERK","sal":800},
	  {"empno":7499,"ename":"ALLEN","job":"SALESMAN","sal":1600},
	  {"empno":7521,"ename":"WARD","job":"SALESMAN","sal":1250},
	  {"empno":7566,"ename":"JONES","job":"MANAGER","sal":2975},
	  {"empno":7654,"ename":"MARTIN","job":"SALESMAN","sal":1250},
	  {"empno":7698,"ename":"BLAKE","job":"MANAGER","sal":2850},
	  {"empno":7782,"ename":"CLARK","job":"MANAGER","sal":2450},
	  {"empno":7788,"ename":"SCOTT","job":"ANALYST","sal":3000},
	  {"empno":7839,"ename":"KING","job":"PRESIDENT","sal":5000},
	  {"empno":7844,"ename":"TURNER","job":"SALESMAN","sal":1500},
	  {"empno":7876,"ename":"ADAMS","job":"CLERK","sal":1100},
	  {"empno":7900,"ename":"JAMES","job":"CLERK","sal":950},
	  {"empno":7902,"ename":"FORD","job":"ANALYST","sal":3000},
	  {"empno":7934,"ename":"MILLER","job":"CLERK","sal":1300}]
	*/
%>
<%=jsonlist %>











