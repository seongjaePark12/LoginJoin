<%@page import="study.mapping2.userVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	List<userVO> vos = (List<userVO>) request.getAttribute("vos");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>urlMappingList</title>
  <%@ include file="../../../include/bs4.jsp" %>
  <script>
  	function delCheck(idx){
  		var ans = confirm("삭제 하시겠습니까?");
  		if(ans){
  			location.href="<%=request.getContextPath()%>/urlMappingDelete.um?idx="+idx;
  		}
  	}
  </script>
</head>
<body>
<%@ include file="../../../include/header_home.jsp" %>
<%@ include file="../../../include/nav.jsp" %>
	<p><br/></p>
	<div class="container">
		<h2>사용자 정보 리스트</h2>
		<br/>
		<div>
			<button class="btn-warning" type="button" onclick="location.href='<%=request.getContextPath()%>/urlMappingInput.um';">정보등록</button>
			<button class="btn-warning" type="button" onclick="location.href='<%=request.getContextPath()%>/URLMapping.url2';">돌아가기</button>
		</div>
		<hr/>
		<div>
			<table class="table table-hover">
				<tr class="table-dark text-dark">
					<th>번호</th>
					<th>성명</th>
					<th>나이</th>
					<th>비고</th>
				</tr>
<%			for(userVO vo : vos) { %>
				<tr>
					<td><%=vo.getIdx() %></td>
					<td><%=vo.getName() %></td>
					<td><%=vo.getAge() %></td>
					<td>
						<a href="javascript:delCheck(<%=vo.getIdx() %>)" class="btn btn-warning btn-sm">삭제</a> &nbsp;
						<a href="<%=request.getContextPath() %>/urlMappingUpdate.um?idx=<%=vo.getIdx() %>" class="btn btn-warning btn-sm">수정</a>
					</td>
				</tr>
<%			} %>				
			</table>
		</div>
	</div>
	<br/>	
<%@ include file="../../../include/footer.jsp" %>
</body>
</html>