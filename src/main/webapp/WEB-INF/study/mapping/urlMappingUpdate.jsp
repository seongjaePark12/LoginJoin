<%@page import="study.mapping2.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	userVO vo = (userVO) request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>urlMappingUpdate</title>
  <%@ include file="../../../include/bs4.jsp" %>
</head>
<body>
<%@ include file="../../../include/header_home.jsp" %>
<%@ include file="../../../include/nav.jsp" %>
	<p><br/></p>
	<div class="container">
		<h2>사용자 정보 수정창</h2>
		<hr/>
		<form name="myform" method="post" action="<%=request.getContextPath() %>/urlMappingUpdateOk.um">
			<table class="table table-bordered">
				<tr>
					<td>
						<p>성명 : <input type="text" name="name" value="<%=vo.getName() %>" autofocus class="form-control"/></p>
						<p>나이 : <input type="number" name="age" value="<%=vo.getAge() %>" class="form-control"/></p>
						<p class="row">
							<span class="col"></span>
							<input type="submit" value="수정" class="btn btn-warning col-5 mr-2"/>
							<input type="button" value="돌아가기" onclick="location.href='<%=request.getContextPath()%>/urlMappingList.um';" class="btn btn-warning col-5 ml-2"/>
							<span class="col"></span>
						</p>
					</td>
				</tr>
			</table>
			<input type="hidden" name="idx" value="<%=vo.getIdx() %>"/>
		</form>
	</div>
	<br/>	
<%@ include file="../../../include/footer.jsp" %>
</body>
</html>