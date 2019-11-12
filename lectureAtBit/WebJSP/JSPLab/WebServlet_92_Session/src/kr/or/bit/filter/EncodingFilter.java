package kr.or.bit.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class EncodingFilter
 */
//@WebFilter("/EncodingFilter")
public class EncodingFilter implements Filter {
	
	//변수만들기
	private String encoding;
  
    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	
	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//request(doFilter 앞)(요청이 왔을 때 구현되는 보조관심)
		if(request.getCharacterEncoding() == null) {
			System.out.println("before : " + request.getCharacterEncoding());
			
			request.setCharacterEncoding("utf-8");
			
		}
		chain.doFilter(request, response);
		//response(doFilter 뒤)(응답할 때 처리되는 코드)
		System.out.println("after : " + request.getCharacterEncoding());
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		//최초요청시 컴파일 한번만 실행
		/*
		 <init-param>
  		<param-name>encoding</param-name>
  		<param-value>UTF-8</param-value>
  	</init-param>
		 */	
		this.encoding = fConfig.getInitParameter("encoding");
		System.out.println("Filter init :" + this.encoding);
	}

}
