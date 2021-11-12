<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String nickName = (String)request.getAttribute("nickName");
	int res = (int) request.getAttribute("res");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>nickName</title>
  <%@ include file="../../include/bs4.jsp" %>
  <script>
  	function sendCheck(){
  		opener.window.document.myform.nickName.value = "<%=nickName%>";
  		opener.window.document.myform.name.focus();
  		window.close();
  	}
  	function nickCheck(){
  		var nickName = childForm.nickName.value;
  		
  		if(nickName == ""){
  			alert("닉네임 입력하세요");
  			childForm.nickName.focus();
  		}
  		else{
  			childForm.submit();
  		}
  	}
  </script>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h3>닉네임 체크폼</h3>
		<%if(res == 1){ %>
				<h4><%=nickName %>닉네임는 사용가능 합니다</h4>
				<p><input type="button" value="창닫기" onclick="sendCheck()"/></p>
		<%}else{ %>
				<h4><%=nickName %>중복된닉네임 입니다</h4>
				<form name="childForm" method="post" action="<%=request.getContextPath()%>/nickCheck.mem">
					<input type="text" name="nickName"/>
					<input type="button" value="닉네임검색" onclick="nickCheck()"/>
				</form>
		<%} %>
	</div>
	<br/>	
</body>
</html>