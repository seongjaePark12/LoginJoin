<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>글쓰기폼</title>
  <%@ include file="../include/bs4.jsp" %>
</head>
<body>
<%@ include file="../include/header_home.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<p><br/></p>
	<div class="container">
		<form name="myform" method="post" action="<%=request.getContextPath()%>/GInputOk">
			<h2>방명록 글쓰기</h2>
			<div>성명 : <input type="text" name="name" autofocus required /></div>
			<div>이메일 : <input type="text" name="email" /></div>
			<div>홈페이지 : <input type="text" name="homepage" value="http://" /></div>
			<div>내용 : <textarea rows="5" cols="60" name="content" required /></textarea></div>
			<div>
				<button type="submit" class="btn btn-warning">방명록 등록</button>
				<button type="reset" class="btn btn-warning">다시입력</button>
				<button type="button" class="btn btn-warning" onclick="location.href='gList.jsp';">돌아가기</button>
			</div>
			<input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>"/>
		</form>
	</div>
	<br/>	
<%@ include file="../include/footer.jsp" %>
</body>
</html>