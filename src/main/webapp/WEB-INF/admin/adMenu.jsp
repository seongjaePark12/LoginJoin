<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>adMenu</title>
	<frameset cols="120px, *">
		<frame src="<%=request.getContextPath()%>/adLeft.ad" name="adLeft" frameboder="0"/>
		<frame src="<%=request.getContextPath()%>/adContent.ad" name="adContent" frameboder="0"/>
	</frameset>
</head>
<body>

</body>
</html>