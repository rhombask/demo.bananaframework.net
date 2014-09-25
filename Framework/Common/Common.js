
// 개인정보 수정
function showMyInfo() {
	$("#userMenu").hide();
	viewModalPopup("/Framework/Common/Change-my-information.aspx", 600, 400);
}

// 비밀번호 변경
function showPassword() {
	$("#userMenu").hide();
	viewModalPopup("/Framework/Common/Change-password.aspx", 500, 350);
}

// 아이디와 비밀번호 찾기
function findIdAndPW() {
	viewModalPopup("/Framework/Common/Find-my-id-and-password.aspx", 500, 300);
}

// 팝업창 오픈
function viewModalPopup(_strUrl, _intW, _intH, _strScroll) {
	var retValue	= new Array(); // 자식창 반환 값
	var winWidth	= _intW == undefined ? 800 : _intW;
	var winHeight	= _intH == undefined ? 600 : _intH;
	var winOption	= "dialogwidth:" + winWidth + "px; dialogheight:" + winHeight + "px; resizable:yes; help:no; scroll:" + _strScroll + "; status:yes; unadorned:1;";
	retValue		= window.showModalDialog("/Framework/Common/PopupFrame.aspx?url=" + _strUrl, self, winOption);
	return retValue;
}

// 작성자: 한인수
// 작성일: 2014-08-27
// 설  명: 부모창에 REFRESH 전달
function returnRefresh() {
    retValue			= new Array();
    retValue[0]			= "REFRESH";
    window.returnValue	= retValue;
    window.close();
}
