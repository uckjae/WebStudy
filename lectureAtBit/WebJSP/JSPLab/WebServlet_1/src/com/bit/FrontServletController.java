package com.bit;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(description = "이 녀석은 controller 입니다", 
			urlPatterns = { "/Front.do" })
public class FrontServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FrontServletController() {
        super();
        // TODO Auto-generated constructor stub
    }

	//service 있으면 doGET() , doPOST() 실행되지 않아요
	//protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("요청이 들어왔어요 ^^");
		//192.168.0.3:8090/WebServlet_1/Front.do?cmd=greeting
		
		String cmd = request.getParameter("cmd");
		
		String msg="";
		if(cmd.equals("greeting")) {
			//필요하다면 객체 생성
			Message m = new Message();
			msg = m.getMessage(cmd);
		}
		
		request.setAttribute("msg",msg);
		
		RequestDispatcher dis = request.getRequestDispatcher("/greeting.jsp");
		
		dis.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
