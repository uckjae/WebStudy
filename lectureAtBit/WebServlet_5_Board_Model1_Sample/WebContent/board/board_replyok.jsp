<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String writer = request.getParameter("reply_writer");
	String content = request.getParameter("reply_content");
	String pwd = request.getParameter("reply_pwd");
	String idx_fk = request.getParameter("idx");
	String userid = "empty";
	
	BoardService service = BoardService.getInstance();
	int result = service.replyWrite(Integer.parseInt(idx_fk), writer, userid, content, pwd);
	
	String msg="";
	String url = "";
	if(result>0){
		msg="댓글 입력 성공";
		url = "board_content.jsp?idx="+idx_fk;
	}else{
		msg="댓글 입력 성공";
		url = "board_content.jsp?idx="+idx_fk;	
	}
	request.setAttribute("board_msg", msg);
	request.setAttribute("board_url", url);
%>
<<jsp:forward page="redirect.jsp"></jsp:forward>






