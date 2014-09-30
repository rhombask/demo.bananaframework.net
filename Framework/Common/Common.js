
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

	var $popup		= $("#_popupFrame");

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

	// 로딩중
	var $loading	= $("#divPageProgress").clone(true);

	// 모달 팝업 뛰우기
	$popup.dialog({
		iframe: true,
		resizable: true,
		height: winHeight,
		width: winWidth,
		close : function() {
			// 모달 배경 없애기
			$backGround.remove();
			// 로딩중 없애기
			$loading.remove();
			$(this).attr("src", "about:blank");
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

	// 로딩중 보이기
	$loading
		.insertBefore($popup)
		.css("top", ($popup.height() - $loading.height()) / 2)
		.css("left", ($popup.width() - $loading.width()) / 2)
		.show();

	// 모달 팝업 제목 변경
	$popup.load(function () {
		// 팝업이 닫힐 때에는 about:blank로 리디렉션 시키는데, 이때에는 title이 없을 수 있으므로 예외 처리를 한다.
		$(this).dialog("option", "title", $(this).contents().find("title").html() != undefined ? $(this).contents().find("title").html().trim() : "");
		// 로딩중 없애기
		$loading.remove();
	});
}	

// 팝업창 닫기
function closeModalPopup() {
	$("#_popupFrame").data("args", arguments);
	$("#_popupFrame").dialog("close");
}