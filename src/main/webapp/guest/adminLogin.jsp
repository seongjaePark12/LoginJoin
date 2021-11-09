<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<style>
		table{
			width: 400px;
			margin: 0px auto;
		}
		table, th, td{
			border: 1px solid gray;
			padding: 15px;
		}
		table th {
			background-color: #ddd;
			text-align: center;
		}
	</style>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>adminLogin</title>
  <%@ include file="../include/bs4.jsp" %>
</head>
<body>
<%@ include file="../include/header_home.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<p><br/></p>
	<div class="container">
		<h2>관리자 인증창</h2>
		<br/>
		<form name="myform" method="post" action="adminLoginOk.jsp">
			<table class="table">
				<tr>
					<th>관리자아이디</th>
					<td><input type="text" name="mid" required autofocus /> </td>
				</tr>
				<tr>
					<th>관리자 비밀번호</th>
					<td><input type="password" name="pwd" required /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="submit" value="관리자 로그인"/>
						<input type="reset" value="다시입력"/>
						<input type="button" value="돌아가기" onclick="location.href='<%=request.getContextPath() %>/';"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<br/>	
<%@ include file="../include/footer.jsp" %>
</body>
</html>