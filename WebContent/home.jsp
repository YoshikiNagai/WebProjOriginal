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
		<script>
			let versioningNum = new Date().getTime()
			let jsURL = './js/home.js?ver=' + versioningNum
			let jsElement = document.createElement('script')
			jsElement.setAttribute('src', jsURL)
			document.getElementsByTagName("body")[0].appendChild(jsElement)
		</script>
<!--		<script type="text/javascript" src="./js/home.js"></script>-->

		<jsp:include page="header.jsp" />
		<jsp:include page="left.jsp" />
		<jsp:include page="main.jsp" />
		<jsp:include page="right.jsp" />
	</body>
</html>