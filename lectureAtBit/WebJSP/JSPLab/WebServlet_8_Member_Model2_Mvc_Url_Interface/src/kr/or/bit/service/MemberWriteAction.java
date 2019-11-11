package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MvcRegisterDao;
import kr.or.bit.dto.MvcRegister;

//서비스를 담당하는 클래스(각각 1개)
public class MemberWriteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		int id = Integer.parseInt(request.getParameter("id"));
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		//controller -> service 객체 처리
		//dao , dto 처리
		
		MvcRegister dto = new MvcRegister();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		
		MvcRegisterDao dao = new MvcRegisterDao();
		int result = dao.writeOk(dto);
		
		String resultdata="";
		if(result > 0) {
			resultdata ="welcome to bit " + dto.getId() + "님";
		}else {
		   resultdata = "Insert Fail retry";
		}
		
		//3. 결과 저장하기 
		request.setAttribute("data", resultdata);
		
		//4.ActionForward 객체 생성
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/Register/Register_welcome.jsp");
		
		return forward;
	}

}
