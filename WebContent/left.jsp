<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	$(function() {
		$(".chatUnderMessage a").on({
			"mouseenter" : function(){
// 				$(".chatUnderMessage a").text("新しいチャットを開始できませんさせません");
			},
			"mouseleave" : function(){
				$(".chatUnderMessage a").text("新しいチャットを開始しませんか");
			}
		});

		$(".createButton").on("click", function(){
			if($(".inputWindow").css("display") =="none"){
				$(".inputWindow").css("display", "inline");
			}else{
				$(".inputWindow").css("display", "none");
			}
		});
	});
</script>
<div class="left">
	<div class="createButtonArea">
		<div class="createButton">
			<div class="createButtonLeft"></div>
			<div class="createButtonRight">作成</div>
		</div>
	</div>
	<div class="leftMenu">
		<div class="leftMenuChild">
			<div class="menuIconImg iconBox"></div>
			<div class="leftMenuChildText">受信トレイ</div>
		</div>
		<div class="leftMenuChild">
			<div class="menuIconImg iconStar"></div>
			<div class="leftMenuChildText">スター付き</div>
		</div>
		<div class="leftMenuChild">
			<div class="menuIconImg iconSnooze"></div>
			<div class="leftMenuChildText">スヌーズ中</div>
		</div>
		<div class="leftMenuChild">
			<div class="menuIconImg iconSent"></div>
			<div class="leftMenuChildText">送信済み</div>
		</div>
		<div class="leftMenuChild">
			<div class="menuIconImg iconDraft"></div>
			<div class="leftMenuChildText">下書き</div>
		</div>
		<div class="leftMenuChild">
			<div class="menuIconImg iconUnderArrow"></div>
			<div class="leftMenuChildText">もっと見る(inactive)</div>
		</div>
	</div>
	<div class="hr"></div>
	<div class="chatArea">
		<div class="chat"></div>
		<div class="chatUnderMessage">
			最近のチャットはありません<br>
			<a href="">新しいチャットを開始しませんか</a>
		</div>
	</div>


	<div class="underBar">
		underMenu at leftBar(yet)
	</div>
</div>

<div class="inputWindow">
	<div class="inputWindowBar">
		messagetest
		<div class="closeButton"></div>
	</div>
	<div class="inputArea">
		<s:form action="MailAction">
			<input type="text" placeholder="宛先" name="to"><br>
			<input type="text" placeholder="件名" name="title"><br>
			<textarea rows="" cols="" name="text"></textarea><br>
			<input type="hidden" name="sendFlg" value="1">
			<s:submit class="inputWindowButton" value="送信" method="send"/>
		</s:form>

	</div>
</div>