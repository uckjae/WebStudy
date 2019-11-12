package kr.or.bit;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class carbasket
 */
@WebServlet("/carbasket")
public class CarBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CarBasketServlet() {
        super();
       
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//장바구니 목록보기 
    	//sessioin.setAttribute("productlist",list);
    	response.setContentType("text/html;charset=utf-8");
    	PrintWriter out = response.getWriter();
    	
    	HttpSession session = request.getSession();
    	System.out.println("sessionID : " + session.getId());
    	
    	/*
    	 	1.getSession() or getSession(true)
    	 	-HttpSession 타입의 session 객체가 이미 존재한다면 그 session 객체의 주소를 반환하고
    	 	-존재하지 않으면 새로운 세션 생성
    	 	2.1. getSession(false)
    	 	-HttpSession 타입의 session 객체가 이미 존재한다면 그 session 객체의 주소를 반환하고
    	 	-존재하지 않으면 null return
    	 */
    	out.print("<html>");
		out.print("<body>");
			out.print("<h3>장바구니</h3>");
			if(session !=null) {
				//구매한 상품 리스트 출력
				List<String> list = (ArrayList<String>)session.getAttribute("productlist");
				out.print("상품목록" + list.toString()+"<br>");
			}else {
				out.print("장바구니 비어 있어요<br>");
			}
			out.print("<a href='Product.html'>상품구매 페이지 이동</a>");
			out.print("<a href='cardelete'>장바구니 비우기</a>");
		out.print("</body>");
	
	
	out.print("</html>");
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
