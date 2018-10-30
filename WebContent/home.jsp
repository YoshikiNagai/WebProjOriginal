<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="headerInitCommon.jsp" />
		<title>Home画面</title>
	</head>
	<body>
	<%
		int rand = (int)(Math.random() * 100);
	%>
		<jsp:include page="header.jsp?<%=rand %>" />
		<jsp:include page="left.jsp?<%=rand %>" />
		<jsp:include page="main.jsp?<%=rand %>" />
		<jsp:include page="right.jsp" />


	</body>
</html>