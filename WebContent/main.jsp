<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	$(function() {
		$(".category").on("click", function() {
			$(".categorySelected").remove();
			$(this).append('<div class="categorySelected"></div>');
		});
		//TODO:頭動かなかったので今度やれ
		$(".mailerChild").on("click", function(e) {
			$(".mailBox").addClass("displayNone");
			$(".mailViewer").removeClass("displayNone");
			$(".test").text($(this).text());
		});
		//Viewからmailerに戻るボタンを押したとき
		$(".backButton").on("click", function(){
			$(".mailBox").removeClass("displayNone");
			$(".mailViewer").addClass("displayNone");
		});
	});
</script>
<div class="main">

	<!-- 	めーるぼっくすだよ -->
	<div class="mailBox">
		<div class="upperBar">
			<div></div>
			<div></div>
			<div></div>
		</div>
		<div class="mailCategoryBar">
			<div class="category">
				<div class="categoryMainImg"></div>
				<div>メイン</div>
				<div class="categorySelected"></div>
			</div>
			<div class="category">
				<div class="categorySocialImg"></div>
				<div>ソーシャル</div>
			</div>
			<div class="category">
				<div class="categoryPromotionImg"></div>
				<div>プロモーション</div>
			</div>
		</div>
		<div class="mailer">
			<s:iterator value="mailList">
				<div class="mailerChild">
					<div class="mailerChildCheckBox floatLeft">
						<div class="hoverCircle">
							<div class="checkBox center defautOpacity"></div>
						</div>
					</div>
					<div class="mailerChildStar floatLeft"></div>
					<div class="mailerChildTitle floatLeft">
						<s:property value="title" />
					</div>
					<div class="mailerChildText floatLeft">
						<s:property value="text" />
					</div>
					<div class="mailerChildETC floatLeft">etc area</div>
				</div>
			</s:iterator>


			<div class="mailerInformation1 gray font12px floatLeft">
				0 GB (0%) / ∞ GBを使用中<br> <a href="">管理</a>
			</div>
			<div class="mailerInformation2 gray font12px floatLeft">
				<a href="">利用規約</a>-<a href="">プライバシー</a>-<a href="">プログラム ポリシー</a>
			</div>
			<div class="mailerInformation3 gray font12px floatLeft">
				前回のアカウントアクティビティ: XX分前<br> <a href="">アカウント アクティビティの詳細</a>
			</div>
		</div>

	</div>

	<!-- 	Mail Viewer -->
	<div class="mailViewer displayNone">
		<div class="upperBar">
			<div class="backButton"></div>
			<div></div>
			<div></div>
		</div>
		<div class="test">

		</div>
	</div>
</div>