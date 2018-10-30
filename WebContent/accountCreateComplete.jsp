<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="headerInitCommon.jsp" />
		<title>iMailアカウントの作成</title>
	</head>
	<body>
		<s:property value="lastName"/>
		<s:property value="firstName"/>
		<s:property value="id"/>
		<s:property value="password"/>
		<s:property value="phoneNumber"/>
		<s:property value="birthDay"/>
	</body>
</html>