<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <%@ include file="/include/bs4.jsp" %>
  <script>
  	function idCheck() {
			var mid = searchForm.mid.value;
			if(mid == ""){
				alert("아이디를 입력하세여");
				searchForm.mid.focus();
				return false;
			}
			
			var query = {
					mid : mid
			}
			//alert("입력된 아이디 : " + mid);
			//$.ajax({변수1:값1,변수2:값2});
  		$.ajax({
  			type : "get",
  			url  : "${ctp}/ajax1Ok",
  			//data : {mid : 'hkd1234', age : 22, .........}
  			data : query,		// data : {mid:mid},
  			//contentType: "application/json"; charset: "utf-8",
  			success : function(data){
  				// 성공적으로 ajax(비동기식)처리 끝내고 돌아왔을경우 수행하는곳
  				if(data == ""){
  				alert("검색된 성명이 없습니다");
  				}
  				else{
  				alert("검색된 성명은 " + data);
  				}
  			},
  			error : function(data){
  				// ajax(비동기식)처리 실패후 돌아왔을경우 수행하는곳
  				alert("검색시 오류발생 ");
  			}
  		});
  	}
  	
  	//aJax로 유저등록하기
  	function inputCheck(){
  		var name = $("#name").val();
  		var age = $("#age").val();
  		
  		if(name == ""){
  			alert("이름입력해");
  			$("#name").focus();
  			return false;
  		}
  		
  		var query = {
  				name : name,
  				age : age
  		}
  		
  		$.ajax({
  			type : "post",
  			url  : "${ctp}/userInput",
  			data : query,			
  			success : function(data){
  				if(data == "1"){
  					alert("등록성공");
  					location.reload();
  				}
  			}
  		});
  	}
  	function listCheck(){
  		$.ajax({
    		type : "post",
    		url  : "${ctp}/userList",
    		success : function(data) {
    			if(data == "1"){
  					alert("전체자료를 출력합니다");
  					location.reload();
  				}
    		}
    	});
  	}
  	
  	//자료 삭제
  	function delCheck(idx){
  		var ans = confirm("자료를 삭제 하시겠습니까?");
  		//if(ans) location.href = "${ctp}/userDelete?idx="+idx;
  		var query ={
  				idx : idx
  		}
  		
  		$.ajax({
  			type : "get",
  			url : "${ctp}/userDelete",
  			data : query,
  			success: function(data){
  				if(data == "1"){
  					alert("자료가 삭제되었습니다");
  					location.reload();
  				}
  			},
  			error: function(){
  					alert("오류");
  			}
  		});
  	}
  </script>
  <style type="text/css">
  	th, td{
  		text-align: center;
  		border: 1px solid #ccc;
  	}
  	th{
  		background-color: #ddd;
  	}
  </style>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<jsp:include page="/include/nav.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2>AJAX연습</h2>
		<form name="searchForm">
			아이디 : <input type="text" name="mid" />
			<input type="button" value="아이디검색" onclick="idCheck()"/>
		</form>
		<form name="inputForm">
			<table class="table table-bordered">
				<tr>
					<th colspan="2"><h3>user 가입</h3></th>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name" id="name" value="" class="form-control" autofocus required /></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="number" name="age" id="age" value="20" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center">
						<input type="button" value="등록" onclick="inputCheck()" class="btn btn-warning"/>
						<input type="reset" value="다시입력" class="btn btn-warning"/>
						<input type="button" value="전체조회" onclick="listCheck()" class="btn btn-warning"/>
					</td>
				</tr>
			</table>
		</form>
		<hr/>
		<h2>전체 리스트</h2>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>성명</th>
				<th>나이</th>
				<th>처리</th>
			</tr>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${vo.idx}</td>
					<td>${vo.name}</td>
					<td>${vo.age}</td>
					<td>
						<a href="${ctp}/userUpdate?idx=${vo.idx}" class="btn btn-warning btn-sm">수정</a>
						<a href="javascript:delCheck(${vo.idx})" class="btn btn-warning btn-sm">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br/>	
<%@ include file="/include/footer.jsp" %>
</body>
</html>