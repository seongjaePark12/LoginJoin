<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="<%=request.getContextPath()%>/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/guest/gList.jsp">방명록</a>
      </li>
<%		if(level != 99 && level != 1 ){ %>      
      <li class="nav-item">
        <a class="nav-link" href="#">게시판</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">자료실</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">학습실</a>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/URLMapping">URL(디렉토리)매핑</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/URLMapping.url">URL(확장자)매핑</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/URLMapping.url2">URL(확장자)매핑2</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/password">비밀번호암호화</a>
		    </div>
      </li>
<%		} %>      
<%		if(level != 99){ %>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">마이페이지</a>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/memMain.mem">회원방</a>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/memUpdate.mem">회원정보변경</a>	
<% 				if(level != 1){%>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/memList.mem">회원리스트</a>
<%				} %>
<%				if(level != 0){ %>
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/memDelete.mem">회원탈퇴</a>
<%				} %>		
<%				if(level == 0){ %>      
		      <a class="dropdown-item" href="<%=request.getContextPath()%>/.mem">관리자페이지</a>
<%				} %>
		    </div>
      </li>
      <li class="nav-item">
        	<a class="nav-link" href="<%=request.getContextPath()%>/memLogOut.mem">로그아웃</a>
			</li>
<% 			}else{%>
			<li class="nav-item">
        	<a class="nav-link" href="<%=request.getContextPath()%>/memLogin.mem">로그인</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/memJoin.mem">회원가입</a>
      </li>
<%			} %>
    </ul>
  </div>  
</nav>