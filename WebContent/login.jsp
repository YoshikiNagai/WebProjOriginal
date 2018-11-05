<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="headerInitCommon.jsp" />
		<title>ログイン - iMailアカウント</title>
	</head>
	<body>
		<script type="text/javascript">
			$(function() {
				$(".createAccountArea input")
				.focusin(function(){
					$(this).next("div").css("transform", "scaleX(1)");
					//文字をぐわーって左上に動かす処理
					$(this).prev("div").css("top", "0");
					$(this).prev("div").css("font-size", "80%");
				})
				.focusout(function(){
					if($(this).val() == ""){
						$(this).next("div").css("transform", "scaleX(0)");
						//文字を戻すとき
						$(this).prev("div").css("top", "50%");
						$(this).prev("div").css("font-size", "100%");
					}

				});
			});
		</script>
		<div class="window">
			<div class="createAccountArea">
				<div class="textCenter">
					imail logo(yet)<br>
					<h3>ログイン</h3>
				</div>

				<s:form action="LoginCompleteAction">
					<div class="animationInputArea floatLeft">
						<div class="animation">メールアドレス</div>
						<input type="text" name="id">
						<div class="animationBorder"></div>
					</div>
					<br>
					<div class="animationInputArea clearLeft">
						<div class="animation">パスワード</div>
						<input type="password" name="password">
						<div class="animationBorder"></div>
					</div>
					<div class="clearLeft"></div>
					<a href="">メールアドレスを忘れた場合</a>
					<br><br>
					ご自分のパソコンでない場合は、ゲストモードを使用して非公開でログインしてください。<a href="">ヘルプ</a>
					<br>
					<a href='<s:url action="AccountCreateAction"/>'>アカウントを作成</a>

					<s:submit class="floatLeft" value="次へ"></s:submit>
				</s:form>
				<div class="createAccountUnderArea textCenter">
					日本語
					<a href="">ヘルプ</a>
					<a href="">プライバシー</a>
					<a href="">規約</a>
				</div>
			</div>

		</div>

	</body>
</html>