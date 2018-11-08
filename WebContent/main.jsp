<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
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

	function unread(id){
		$.ajax({
			url: "./UnreadAction",
			type: "GET",
			dataType: "json",
			data: {"id": id},
			success: function(json){
			}
		})
	}

	function star(id){
		$.ajax({
			url: "./StarAction",
			type: "GET",
			dataType: "json",
			data: {"id": id},
			success: function(json){
			}
		})
	}

	function information(text){
		$(".informationAreaText").text(text);
		$(".informationArea").removeClass("displayNone");
	}

	$(function() {
		//カテゴリー選択した場合にアンダーラインを出す
		$(".category").on("click", function() {
			$(".categorySelected").remove();
			$(this).append('<div class="categorySelected"></div>');
		});

		$(".mailerChild").on({
			"mouseenter": function(){
				$(this).find(".mailerChildETC").removeClass("displayNone");
			},
			"mouseleave": function(){
				$(this).find(".mailerChildETC").addClass("displayNone");
			}
		});

		//mailerからviewerへ切り替え
		$(".mailerChildTitle,.mailerChildFrom,.mailerChildText").on("click", function(e) {
			$(".mailBox").addClass("displayNone");
			$(".mailViewer").removeClass("displayNone");
			$(".test .getFromVal").text($(this).find(".getFromVal").val());
			$(".test .getToVal").text($(this).find(".getToVal").val());
			$(".test .getTitleVal").text($(this).find(".getTitleVal").val());
			$(".test .getTextVal").text($(this).find(".getTextVal").val());
			read($(this).find(".id").val());
			console.log(this);
			console.log($(this).parent())
			$(this).parent().find(".mailerChildTitle").removeClass("bold");
			$(this).parent().find(".mailerChildFrom").removeClass("bold");
		});
		//Viewからmailerに戻るボタンを押したとき
		$(".backButton").on("click", function(){
			$(".mailBox").removeClass("displayNone");
			$(".mailViewer").addClass("displayNone");

		});

		//スター付け
		$(".mailerChildStar").on("click", function() {
			if($(this).find("div").hasClass("starImg")){
				$(this).find(".starImg").addClass("star2Img");
				$(this).find(".starImg").removeClass("starImg");
			}else{
				$(this).find(".star2Img").addClass("starImg");
				$(this).find(".star2Img").removeClass("star2Img");
			}

			star($(this).find(".id").val());
		});

		//未読既読切り替え
		$(".mailerChildMail").on("click",function(){
			let id = $(this).find("input.id").val();
			let $child = $(this).parent().parent();
			if($child.find(".mailerChildFrom").hasClass("bold")){
				$child.find(".mailerChildFrom").removeClass("bold");
				$child.find(".mailerChildTitle").removeClass("bold");
				read(id);
				information("既読にしました。");
			}else{
				$child.find(".mailerChildFrom").addClass("bold");
				$child.find(".mailerChildTitle").addClass("bold");
				unread(id);
				information("未読にしました。");
			}
		});

		$(".checkBox").on("click", function(){

		});

		$(".informationAreaExit").on("click", function(){
			$(".informationArea").addClass("displayNone");
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
						<s:if test="star == false">
							<div class="starImg"></div>
						</s:if>
						<s:else>
							<div class="star2Img"></div>
						</s:else>
						<div class="hoverCircle"></div>
						<input class="id" type="hidden" value='<s:property value="id"/>'>
					</div>
					<s:if test="read == false">
						<div class="mailerChildFrom floatLeft bold <s:property value='#stat.index'/>">
							<s:property value="from" />
							<input class="id" type="hidden" value='<s:property value="id"/>'>
							<input class="getFromVal" type="hidden" value='<s:property value="from"/>'>
							<input class="getToVal" type="hidden" value='<s:property value="to"/>'>
							<input class="getTitleVal" type="hidden" value='<s:property value="title"/>'>
							<input class="getTextVal" type="hidden" value='<s:property value="text"/>'>
						</div>
						<div class="mailerChildTitle floatLeft bold">
							<s:property value="title" />
							<input class="id" type="hidden" value='<s:property value="id"/>'>
							<input class="getFromVal" type="hidden" value='<s:property value="from"/>'>
							<input class="getToVal" type="hidden" value='<s:property value="to"/>'>
							<input class="getTitleVal" type="hidden" value='<s:property value="title"/>'>
							<input class="getTextVal" type="hidden" value='<s:property value="text"/>'>
						</div>

					</s:if>

					<s:if test="read == true">
						<div class="mailerChildFrom floatLeft <s:property value='#stat.index'/>">
							<s:property value="from" />
							<input class="id" type="hidden" value='<s:property value="id"/>'>
							<input class="getFromVal" type="hidden" value='<s:property value="from"/>'>
							<input class="getToVal" type="hidden" value='<s:property value="to"/>'>
							<input class="getTitleVal" type="hidden" value='<s:property value="title"/>'>
							<input class="getTextVal" type="hidden" value='<s:property value="text"/>'>
						</div>
						<div class="mailerChildTitle floatLeft">
							<s:property value="title" />
							<input class="id" type="hidden" value='<s:property value="id"/>'>
							<input class="getFromVal" type="hidden" value='<s:property value="from"/>'>
							<input class="getToVal" type="hidden" value='<s:property value="to"/>'>
							<input class="getTitleVal" type="hidden" value='<s:property value="title"/>'>
							<input class="getTextVal" type="hidden" value='<s:property value="text"/>'>
						</div>
					</s:if>
					<div class="mailerChildText floatLeft gray normal">
						 -
						<s:property value="text" />
						<input class="id" type="hidden" value='<s:property value="id"/>'>
						<input class="getFromVal" type="hidden" value='<s:property value="from"/>'>
						<input class="getToVal" type="hidden" value='<s:property value="to"/>'>
						<input class="getTitleVal" type="hidden" value='<s:property value="title"/>'>
						<input class="getTextVal" type="hidden" value='<s:property value="text"/>'>
					</div>
					<div class="mailerChildETC floatLeft displayNone">
						<div class="mailerChildDustBox floatLeft">
							<div class="dustBoxImg"></div>
							<div class="hoverCircle"></div>
						</div>
						<div class="mailerChildMail">
							<div class="mailImg"></div>
							<div class="hoverCircle"></div>
							<input class="id" type="hidden" value='<s:property value="id"/>'>
						</div>
					</div>
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
	<!-- Information -->
	<div class="informationArea displayNone">
			<div class="informationAreaText floatLeft"></div>
			<div class="informationAreaExit floatLeft">
				<div class="hoverCircle"></div>
			</div>
		</div>
</div>