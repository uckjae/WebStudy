<%@page import="kr.or.bit.dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="Stylesheet" href="<%=request.getContextPath()%>/style/default.css" />
</head>
<body>
	<c:import url="/include/header.jsp"/>
	<%
		BoardService service = BoardService.getInstance();
		
		//게시물 총 건수
		int totalboardcount = service.totalBoardCount();
		
		//상세보기 다시 LIST 넘어올때... 현재페이지..
		String ps = request.getParameter("ps");
		String cp = request.getParameter("cp");
		if(ps==null || ps.trim().equals("")){
			ps = "5";
		}
		if(cp==null || cp.trim().equals("")){
			cp = "1";
		}
		int pagesize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pagecount = 0;
		
		if(totalboardcount%pagesize==0){
			pagecount = totalboardcount/pagesize;
		}else{
			pagecount = (totalboardcount/pagesize) + 1;	
		}
		
		out.print("<h3>pagesize : " + pagesize +" totalboardcount : " + totalboardcount +" currentpage : " + cpage +" pagecount : " + pagecount +"</h3>");
		
		List<Board> list = service.list(cpage, pagesize);
		
		out.print("데이터 건수" + list.size());
	%>
	
	<c:forEach var="board" items="<%=list %>">
		<li>${board.idx }</li>
		<li>${board.subject }</li>
		<li>${board.writer }</li>
		<li>${board.writedate }</li>
		<li>${board.readnum }</li>
	</c:forEach>
	
</body>
</html>