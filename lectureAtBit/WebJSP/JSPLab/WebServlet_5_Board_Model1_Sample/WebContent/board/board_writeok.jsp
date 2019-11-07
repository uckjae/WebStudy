<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

%>
<jsp:useBean id="board" class="kr.or.bit.dto.Board">
	<jsp:setProperty property="*" name="board"/>	
</jsp:useBean>
<%

	/* out.print(board.getSubject() + "<br>");
	out.print(board.getWriter() + "<br>");
	out.print(board.getEmail() + "<br>");
	out.print(board.getHomepage() + "<br>");
	out.print(board.getContent() + "<br>");
	out.print(board.getPwd() + "<br>");
	out.print(board.getFilename() + "<br>"); */
	
	BoardService service = BoardService.getInstance();
	int resut = service.writeOk(board);
	
	String msg="";
	String url="";
	if(resut>0){
		msg="insert success";
		url="board_list.jsp";
	}else{
		msg="insesrt fail";
		url="board_write.jsp";
	}
	
	request.setAttribute("board_msg", msg);
	request.setAttribute("board_url", url);

%>
<jsp:forward page="redirect.jsp"></jsp:forward>
<!-- 
DTO 객체 생성
데이터 받고 
받은 데이터 setter 넣는 것까지 자동
조건 : DTO가 가지는 member field 과 <input name="" 같아야 자동 setter 동작
Board dto = new Board();
dto.setTitle(request.getParameter("title");
-->





