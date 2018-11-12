<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="header">
	<div class="humberger">
		<div></div>
		<div></div>
		<div></div>
	</div>
	<img alt="logo" src="./picture/iMail.png">
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
	<div class="account popup opacityAnim cursorPointer"><s:property value="#session.account.firstName" />
		<input class="popupText" type="hidden" value="iMailアカウント">
	</div>

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
