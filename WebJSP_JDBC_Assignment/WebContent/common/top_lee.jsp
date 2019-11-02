<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index_lee.jsp">스타일을 입혀봅시다</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>
    
    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link" href="index_lee.jsp" id="alertsDropdown" role="button"  aria-haspopup="true" aria-expanded="false">
          Main          
        </a>
  
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="login_lee.jsp" id="messagesDropdown" role="button" aria-haspopup="true" aria-expanded="false">
           Longin
        </a>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="JoinForm_lee.jsp" id="userDropdown" role="button" aria-haspopup="true" aria-expanded="false">
          Register
        </a>
        
      </li>
      <%
	if(session.getAttribute("userid") !=null){
		out.print("<li class='nav-item dropdown no-arrow'><a class='nav-link dropdown-toggle' href='logOut_lee.jsp' role='button' aria-haspopup='true' aria-expanded='false'>"
		+session.getAttribute("userid")+"로그아웃하기"+"</a></li> ");
		
	}else{
		out.print("<li class='nav-item dropdown no-arrow'><a class='nav-link dropdown-toggle' href='login_lee.jsp' role='button' aria-haspopup='true' aria-expanded='false'>"
				+"로그인하기"+"</a></li> ");
	}

%>
    </ul>

  </nav>