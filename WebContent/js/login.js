/**
 * login.jsp
 */

$(function(){
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