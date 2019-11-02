<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" href="login_lee.jsp" id="pagesDropdown" role="button"  aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Login</span>
        </a>
        
      </li>
      <li class="nav-item">
        <a class="nav-link" href="JoinForm_lee.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Register</span></a>
      </li>
      <%
      if(!(session.getAttribute("userid") == null) && session.getAttribute("userid").equals("admin") ){
      %>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-table"></i>
          <span>MemberList</span></a>
      </li>
      <%} %>
    </ul>