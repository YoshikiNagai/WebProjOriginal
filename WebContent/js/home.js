$(function() {
	/**
	 * フラグ系アクションの一覧
	 */
	const Action = {
		READ: "ReadAction",
		UNREAD: "UnreadAction",
		STAR: "StarAction",
		DELETE: "DeleteAction"
	};

	/**
	 * フラグ系アクションのアップデート
	 * @param {}id
	 * @param {Action}actionName
	 */
	function updateFlgs(id, actionName){
		actionName = "./" + actionName;
		$.ajax({
			url: actionName,
			type: "GET",
			dataType: "json",
			data: {"id": id},
			success: function(json){
			}
		});
	}

	$(".deleteButton").on("click", function(){
		$(this).find("form").submit();
	});

	/**
	 * 削除時などに表示されるポップアップウィンドウ
	 * @param text
	 */
	function information(text){
		$(".informationAreaText").text(text);
		$(".informationArea").removeClass("displayNone");
	}
//	-- Left Menu --
	//選択した左メニュー
	let selected = $("input[name='selectedLeftMenu']").attr("value");
	switch(selected){
	case "0":
		$("#0").addClass("selected");
		break;
	case "1":
		$("#1").addClass("selected");
		break;
	case "2":
		$("#2").addClass("selected");
		break;
	case "3":
		$("#3").addClass("selected");
		break;
	default:
		alert("未実装部分あり");
	}

	//メール作成画面のオンオフ
	$(".createButton").on("click", function(){
		if($(".inputWindow").css("display") =="none"){
			$(".inputWindow").css("display", "inline");
		}else{
			$(".inputWindow").css("display", "none");
		}
	});

	$(".leftMenuChild").on("click", function(){
		$(".leftMenuChild").removeClass("selected");
		$(this).addClass("selected");
		$(this).find("form").submit();
	});
	
	//メール作成画面閉じるボタン
	$(".closeButton").on("click",()=>{
		$(".inputWindow").css("display", "none");
	});
	
	//チャット未実装だぞ告知
	$(".chatUnderMessage a").on({
		"mouseenter": function(){
			$(this).text("未実装です。暇だったら作ります。");
		},
		"mouseleave": function(){
			$(this).text("新しいチャットを開始しませんか");
		}
	})

//	-- Main menu --
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
		$(".test .getSendDateVal").text($(this).find(".getSendDateVal").val());
		updateFlgs($(this).find(".id").val(), Action.READ);
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

		updateFlgs($(this).find(".id").val(), Action.STAR);
	});

	//未読既読切り替え
	$(".mailerChildMail").on("click",function(){
		let id = $(this).find("input.id").val();
		let $child = $(this).parent().parent();
		if($child.find(".mailerChildFrom").hasClass("bold")){
			$child.find(".mailerChildFrom").removeClass("bold");
			$child.find(".mailerChildTitle").removeClass("bold");
			updateFlgs(id, Action.READ);
			information("既読にしました。");
			$child.find(".mail2Img").addClass("mailImg");
			$child.find(".mail2Img").removeClass("mail2Img");


		}else{
			$child.find(".mailerChildFrom").addClass("bold");
			$child.find(".mailerChildTitle").addClass("bold");
			updateFlgs(id, Action.UNREAD);
			information("未読にしました。");
			$child.find(".mailImg").addClass("mail2Img");
			$child.find(".mailImg").removeClass("mailImg");

		}
	});

	//deleteフラグオン
	$(".mailerChildDustBox").on("click", function(){
		let $child = $(this).parent().parent();
		let $id = $child.find("input.id").val();
		updateFlgs($id, Action.DELETE);4
		$child.remove();
	});

	$(".checkBox").on("click", function(){

	});

	$(".informationAreaExit").on("click", function(){
		$(".informationArea").addClass("displayNone");
	});

//	-- Header --
	$(".searchBar input").on("click", function() {
		$(".searchBar").addClass("onSearchBar");
	});
	$(document).on("click", function(e) {
		if (!$(e.target).closest('.searchBar').length) {
			// フェードやスライドなどの処理方法を記述;
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
	
	//	説明用ポップアップウィンドウ
	$(".popup").on({
		"mouseenter":function(){
			let text = $(this).find(".popupText").val();
			let elem = $(".popupWindow");
			
			//update element
			elem.offset($(this).offset());
			elem.offset().top = $(".popupWindow").offset().top + 40;
			elem.offset({top:$(".popupWindow").offset().top + 40, left:$(".popupWindow").offset().left})
			elem.text(text);
			elem.removeClass("opacity0 hidden");
			elem.addClass("opacity07 show");
			
			
			
		},
		"mouseleave": function(){
			let elem = $(".popupWindow");
			elem.removeClass("opacity07 show");
			elem.addClass("opacity0 hidden");
		}
	});
});