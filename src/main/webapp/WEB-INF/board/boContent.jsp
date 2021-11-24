<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boContent</title>
  <%@ include file="/include/bs4.jsp" %>
  <script>
  	function delCheck(){
  		var ans = confirm("게시글을 삭제하시겠습니까?");
  		if(ans) location.href="${ctp}/boDelete.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}";
  	}
  	
  	// 좋아요 처리 -1
  	function goodCheck2(flag){
  		var query = {
  				idx : ${vo.idx},
  				flag: flag  		
  				}
  		
  		$.ajax({
  			type : "post",
  			url : "${ctp}/boGood2.bo",
  			data : query,
  			success:function(){
  				location.reload();
  			}
  		});
  	}
  	// 좋아요 처리 -2
  	function goodCheck3(){
  		var query = {
  				idx : ${vo.idx}
  		}
  		
  		$.ajax({
  			type : "post",
  			url : "${ctp}/boGood3",
  			data : query,
  			success:function(data){
  				if(data == "1"){
  					alert("이미 좋아요를 클릭하셨습니다");
  				}
  				else{
	  				location.reload();
  				}
  			}
  		});
  	}
  </script>
  <style>
  	th{
  		background-color: skyblue;
  		text-align: center;
  	}
  </style>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<jsp:include page="/include/nav.jsp"/>
	<p><br/></p>
	<div class="container">
  <h2 style="text-align:center">글 내 용 보 기</h2>
  <br/>
  <table class="table table-bordered">
    <tr>
      <th>글쓴이</th>
      <td>${vo.nickName} <a href="javascript:goodCheck2(1)">👍</a><a href="javascript:goodCheck2(-1)">👎</a>(${vo.good})</td>
      <th>글쓴날짜</th>
      <td>${fn:substring(vo.wDate,0,19)}</td>
    </tr>
    <tr>
      <th>이메일</th>
      <td>${vo.email}</td>
      <th>조회수</th>
      <td>${vo.readNum}</td>
    </tr>
    <tr>
      <th>홈페이지</th>
      <td>
      	<c:if test="${fn:length(vo.homePage)>7}"><a href="${vo.homePage}" target="_blank">${vo.homePage}</a></c:if>
      	<c:if test="${fn:length(vo.homePage)<=7}">없음</c:if>
      </td>
      <th>접속IP</th>
      <td>${vo.hostIp}</td>
    </tr>
    <tr>
      <th>좋아요</th>
      <td colspan="3"><a href="${ctp}/boGood.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&sw=search">❤</a>(${vo.good})</td>
    </tr>
    <tr>
      <th>글제목</th>
      <td colspan="3">${vo.title}<a href="javascript:goodCheck3()">💖</a>(${vo.good})</td>
    </tr>
    <tr>
      <th>글내용</th>
      <td colspan="3" style="height:200px">${fn:replace(vo.content,newLine,'<br/>')}</td>
    </tr>
    <tr>
      <td colspan="4" class="text-center">
      	<c:if test="${sw != 'search'}">
        	<input type="button" value="돌아가기" onclick="location.href='${ctp}/boList.bo?pag=${pag}&pageSize=${pageSize}';"/>
		     	<c:if test="${sMid == vo.mid}">
		     		<input type="button" value="수정" onclick="location.href='${ctp}/boUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';"/>
		     		<input type="button" value="삭제" onclick="delCheck()"/>
		     	</c:if>
	     	</c:if>
	     	<c:if test="${sw == 'search'}">
	     	  <input type="button" value="돌아가기" onclick="history.back()"/>
	     	</c:if>
      </td>
    </tr>
  </table>
	<br/>
	<c:if test="${sw != 'search'}">
		<!-- 이전글/다음글 처리 -->
		<table class="table table-borderless">
			<tr>
				<td>
					<c:if test="${nextVO.nextIdx != 0}">
					👆<a href="${ctp}/boContent.bo?idx=${nextVO.nextIdx}&pag=${pag}&pageSize=${pageSize}">다음글 : ${nextVO.nextTitle}</a><br/>
					</c:if>
					<c:if test="${preVO.preIdx != 0}">
					👇<a href="${ctp}/boContent.bo?idx=${preVO.preIdx}&pag=${pag}&pageSize=${pageSize}">이전글 : ${preVO.preTitle}</a><br/>
					</c:if>
				</td>
			</tr>
		</table>
	</c:if>
</div>
<br/>
<%@ include file="/include/footer.jsp" %>
</body>
</html>