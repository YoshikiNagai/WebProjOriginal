<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	let selectMailId;
	function getSelectMailId(){
		return selectMailId;
	}
	function read(id){
		$.ajax({
			url: "./ReadAction",
			type: "GET",
			dataType: "json",
			data: {"id": id},
			success: function(json){
			}
		})
	}

	$(function() {
		//カテゴリー選択した場合にアンダーラインを出す
		$(".category").on("click", function() {
			$(".categorySelected").remove();
			$(this).append('<div class="categorySelected"></div>');
		});
		//mailerからviewerへ切り替え
		$(".mailerChild").on("click", function(e) {
			$(".mailBox").addClass("displayNone");
			$(".mailViewer").removeClass("displayNone");
			$(".test .getFromVal").text($(this).find(".getFromVal").val());
			$(".test .getToVal").text($(this).find(".getToVal").val());
			$(".test .getTitleVal").text($(this).find(".getTitleVal").val());
			$(".test .getTextVal").text($(this).find(".getTextVal").val());
			read($(this).find(".id").val());
		});
		//Viewからmailerに戻るボタンを押したとき
		$(".backButton").on("click", function(){
			$(".mailBox").removeClass("displayNone");
			$(".mailViewer").addClass("displayNone");
		});


	});
</script>
<div class="main">

	<!-- Mail Box -->
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
						<div class="checkBox"></div>
						<div class="hoverCircle"></div>
					</div>
					<div class="mailerChildStar floatLeft">
						<div class="starImg"></div>
						<div class="hoverCircle"></div>
					</div>
					<s:if test="read == false">
						<div class="mailerChildFrom floatLeft bold">
							<s:property value="from" />
						</div>
						<div class="mailerChildTitle floatLeft bold">
							<s:property value="title" />
						</div>

					</s:if>

					<s:if test="read == true">
						<div class="mailerChildFrom floatLeft">
							<s:property value="from" />
						</div>
						<div class="mailerChildTitle floatLeft">
							<s:property value="title" />
						</div>
					</s:if>
					<div class="mailerChildText floatLeft gray normal">
						 -
						<s:property value="text" />
					</div>
<!-- 					<div class="mailerChildETC floatLeft">etc area</div> -->
<!-- 					mailの内容 -->
					<input class="id" type="hidden" value='<s:property value="id"/>'>
					<input class="getFromVal" type="hidden" value='<s:property value="from"/>'>
					<input class="getToVal" type="hidden" value='<s:property value="to"/>'>
					<input class="getTitleVal" type="hidden" value='<s:property value="title"/>'>
					<input class="getTextVal" type="hidden" value='<s:property value="text"/>'>
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
			<div class="backButton">
				<div class="backButtonImg"></div>
				<div class="hoverCircle"></div>
			</div>


			<div></div>
			<div></div>
		</div>
		<div class="test">
			<h4 class="getTitleVal"></h4>
			<div class="floatLeft">from:</div>
			<b class="getFromVal floatLeft"></b>
			<div class="floatLeft">date(yet)</div>
			<br>
			<div class="floatLeft">to:</div>
			<div class="getToVal floatLeft"></div>
			<br>
			<div class="getTextVal"></div>
		</div>
	</div>
</div>