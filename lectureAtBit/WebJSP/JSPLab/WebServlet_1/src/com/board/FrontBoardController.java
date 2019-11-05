package com.board;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/FrontBoardController")
public class FrontBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FrontBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

    //GET , POST 두가지 요청에 대해서 모두 동작하는 함수
    //1. servlet 제공하는 함수 : service()함수
    //2. 별도의 함수를 생성해서 개발자 마음: doProcess() 

    private void doProcess(HttpServletRequest request, HttpServletResponse response , String method) throws ServletException, IOException {
    	//GET, POST 모든 요청은 내가 처리
    	System.out.println("클라이언트 요청 : " + method);
    	
    	//1. 한글처리
    	
    	//2. 요청 받기 : request
    	
     	//3. 요청 판단 (판단의 기준 : parameter) : command 방식
    	//3.1 parameter 기준
    	//3.2 /board?cmd=login&userid=kglim&pwd=1004
    	
    	//String str = request.getParameter("cmd");
    	//if(str.equals("login") { 로그인 처리 }
    	
    	//board?cmd=boardlist
    	//String str = request.getParameter("cmd");
    	//if(str.equals("boardlist") { 게시판 조회 처리 }
    	
    	//TIP : URL 주소 판단 
    	//192.168.0.3:8090/website/board/boardlist
    	//192.168.0.3:8090/website/board/boardwrite?title=aaa&content=hello
    	
    	//마지막 주속 값 추출 : 판단기준
    	//boardlist  게시판 조회 처리
    	//boardwrite 게시판 글쓰기 처리 
    	
    	//4. 처리결과 저장
    	 	
    	
    	//5. view 정의
    	//view page 생성 : jsp
    	//WebContent > board > boarlist.jsp
    	//WebContent > error > error.jsp
    	//문제점 : 클라이언트가 직접 URL 명시 접근
    	//192.168.0.3:8090/WebServlet_1/board/boardlist.jsp
    	//실제 프로젝트 아래 처럼 .........................^^ POINT
    	//해결 : WEB-INF 보안폴더 : view 생성
    	//1. WEB-INF > views > board > boardlist.jsp (OK)
    	//2. WEB-INF > views > error > error.jsp (OK)
    	
    	//WAS 내부에서는 파일간 접근 가능 : forward 방식으로 처리
    	  	
    	
    	//6. view에게 전달
    	
    	/////////////////////////////////////////////////////////////////////
    	
    	//1. 요청 받기 (command)
    	//요청 주소 : 192.168.0.3:8090/WebServlet_1/board?cmd=list
    	String cmd = request.getParameter("cmd");
    	
    	//2. 요청 판단 (업무에 따라서 정의)
    	String viewpage =  null;
    	//cmd > null > error.jsp 뷰단으로
    	//cmd > boardlist > list.jsp 뷰
    	//cmd > boardwrite > write.jsp 뷰
    	if(cmd == null) {
    		viewpage = "/error/error.jsp";
    	}else if(cmd.equals("boardlist")) {
    		viewpage = "/board/boardlist.jsp";
    		//DB연결
    		//select ...
    		//실행 결과 (rs) > 객체 담기
    		//boardDao dao = new boardDao();
    		//List<board> boardlist = dao.selectBoardList();
    		//request.setAttribute("list",boardlist);
    		//forward >> view 전달  >> boardlist.jsp
    		//<c:set var="list" value=<%= request.getAttribute("list")%>
    		//<c:forEach ....
    	}else if(cmd.equals("boardwrite")) {
    		viewpage= "/board/boardwrite.jsp";
    	}else if(cmd.equals("login")) {
    		viewpage = "/WEB-INF/login/login.jsp"; //실 개발 코드 보안폴더 
    	}else {
    		viewpage = "/error/error.jsp";
    	}
    	
    	//결과 
    	//가정 : List<Emp> list = new ArrayList<>();
    	//list.add(new Emp(2000,"김유신");
    	//request.setAttribute("emplist",list)
    	
    	
    	//view 지정 
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	
    	//view forward
    	dis.forward(request, response);
    	
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response,"GET");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response,"POST");
	}

}
