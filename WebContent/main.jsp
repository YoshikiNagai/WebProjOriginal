<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="main">
	<div class="popupWindow pointerEventsNone opacity0">
		<div class="hoverCircleSquare"></div>
	</div>
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
<!--			削除画面の場合-->
			<s:if test="selectedLeftMenu == 3">
				<div class="deleteButton">
					<div class="deleteButtonHoverCircle cursorPointer"></div>
					<div class="deleteButtonText pointerEventsNone">ゴミ箱を今すぐ空にする</div>
					<s:form method="post" action="MailAction">
						<input type="hidden" name="selectedLeftMenu" value="3">
						<input type="hidden" name="deleteFlg" value="1">
					</s:form>
				</div>
			</s:if>
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
							<input class="getSendDateVal" type="hidden" value='<s:property value="sendDate"/>'>
						</div>
						<div class="mailerChildTitle floatLeft bold">
							<s:property value="title" />
							<input class="id" type="hidden" value='<s:property value="id"/>'>
							<input class="getFromVal" type="hidden" value='<s:property value="from"/>'>
							<input class="getToVal" type="hidden" value='<s:property value="to"/>'>
							<input class="getTitleVal" type="hidden" value='<s:property value="title"/>'>
							<input class="getTextVal" type="hidden" value='<s:property value="text"/>'>
							<input class="getSendDateVal" type="hidden" value='<s:property value="sendDate"/>'>
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
							<input class="getSendDateVal" type="hidden" value='<s:property value="sendDate"/>'>
						</div>
						<div class="mailerChildTitle floatLeft">
							<s:property value="title" />
							<input class="id" type="hidden" value='<s:property value="id"/>'>
							<input class="getFromVal" type="hidden" value='<s:property value="from"/>'>
							<input class="getToVal" type="hidden" value='<s:property value="to"/>'>
							<input class="getTitleVal" type="hidden" value='<s:property value="title"/>'>
							<input class="getTextVal" type="hidden" value='<s:property value="text"/>'>
							<input class="getSendDateVal" type="hidden" value='<s:property value="sendDate"/>'>
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
						<input class="getSendDateVal" type="hidden" value='<s:property value="sendDate"/>'>
					</div>
					<div class="mailerChildDate floatLeft gray normal">
						<s:property value="sendDate" />
						<input class="id" type="hidden" value='<s:property value="id"/>'>
						<input class="getFromVal" type="hidden" value='<s:property value="from"/>'>
						<input class="getToVal" type="hidden" value='<s:property value="to"/>'>
						<input class="getTitleVal" type="hidden" value='<s:property value="title"/>'>
						<input class="getTextVal" type="hidden" value='<s:property value="text"/>'>
						<input class="getSendDateVal" type="hidden" value='<s:property value="sendDate"/>'>
					</div>
					<div class="mailerChildETC floatLeft displayNone">
						<s:if test="delete == true">
							<div class="mailerChildDustBox floatLeft pointerEventsNone opacity05">
								<div class="dustBoxImg"></div>
								<div class="hoverCircle"></div>
							</div>
						</s:if>
						<s:else>
							<div class="mailerChildDustBox floatLeft popup">
								<input class="popupText" type="hidden" value="削除">
								<div class="dustBoxImg"></div>
								<div class="hoverCircle"></div>
							</div>
						</s:else>
						<div class="mailerChildMail floatLeft popup">
							<s:if test="read == true">
								<div class="mailImg"></div>
								<input class="popupText" type="hidden" value="未読にする">
							</s:if>
							<s:else>
								<div class="mail2Img"></div>
								<input class="popupText" type="hidden" value="既読にする">
							</s:else>
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
					<input class="getSendDateVal" type="hidden" value='<s:property value="sendDate"/>'>
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
		<div class="fromImage floatLeft"></div>
		<div class="test">
			<h4 class="getTitleVal"></h4>
			<div class="floatLeft"></div>
			<b class="getFromVal floatLeft"></b>
			<div class="getSendDateVal floatLeft">date(yet)</div>
			<br>
			<div class="floatLeft gray font16px">To　</div>
			<div class="getToVal floatLeft gray font16px"></div>
			<br>
			<div class="getTextVal font14px"></div>
		</div>
		<div class="mailViewerBottom">
			<button class="cursorPointer">返信</button>
		</div>
		<div class="reply displayNone">
			<s:form action="Send">
				
				<div class="replyTop gray">


				</div>
				<div class="replyMain">
					<textarea class="replyText" name="text" cols="60" rows="10"></textarea>
				</div>
				<div class="replyBlankArea"></div>
				<div class="replyBottom">
					<button class="cursorPointer">送信</button>
				</div>
				
				<input type="hidden" name="to">
				<input type="hidden" name="title">
				<input type="hidden" name="sendFlg" value="1">
				<s:token/>
			</s:form>
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
	