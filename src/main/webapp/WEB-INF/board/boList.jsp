<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boList</title>
  <%@ include file="/include/bs4.jsp" %>
  <script>
  	function pageCheck(){
  		var pageSize = document.getElementById("pageSize").value;
  		location.href= "boList.bo?page=${pag}&pageSize="+pageSize;
  	}
  	// 최근 게시글 검색
  	function latelyCheck(){
  		var lately = document.getElementById("lately").value;
  		if(lately == ""){
  			alert("검색일자를 선택하세요");
  		}
  		else{
  			location.href="${ctp}/boList.bo?page=${pag}&pageSize=${pageSize}&lately="+lately;		
  		}
  	}
  </script>
  <style>
    th, td {
      text-align: center;
    }
  </style>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<jsp:include page="/include/nav.jsp"/>
	<p><br/></p>
	<div class="container">
		<table class="table table-borderless">
	    <tr>
	      <td colspan="2" class="p-0"><h2>게 시 판 리 스 트</h2></td>
	    </tr>
	    <tr>
	      <td class="text-left p-0">
	        <a href="${ctp}/boInput.bo" class="btn btn-warning btn-sm">글쓰기</a>
	        <select name="lately"  id="lately" onchange="latelyCheck()">
	        	<option value="0">최근자료순</option>
	        	<c:forEach var="i" begin="1" end="30">
	        		<option value="${i}" ${lately == i ? 'selected' : ''}>${i}일전</option>
	        	</c:forEach>
	        </select>
	      </td>
	      <td class="text-right p-0">
					<select name="pageSize" id="pageSize" onchange="pageCheck()">
						<option value="5" ${pageSize==5 ? 'selected' : ''}>5건</option>
						<option value="10" ${pageSize==10 ? 'selected' : ''}>10건</option>
						<option value="15" ${pageSize==15 ? 'selected' : ''}>15건</option>
						<option value="20" ${pageSize==20 ? 'selected' : ''}>20건</option>
					</select>
	      </td>
	    </tr>
	  </table>
	  <table class="table table-hover">
	    <tr class="table-warning text-dark">
	      <th>글번호</th>
	      <th>글제목</th>
	      <th>글쓴이</th>
	      <th>글쓴날짜</th>
	      <th>조회수</th>
	      <th>좋아요</th>
	    </tr>
	    <c:forEach var="vo" items="${vos}">
		    <tr>
		      <td>${curScrStartNo}</td>
		      <td>
		      	<a href="${ctp}/boContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
		      	<c:if test="${vo.wNdate <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
		      </td>
		      <td>${vo.nickName}</td>
		      <td>
		      	<c:if test="${vo.wNdate <= 24}">${fn:substring(vo.wDate,11,16)}</c:if>
		      	<c:if test="${vo.wNdate > 24}">${fn:substring(vo.wDate,0,10)}</c:if>
		      </td>
		      <td>${vo.readNum}</td>
		      <td>${vo.good}</td>
		    </tr>
		    <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	    </c:forEach>
	  </table>
	  
	  <!-- 블록 페이징처리 시작(bs4 스타일 적용) -->
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
			<c:if test="${totPage != 0}">
				<c:if test="${pag != 1}">
					<li class="page-item"><a href="boList.bo?pag=1&pageSize=${pageSize}&lately=${lately}" class="page-link text-warning" title="첫페이지">◀◀</a></li>
				</c:if>
				<c:if test="${curBlock > 0}">
					<li class="page-item"><a href="boList.bo?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&lately=${lately}" class="page-link text-warning" title="이전">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i == pag && i <= totPage}">
						<li class="page-item active"><a href='boList.bo?pag=${i}&pageSize=${pageSize}&lately=${lately}' class="page-link text-dark bg-warning border-warning">${i}</a></li>
					</c:if>
					<c:if test="${i != pag && i <= totPage}">
						<li class="page-item"><a href='boList.bo?pag=${i}&pageSize=${pageSize}&lately=${lately}' class="page-link text-dark">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<li class="page-item"><a href="boList.bo?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&lately=${lately}" class="page-link text-warning" title="다음">▶</a></li>
				</c:if>
				<c:if test="${pag != totPage}">
					<li class="page-item"><a href="boList.bo?pag=${totPage}&pageSize=${pageSize}&lately=${lately}" class="page-link text-warning" title="마지막">▶▶</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
<!-- 블록 페이징처리 끝 -->

<%-- 
	  <!-- 블록 페이징처리 시작(일반 형식) -->
	<div style="text-align:center;">
		<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
		<c:if test="${totPage != 0}">
			<div style="text-align:center;">
				<c:if test="${pag != 1}"><a href="boList.bo?pag=1" class="btn btn-warning btn-sm" title="첫페이지">첫페이지</a></c:if>
				<c:if test="${curBlock > 0}"><a href="boList.bo?pag=${(curBlock-1)*blockSize + 1}" class="btn btn-warning btn-sm" title="이전">이전</a></c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i == pag && i <= totPage}"><a href='boList.bo?pag=${i}'><font color='red'><b>${i}</b></font></a></c:if>
					<c:if test="${i != pag && i <= totPage}"><a href='boList.bo?pag=${i}'>${i}</a></c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}"><a href="boList.bo?pag=${(curBlock+1)*blockSize + 1}" class="btn btn-warning btn-sm" title="다음">다음</a></c:if>
				<c:if test="${pag != totPage}"><a href="boList.bo?pag=${totPage}" class="btn btn-warning btn-sm" title="마지막">마지막</a></c:if>
			</div>
		</c:if>
	</div>
<!-- 블록 페이징처리 끝 -->
--%>
<%-- 
	  <!-- 블록 페이징처리 시작(break문장 대체) -->
	<div style="text-align:center;">
		<c:set var="pageSW" value="0"/>
		<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
		<c:if test="${totPage != 0}">
			<div style="text-align:center;">
				<c:if test="${pag != 1}"><a href="boList.bo?pag=1" class="btn btn-warning btn-sm" title="첫페이지">첫페이지</a></c:if>
				<c:if test="${curBlock > 0}"><a href="boList.bo?pag=${(curBlock-1)*blockSize + 1}" class="btn btn-warning btn-sm" title="이전">이전</a></c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i>totPage}"><c:set var="pageSw" value="1"/></c:if>
						<c:if test="${pageSw != 1}">
							<c:if test="${i == pag}"><a href='boList.bo?pag=${i}'><font color='red'><b>${i}</b></font></a></c:if>
							<c:if test="${i != pag}"><a href='boList.bo?pag=${i}'>${i}</a></c:if>
						</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}"><a href="boList.bo?pag=${(curBlock+1)*blockSize + 1}" class="btn btn-warning btn-sm" title="다음">다음</a></c:if>
				<c:if test="${pag != totPage}"><a href="boList.bo?pag=${totPage}" class="btn btn-warning btn-sm" title="마지막">마지막</a></c:if>
			</div>
		</c:if>
	</div>
<!-- 블록 페이징처리 끝 -->
--%>
	</div>
	<br/>	
<%@ include file="/include/footer.jsp" %>
</body>
</html>