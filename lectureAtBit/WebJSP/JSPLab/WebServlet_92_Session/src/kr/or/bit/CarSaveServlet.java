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
 * Servlet implementation class CarSave
 */
@WebServlet("/carsave")
public class CarSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=utf-8");
    	PrintWriter out = response.getWriter();
    	
    	String product = request.getParameter("product");
    	
    	HttpSession session = request.getSession();
    	
    	System.out.println("sessionID : " + session.getId());
    	
    	List<String> list = (ArrayList<String>)session.getAttribute("productlist");
    	System.out.println("list Collection : " + list);
    	
    	if(product == null) {
    		System.out.println("상품을 선택하지 않으셨네요");
    	}else {
    		if(list==null) {
    			System.out.println("list Collectoin is null");
    			list = new ArrayList<String>();
    			list.add(product);
    			session.setAttribute("productlist", list);//다른 페이제에서 공유
    		}else {
    			System.out.println("list collection is not null");
    			list.add(product);
    		}
    	}
    	out.print("<html>");
    		out.print("<body>");
    			out.print("<a href='carbasket'>장바구니 보기</a>");
    		out.print("</body>");
    	
    	
    	out.print("</html>");
    	
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
