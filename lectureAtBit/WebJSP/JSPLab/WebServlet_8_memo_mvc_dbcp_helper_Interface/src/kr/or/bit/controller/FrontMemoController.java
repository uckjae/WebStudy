package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.MemoAddService;
import kr.or.bit.service.MemoIdCheckService;
import kr.or.bit.service.MemoListService;


@WebServlet("*.memo")
public class FrontMemoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FrontMemoController() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
	
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(url_Command.equals("/MemoAdd.memo")) { //글쓰기
    		try {
	    			action = new MemoAddService();
	    			forward = action.execute(request, response);
	        		System.out.println("forward 글쓰기");
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(url_Command.equals("/MemoList.memo")) { //목록보기
	    	try {
	    			action = new MemoListService();
	        		forward = action.execute(request, response);
	        		System.out.println("forward 목록보기");
			}catch(Exception e) {
				e.printStackTrace();
			}
    	}else if(url_Command.equals("/MemoId.memo")) { //ID 사용 유무
    		try {
	    			action = new MemoIdCheckService();
	    			forward = action.execute(request, response);
	        		System.out.println("forward ID 검색하기");
			}catch(Exception e) {
					e.printStackTrace();
			}
    	}else if(url_Command.equals("/MemoView.memo")) {
    		//UI 제공  //지금은 없는 서비스 .... 만약 ...
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/MemoView.jsp");

    	}
    	
    	
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { //true
    			response.sendRedirect(forward.getPath());
    		}else {
    			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
    	
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
