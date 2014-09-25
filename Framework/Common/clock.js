
$(document).ready(function () {
	startTime();
});

function startTime() {
	var today = new Date();

	var yyyy = today.getFullYear();
	var MM = today.getMonth() + 1; MM = checkDigit(MM);
	var dd = today.getDate(); dd = checkDigit(dd);
	var day = today.getDay();
	switch (day) {
		case 0:
			day = "일";
			break;
		case 1:
			day = "월";
			break;
		case 2:
			day = "화";
			break;
		case 3:
			day = "수";
			break;
		case 4:
			day = "목";
			break;
		case 5:
			day = "금";
			break;
		case 6:
			day = "토";
			break;
	}
	var hh = today.getHours(); hh = checkDigit(hh);
	var mm = today.getMinutes(); mm = checkDigit(mm);
	var ss = today.getSeconds(); ss = checkDigit(ss);

	$("#currentTime").text(yyyy + "-" + MM + "-" + dd + " (" + day + ") " + hh + ":" + mm + ":" + ss);
	t = setTimeout(function () { startTime() }, 500);
}

function checkDigit(i) {
	if (i < 10) i = "0" + i;
	return i;
}