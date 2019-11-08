
<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx_fk = request.getParameter("idx");//댓글의 원본 게시글 번호
	String no = request.getParameter("no");//댓글의 순번(고유값:pk)
	String pwd = request.getParameter("delPwd");//댓글에 입력한 암호
	
	if(idx_fk == null || no == null || pwd ==null || no.trim().equals("")){
		
	
%>
	<script type="text/javascript">
		history.back();
	</script>
<%
	return;
	}
	BoardService service = BoardService.getInstance();
	int result = service.replyDelete(no, pwd);
	
	String msg="";
	String url = "";
	if(result>0){
		msg="댓글 삭제 성공";
		url = "board_content.jsp?idx="+idx_fk;
	}else{
		msg="댓글 삭제 실패";
		url = "board_content.jsp?idx="+idx_fk;	
	}
	request.setAttribute("board_msg", msg);
	request.setAttribute("board_url", url);
%>
<jsp:forward page="redirect.jsp"></jsp:forward>
