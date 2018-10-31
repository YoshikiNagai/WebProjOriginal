<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".searchBar input").on("click", function() {
// 			$(".searchBar").css("background-color", "white");
			$(".searchBar").addClass("onSearchBar");
		});
		$(document).on("click", function(e) {
			if (!$(e.target).closest('.searchBar').length) {
				// フェードやスライドなどの処理方法を記述;
// 				$(".searchBar").css("background-color", "#EEEEEE");
				$(".searchBar").removeClass("onSearchBar");
			}
		});
	});
</script>
<div class="header">
	<div class="humberger">
		<div></div>
		<div></div>
		<div></div>
	</div>
	<img alt="logo" src="./picture/logo.png">
	<div class="searchBar">
		<img class="searchBarLeft" alt="search" src="./picture/search.png">
		<input type="text" placeholder="メールを検索(inactive)" name="search" />
		<div class="searchBarRight">
			<div class="arrow"></div>
		</div>
	</div>
	<div class="appMenu"></div>
	<div class="information"></div>
	<div class="account"><s:property value="#session.account.firstName" /></div>
</div>