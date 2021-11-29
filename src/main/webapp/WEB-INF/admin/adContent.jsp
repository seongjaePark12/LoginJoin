<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>adContent</title>
  <%@ include file="/include/bs4.jsp" %>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>내용출력</h2>
		<hr/>
		<p><a href="${ctp}/adMemberList.ad?level=1">새로운 가입자(<font color="red"><b>${newMember}</b></font>건)</a></p> <!-- 준회원이 있을경우 인원출력 -->
		<hr/>
		<p>
			<a href="#">최근 게시글(<font color="red"><b>xx</b></font>건)</a>  <!-- 최근 게시글 보기 -->
			<a href="#">최근 댓글(<font color="red"><b>xx</b></font>건)</a>  <!-- 최근 댓글 보기 -->
		</p>
		<hr/>
		<p><a href="#">문의 사항(<font color="red"><b>xx</b></font>건)</a></p>
		<hr/>
		<p><a href="#">2(<font color="red"><b>xx</b></font>건)</a></p>
		<hr/>
		<p>오늘 방문횟수<font color="red"><b>xx</b></font>건</p>
		<hr/>
	</div>
	<br/>	
</body>
</html>