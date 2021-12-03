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
  	var val = "${val}";
  	
  	if(msg == "userDeleteOk") msg = "정보가 삭제되었습니다";
  	else if(msg == "userDeleteNo") msg = "정보가 삭제되지 않았습니다";
  	else if(msg == "userInputOk") msg = "정보가 입력되었습니다";
  	else if(msg == "userInputNo") msg = "정보가 입력되지 않았습니다";
  	else if(msg == "userUpdateOk") msg = "정보가 수정 되었습니다";
  	else if(msg == "userUpdateNo") msg = "정보가 수정되지 않았습니다";
  	else if(msg == "memberJoinOk") msg = "회원가입 되었습니다";
  	else if(msg == "memberJoinNo") msg = "회원가입에 실패 하였습니다";
  	else if(msg == "memberLoginOk") msg = val+"님 로그인 되었습니다";
  	else if(msg == "memberLoginNo") msg = "아이디와 비밀번호를 확인하세요";
  	else if(msg == "memberLogoutOk") msg = val+"님 로그아웃되셨습니다";
  	else if(msg == "memberLoginPwdNo") msg = "비밀번호를 확인하세요";
  	else if(msg == "memberDeleteOk") msg = "회원 정보가 삭제되었습니다.";
  	//else if(msg == "memberDeleteNo") msg = "회원 정보가 삭제되지 않았습니다.";
  	else if(msg == "memberUpdateOk") msg = "회원정보가 수정되었습니다.^.^.";
  	else if(msg == "memberUpdateNo") msg = "회원정보가 수정되지 않았습니다.ㅜㅜ.";
  	else if(msg == "memberLevelChangeOk") msg = "회원 등급이 변경 되었습니다";
  	else if(msg == "memberReset") msg = "회원정보가 DB에서 삭제 되었습니다";
  	else if(msg == "boInputOk") msg = "게시글 등록 되었습니다";
  	else if(msg == "boInputNo") msg = "게시글 등록 실패";
  	else if(msg == "boDeleteOk") msg = "게시글이 삭제되었습니다";
  	else if(msg == "boDeleteNo") msg = "게시글삭제 실패";
  	else if(msg == "boUpdateOk") msg = "게시글이 수정되었습니다";
  	else if(msg == "boUpdateNo") msg = "게시글수정 실패";
  	else if(msg == "replyBoardInputOk") msg = "댓글이 등록되었습니다";
  	else if(msg == "upLoad1Ok") msg = "파일저장완료";
  	else if(msg == "upLoad1No") msg = "파일저장실패";
  	else if(msg == "fileDeleteOk") msg = "파일삭제완료";
  	else if(msg == "fileDeleteNo") msg = "파일삭제실패";
  	else if(msg == "pdsInputOk") msg = "자료 파일이 업로드 되었습니다";
  	else if(msg == "pdsInputNo") msg = "자료 업로드 실패";
  	else if(msg == "scContentOk") msg = "일정등록완료";
  	else if(msg == "scContentNo") msg = "일정등록실패";
  	else if(msg == "scDeleteOk") msg = "일정이 삭제되었습니다";
  	else if(msg == "scDeleteNo") msg = "일정삭제실패";
  	else if(msg == "wmInputOk") msg = "메세지 전송완료";
  	else if(msg == "wmInputNo") msg = "메세지 전송실패";
  	else if(msg == "wmDeleteOk") msg = "메세지가 휴지통으로 이동되었습니다";
  	else if(msg == "wmDeleteNo") msg = "메세지 휴지통 이동실패";
  	
  	alert(msg);
  	if(url != "") location.href = url;
  </script>
</head>
<body>

</body>
</html>