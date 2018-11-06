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

		$(".account").on("click", function(){
			if($(".accountWindow").css("display") =="none"){
				$(".accountWindow").css("display", "inline");
			}else{
				$(".accountWindow").css("display", "none");
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
		<s:form action="MailAction">
			<input class="searchBarInput" type="text" placeholder="メールを検索" name="search" />
			<input type="hidden" name="searchFlg" value="1"/>
			<s:submit style="display: none;"></s:submit>
		</s:form>

		<div class="searchBarRight">
			<div class="arrow"></div>
		</div>
	</div>
	<div class="appMenu"></div>
	<div class="information"></div>
	<div class="account"><s:property value="#session.account.firstName" /></div>

	<div class="accountWindow">
		<div class="accountWindowTop">
			<div class="acconutWindowImg floatLeft">
				img(yet)
			</div>
			<div class="accountWindowInfo floatLeft">
				<br>
				<b>
					<s:property value="#session.account.lastName"/>
					<s:property value="#session.account.firstName"/>
				</b>
				<br>
				<div class="gray">
					<s:property value="#session.account.id"/>
				</div>
				<button class="floatLeft">iMailアカウント</button>
				<br>
			</div>
		</div>

		<div class="accountWindowBottom clearLeft">
			<button class="floatLeft">アカウントを追加</button>
			<a href='<s:url action="LogoutAction"/>'>ログアウト</a>
		</div>



		<br>

	</div>
</div>
