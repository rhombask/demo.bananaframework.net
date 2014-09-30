
// 개인정보 수정
function showMyInfo() {
	$("#userMenu").hide();
	openModalPopup("/Framework/Common/Change-my-information.aspx", 600, 400);
}

// 비밀번호 변경
function showPassword() {
	$("#userMenu").hide();
	openModalPopup("/Framework/Common/Change-password.aspx", 500, 350);
}

// 아이디와 비밀번호 찾기
function findIdAndPW() {
	openModalPopup("/Framework/Common/Find-my-id-and-password.aspx", 500, 300);
}

// 팝업창 오픈
function openModalPopup(url, w, h, callback) {
	var winWidth	= w == undefined ? 800 : w;
	var winHeight	= h == undefined ? 600 : h;

	// 배경 div 깔기
	var $backGround	= $("<div />")
		.css("top", "0px")
		.css("left", "0px")
		.css("background-color", "#5c4a4a")
		.css("opacity", "0.4")
		.css("position", "absolute")
		.css("z-index", "100000")
		.css("cursor", "no-drop")
		.width( $(window).width() )
		.height( $(window).height() )
		.appendTo("body");

	// 모달 팝업 뛰우기
	$("#_popupFrame").dialog({
		iframe: true,
		resizable: true,
		height: winHeight,
		width: winWidth,
		close : function() {
			$backGround.remove();
			callback($(this).data("args"));
		},
		resizeStart: function() {
			$("#_popupFrame").hide();
		},
		resizeStop: function() {
			$("#_popupFrame").show();
		}
	}).width(winWidth).height(winHeight - 4)
		.css("overflow-x", "hidden")
		.css("overflow-y", "auto")
		.attr("src", url);

	// 모달 팝업 제목 변경
	$("#_popupFrame").load(function () {
		$(this).dialog("option", "title", $(this).contents().find("title").html().trim());
	});
}

// 팝업창 닫기
function closeModalPopup() {
	$("#_popupFrame").data("args", arguments);
	$("#_popupFrame").dialog("close");
}