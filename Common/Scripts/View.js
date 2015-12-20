// 설  명 : 그리드 헤더 체크 박스 체크(해당 컬럼만 전체 체킹)
function toggleCheckBox(_sender, _strClassName) {
    $("." + _strClassName).each(function () {

        if ($(_sender).prop("checked") == true) {
            $(this).children("input").prop("checked", true);

            if ($(this).children("input").prop("Enabled") == true) {
                $(this).children("input").prop("checked", true);
            }
        }
        else {
            $(this).children("input").removeAttr("checked");
        }
    });
}

// 설  명 : 그리드 내부에 RadioButton 등록 시 하나만 체크하게 유도하는 함수
function toggleRadioButton(_sender, _strClassName) {
    $("." + _strClassName).each(function () {
        $(this).children("input").removeAttr("checked");
    });
    $(_sender).prop("checked", true);
}

/* 제  목: 그리드에서 추가 화면을 호출함
 * 설  명: Banana 프레임워크용으로 우선 개발해 놨다.
 */
function showNewMenu(id, name, url) {
	// Banana 프레임워크의 탭 여는 함수를 호출한다.
	parent.createTab(id, name, url, '');
}