<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="headerInitCommon.jsp" />
		<title>TEST INDEX</title>
	</head>
	<body>
		<a href='<s:url action="MailAction"/>'>mail</a>
		<a href='<s:url action="AccountCreateAction"/>'>createAccount</a>
		<a href='<s:url action="LoginAction"/>'>login</a>
		<a href='<s:url action="LogoutAction"/>'>logout</a>
	</body>
</html>