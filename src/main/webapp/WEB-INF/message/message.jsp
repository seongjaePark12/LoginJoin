<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String msg = (String) request.getAttribute("msg");
	String url = (String) request.getAttribute("url");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>message</title>
  <script>
  	var msg = "<%=msg%>";
  	var url = "<%=url%>";
  	
  	if(msg == "userDeleteOk") msg = "정보가 삭제되었습니다";
  	else if(msg == "userDeleteNo") msg = "정보가 삭제되지 않았습니다";
  	else if(msg == "userInputOk") msg = "정보가 입력되었습니다";
  	else if(msg == "userInputNo") msg = "정보가 입력되지 않았습니다";
  	else if(msg == "userUpdateOk") msg = "정보가 수정 되었습니다";
  	else if(msg == "userUpdateNo") msg = "정보가 수정되지 않았습니다";
  	else if(msg == "memberJoinOk") msg = "회원가입 되었습니다";
  	else if(msg == "memberJoinNo") msg = "회원가입에 실패 하였습니다";
  	else if(msg == "memberLoginOk") msg = "로그인 되었습니다";
  	else if(msg == "memberLoginNo") msg = "아이디와 비밀번호를 확인하세요";
  	else if(msg == "memberLogoutOk") msg = "로그아웃되셨습니다";
  	else if(msg == "memberLoginPwdNO") msg = "비밀번호를 확인하세요";
  	else if(msg == "memberDeleteOk") msg = "회원 정보가 삭제되었습니다.";
  	//else if(msg == "memberDeleteNo") msg = "회원 정보가 삭제되지 않았습니다.";
  	else if(msg == "memberUpdateOk") msg = "회원정보가 수정되었습니다.^.^.";
  	else if(msg == "memberUpdateNo") msg = "회원정보가 수정되지 않았습니다.ㅜㅜ.";
  	
  	alert(msg);
  	if(url != "") location.href = url;
  </script>
</head>
<body>

</body>
</html>