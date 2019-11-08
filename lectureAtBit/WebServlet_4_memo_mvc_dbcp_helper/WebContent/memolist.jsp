<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table {
	
		    font-family: arial, sans-serif;
		    border-collapse: collapse; /* 붕괴하다 , 무너지다 */
		    width: 100%;
		}
		
		th {
		    border: 1px solid #dddddd;
		    text-align: center;
		    padding: 8px;
		}
		td{
		    border: 1px solid #dddddd;
			text-align: left;
			padding: 8px;
		}
		tr:nth-child(even) {  /* even 짝수     odd 홀수 */
		    background-color: #dddddd;
		}
	</style>
	
</head>
<body>
<c:set var="memolist" value="${requestScope.memolist}"></c:set>
<c:forEach var="itme" items="${memolist }">
	<li>${itme.id }</li>
	<li>${itme.email }</li>
	<li>${itme.content }</li>
</c:forEach>
<a href='memo.html'>글쓰기</a>
<script type="text/javascript">
	console.log("done?");
</script>
</body>
</html>