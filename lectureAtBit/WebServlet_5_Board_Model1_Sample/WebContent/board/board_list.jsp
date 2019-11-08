<%@page import="kr.or.bit.utils.ThePager"%>
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
	<c:import url="/include/header.jsp" />
	게시판 목록
	<br>
	<%
		BoardService service = BoardService.getInstance();
	
		//게시물 총 건수
		int totalboardcount = service.totalBoardCount();
		
		//상세보기 다시 LIST 넘어올때 ... 현재 페이지 ..
		String ps = request.getParameter("ps"); //pagesize
		String cp = request.getParameter("cp");    //current page
		
		if(ps == null || ps.trim().equals("")){
			//default 값 설정
			ps = "5";
		}
		if(cp == null || cp.trim().equals("")){
			//default 값 설정
			cp = "1";
		}
		int pagesize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pagecount =0;
		
		if(totalboardcount % pagesize == 0){
			pagecount = totalboardcount / pagesize;
		}else{
			pagecount = (totalboardcount / pagesize) +1;
		}
		//102건 : pagesize = 5 , pagecount = 21페이지 
		out.print(" <h3>pagesize :" + pagesize + "</h3>"); 
		out.print(" <h3>totalboardcount :" + totalboardcount + "</h3>"); 
		out.print(" <h3>currentpage : " + cpage + "</h3>"); 
		out.print(" <h3>pagecount : " + pagecount + "</h3>"); 
		
	    List<Board> list = service.list(cpage,pagesize);
	    //http://localhost:8090/WebServlet_5_Board_Model1_Sample/board/board_list.jsp?ps=5&cp=1
	    //out.print("데이터 건수 : " + list.size());
	%>
	<c:set var="pagesize" value="<%=pagesize %>"/>
	<c:set var="cpage" value="<%=cpage %>"/>
	<c:set var="pagecount" value="<%=pagecount %>"/>

	<div id="pagecontainer">
		<div style="padding-top: 30px; text-align: cetner">
			<table width="80%" border="1" cellspacing="0" align="center">
				<tr>
					<td colspan="5">
						<form name="list" >
						PageSize설정: 
							<select name="ps" onchange="submit()">
							<%
				   					/* 
				   					    form action 값이 없이 submit()
				   					    Url 에 주소값으로 요청  ^^^^^^^^^^^^^^^^^^^^ 
				   					        현재 주소창에 써있는 주소가 action 의 주소값입니다 
				   					    http://localhost:8090/Web_Servelt_4_board/board/board_list.jsp?ps=10
				   					       서버에 요청
				   					    
				   					    
				   					
				   						for(int i =5 ; i <=20 ;i+=5){
										if(pagesize == i){
											out.println("<option value='" + i + "' selected='selected'>" + i +"개</option>");
										}else{
											out.println("<option value='" + i + "'>" + i +"개</option>");
										}
										} 
									*/
		   						%>
		   						<c:forEach var="i" begin="5" end="20" step="5">
		   							<c:choose>
		   								<c:when test="${pagesize ==i }">
		   									<option value="${i }" selected>${i }건</option>
		   								</c:when>
		   								<c:otherwise>
		   									<option value="${i }">${i}건</option>
		   								</c:otherwise>
		   							</c:choose>
		   						</c:forEach>
		   					</select>
						</form>
					</td>
				</tr>
				<tr>
					<th width="10%">순번</th>
					<th width="40%">제목</th>
					<th width="20%">글쓴이</th>
					<th width="20%">날짜</th>
					<th width="10%">조회수</th>
				</tr>
				<!-- 데이터가 한건도 없는 경우  -->
				<%
		     		if(list==null ||list.size()==0){
		     			out.print("<tr><td colspan='5'>데이터가 없습니다</td></tr>");
		     		}
		        %>
				<!-- forEach()  목록 출력하기  -->
				<c:forEach var="board" items="<%=list %>">
					<tr onmouseover="this.style.backgroundColor='gray'" onmouseout="this.style.backgroundColor='white'">
						<td>${board.idx }</td>
						<td>
							<c:forEach var="i" begin="1" end="${board.depth }" step="1">
								&nbsp;&nbsp;&nbsp;
							</c:forEach>
							<c:if test="${board.depth > 0 }">
								<img src="../images/re.gif"/>
							</c:if>
							<a href="board_content.jsp?idx=${board.idx}&cp=${cpage}&ps=${pagesize}">
								<c:choose>
									<c:when test="${board.subject !=null && fn:length(board.subject)>10 }">
										${fn:substring(board.subject,0,10) }....
									</c:when>
									<c:otherwise>
										${board.subject}
									</c:otherwise>
								</c:choose>
							</a>
						</td>
						<td>${board.writer }</td>
						<td>${board.writedate }</td>
						<td>${board.readnum }</td>
				</c:forEach>
				<!-- forEach()  -->
				<tr>
					<td colspan="5" align="center">
						<hr width="100%" color="red">
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
					<!--  
					원칙적인 방법 아래 처럼 구현
					[1][2][3][다음]
					[이전][4][5][6][다음]
					[이전][7][8][9][다음]
					[이전][10][11]
					
					현재 아래 코드 [][][][][][][]...
					-->
					
						<!--이전 링크 --> 
						<c:if test="${cpage>1}">
							<a href="board_list.jsp?cp=${cpage-1}&ps=${pagesize}">이전</a>
							<!--페이지 리스트 구현  -->
						</c:if> 
						<c:forEach var="i" begin="1" end="${pagecount}" step="1">
							<c:choose>
								<c:when test="${cpage==i}">
									<font color='red'>[${i}]</font>
								</c:when>
								<c:otherwise>
									<a href="board_list.jsp?cp=${i}&ps=${pagesize}">[${i}]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
						<!--다음 링크 --> 
						<c:if test="${cpage<pagecount}">
							<a href="board_list.jsp?cp=${cpage+1}&ps=${pagesize}">다음</a>
						</c:if> 
						
					</td>
					<td colspan="2" align="center">총 게시물 수 : <%=totalboardcount %>
					</td>
				</tr>
				<tr>
					<td colspan="5" align="center">
					<%
						int pagersize=3;
						ThePager pager = new ThePager(totalboardcount,cpage,pagesize,pagersize,"board_list.jsp");
					%>
					<%=pager %>
					</td>
			</table>
		</div>
	</div>
</body>
</html>