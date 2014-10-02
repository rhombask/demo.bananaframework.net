var isPersonalMenuShown = false;
$(window).resize(function () {
	// 메인 프레임 높이/넓이
	$("#frMain").css("height", $(window).height() - $("#frTop").height() - $("#frMenu").height() - $("#frTabs").height() - 10)
	$("#frMain").find("iframe").height("100%");
});
$(document).ready(function () {
	// 메인 프레임 높이
	$("#frMain")
		.css("top", $("#frTop").height() + $("#frMenu").height() + $("#frTabs").height())
		.css("height", $(window).height() - $("#frTop").height() - $("#frMenu").height() - $("#frTabs").height() - 10);

	// 페이지 로딩 중
	$("#divPageProgress")
		.css("top", ($(window).height() - $("#divPageProgress").height()) / 2)
		.css("left", ($(window).width() - $("#divPageProgress").width()) / 2)
		.hide();

	// 설정
	$("#settings button").click(function (e) {
		e.preventDefault();
		// 메뉴 보이기
		if (!isPersonalMenuShown) {
			$("#userMenu").slideDown("fast", function () {
				isPersonalMenuShown = true;
			});
		}
		// 숨기기
		else {
			hideUserMenu();
		}
	}).mouseover(function () {
		$(this).addClass("ui-icon-pink");
	}).mouseout(function () {
		$(this).removeClass("ui-icon-pink");
	});

	// 이용자메뉴
	$(document).click(function (e) { if ((isPersonalMenuShown) && ($(e.target).attr("id") != "config")) { hideUserMenu(); } });

	// 이용자메뉴 위치 이동
	$("#userMenu").css("left", $(window).width() - $("#userMenu").width() - 40);

	// 홈 탭 추가
	createTab("HOME", "HOME", "/View/Home.aspx", "HOME");

	// 탭 닫기 버튼 이벤트
	$("#tabClose").click(function () {
		closeCurrentTab();
	});
});

// 이용자메뉴 숨기기
function hideUserMenu() {
	$("#userMenu").slideUp("fast", function () {
		$(this).hide();
		isPersonalMenuShown = false;
	});
}

// 로그아웃 후, 이동할 경로
function userLogout() {
	location.href = "/Default.aspx";
}


// 드랍다운메뉴 콜백
function DropDown_Callback(node) {
	createTab(node.ID, node.NAME, node.URL, node.NOTE);
}

// 탭 닫기
function closeCurrentTab() {
	// 탭 제거
	var currentTabID = $("span").filter(".tab").filter(".on").attr("id");
	if (currentTabID.substring(2) != "HOME") {
		$("#" + currentTabID).remove();

		/*
		 * 아이프레임 제거
		 * 아이프레임은 탭 컨트롤의 id에서 처음 s_ 문자열 2개를 제외하면 찾을 수 있다.
		 */
		currentTabID = currentTabID.substring(2);
		$("#" + currentTabID).remove();

		// 마지막 탭 페이지 선택
		var index = $("span").filter(".tab").length;
		$("span").filter(".tab").filter(function (i) {
			if (i == index - 1) {
				// 탭 컨트롤 제거
				$(this).addClass("on");

				// 아이프레임 보이기
				currentTabID = $(this).attr("id").substring(2);
				$("#" + currentTabID).show();
				return;
			}
		});
	}
}

// 탭 생성
function createTab(id, name, url, note) {
	// 최초
	if ($("#s_" + id).length == 0) {
		// 기존 탭 비활성화
		$(".tab").removeClass("on");

		// 기존 아이프레임 숨김
		$(".frame").hide();

		// 탭 개체 생성
		var $a = $("<a>").attr("id", "a_" + id).attr("href", "javascript:void(0);").attr("targetID", id).attr("targetUrl", url).attr("title", note).text(name);
		// 홈 탭일 경우에는 오른쪽 마진을 3픽셀 추가
		if (id == "HOME") {
			$a.css("margin-right", "3px");
		}
		var $b = $("<button>").attr("id", "b_" + id).attr("targetID", id).addClass("ui-icon").addClass("ui-icon-blank");
		var $c = $("<span>").attr("id", "s_" + id).addClass("tab").addClass("on");
		var $d = $("#frTabs");

		// 탭 개체 추가
		$a.appendTo($c);
		// 홈 탭이 아닐 경우에만, 닫기 버튼 추가
		if (id != "HOME") {
			$b.appendTo($c);
		}
		$c.appendTo($d);

		// 탭 클릭 이벤트 추가
		$($c).children("a").click(function () {
			// 모든 탭의 on 클래스를 제거한다.
			$(".tab").removeClass("on");
			// 현재 탭에 on 클래스를 추가한다.
			$(this).parent("span").attr("class", "tab on");
			// 모든 아이프레임을 숨긴다.
			$(".frame").hide();
			// 현재 아이프레임을 보여준다.
			// HOME읹니 구분하고, if_ 붙이기
			$("#" + ($(this).attr("targetID") == "HOME" ? "HOME" : "if_" + $(this).attr("targetID"))).show();
		});

		// 탭 닫기 이벤트 추가
		$(".tab button").click(function (e) {
			e.preventDefault();
			$("#s_" + $(this).attr("targetID")).remove();
			$("#" + ($(this).attr("targetID") == "HOME" ? "HOME" : "if_" + $(this).attr("targetID"))).remove();

			// 마지막 탭 보이기
			$(".tab:last").attr("class", "tab on").show();

			// 마지막 아이프레임 보이기
			$(".frame:last").show();
		}).mouseover(function () {
			$(this).addClass("ui-icon-close");
		}).mouseout(function () {
			$(this).removeClass("ui-icon-close");
		});

		// 코너 처리
		$c.css("border-top-left-radius", "4px").css("border-top-right-radius", "4px");

		// 로딩중
		$("#divPageProgress").show();

		// 탭 마우스오버 이벤트 추가
		$($c).mouseover(function () {
			$(this).children("button").addClass("ui-icon-close");
		}).mouseout(function () {
			$(this).children("button").removeClass("ui-icon-close");
		});

		// 아이프레임 개체 생성
		var $e = $("<iframe>").attr("id", (id == "HOME" ? "" : "if_") + id).attr("frameborder", "0").attr("src", url).addClass("frame");
		var $f = $("#frMain");

		// 아이프레임 개체 추가
		$e.appendTo($f);
		$e.show();

		// 아이프레임 로딩 완료 시, 로딩중 메시지 숨기고 click 이벤트 추가
		$e.load(function () {
			$("#divPageProgress").hide();
			$(this).contents().click(function (e) {
				parent.$.DropDownMenu.Hide();
				parent.hideUserMenu();
			});
		});

		// 아이프레임 높이 설정
		$e.height($("#frMain").height() - 2);
	}
	// 재클릭
	else {
		// 모든 탭의 on 클래스를 제거한다.
		$(".tab").removeClass("on");
		// 현재 탭에 on 클래스를 추가한다.
		$("#s_" + id).attr("class", "tab on");
		// 모든 아이프레임을 숨긴다.
		$(".frame").hide();
		
		/*
		 * 기본적으로 탭페이지를 재클릭하면, 해당 탭페이지를 활성화 시키고 보여주는 것으로 끝난다.
		 * 하지만, 경로에 ?가 포함되면, 사용자 ui에서 강제로 열고 있다고 판단하고 아이프레임의 src를 다시 바인딩 하도록 한다.
		 */
		if (url.indexOf("?") > -1) {
			$("#if_" + id).attr("src", url);
		}
		// 현재 아이프레임을 보여준다.
		$("#if_" + id).show();
	}
}

// 자식창 닫으면서 부모창 새로고침
function fn_Reflash() {
    opener.parent.location.href = opener.parent.document.URL; // 부모창 새로고침
    this.close();        // 팝업창 닫기
}
