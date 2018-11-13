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

				$(".createAccountArea select")
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
		<div class="window center">
			<div class="createAccountArea">
				<div class="textCenter">
					iMail logo (yet)<br>
					iMail アカウントの作成
				</div>
				<s:form action="AccountCreateConfirmAction">
					<div class="animationInputArea floatLeft">
						<div class="animation">姓</div>
						<input type="text" name="lastName" required>
						<div class="animationBorder"></div>
					</div>
					<s:property value='errorMessage.get("lastName")'/>
					<div class="animationInputArea floatLeft">
						<div class="animation">名</div>
						<input type="text" name="firstName" required>
						<div class="animationBorder"></div>
					</div>
					<s:property value='errorMessage.get("firstName")'/>
					<br>

					<div class="animationInputArea floatLeft">
						<div class="animation">ユーザー名</div>
						<input type="text" name="id" required>
						<div class="animationBorder"></div>

					</div>
					<s:property value='errorMessage.get("id")'/>
					<div class="animationInputArea floatLeft">
						<div class="mailAddressText">@imail.com</div>
					</div>

					<br>
					<div class="clearLeft">
						半角英字、数字、ピリオドを使用できます。<br>
					</div>


					<div class="animationInputArea floatLeft">
						<div class="animation">パスワード</div>
						<input type="password" name="password" required>
						<div class="animationBorder"></div>
					</div>

					<div class="animationInputArea floatLeft">
						<div class="animation">パスワードの確認</div>
						<input type="password" name="confirmPassword" required>
						<div class="animationBorder"></div>
					</div>

					<s:property value='errorMessage.get("password")'/>
					<s:property value='errorMessage.get("passwordConfirm")'/>

					<div class="clearLeft"></div>
					<div>
						半角英字、数字、記号を組み合わせて8文字以上で入力してください<br>
					</div>

					<div class="animationInputArea clearLeft">
						<div class="animation">電話番号</div>
						<input type="text" name="phoneNumber" required>
						<div class="animationBorder"></div>
					</div>
					<s:property value='errorMessage.get("phoneNumber")'/>
					<div class="animationInputArea clearLeft">
						<div class="animation">誕生日</div>
						<input type="text" name="birthDay" required>
						<div class="animationBorder"></div>
					</div>
					<s:property value='errorMessage.get("birthDay")'/>
					<div>
						2018-01-01の形式で入力してください<br>
					</div>


					<div class="animationInputArea">
						<div class="animation">性別</div>
						<select name="gender">
							<option></option>
							<option>男性</option>
							<option>女性</option>
						</select>
						<div class="animationBorder"></div>
					</div>

					<s:submit class="floatLeft" value="次へ"></s:submit>
				</s:form>
				<div class="createAccountUnderArea clearLeft">
					日本語
					<a href="">ヘルプ</a>
					<a href="">プライバシー</a>
					<a href="">規約</a>
				</div>
			</div>
		</div>
	</body>
</html>