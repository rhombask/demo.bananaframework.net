<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="500.aspx.cs" Inherits="demo.bananaframework.net.Common._500" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>알 수 없는 오류가 발생했습니다.</title>
	<link href="/Common/Css/default.css" rel="stylesheet" />
	<link href="/Common/Css/Error.css" rel="stylesheet" />
	<script src="/Common/Scripts/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#container").height($(document).height() - 45);
			$("#StackTrace").hide();
		});

		function showStackTrace() {
			$("#StackTrace").slideToggle();
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<div id="container">
		<h1>500 Error</h1>
		<fieldset id="errorMessage">
			<legend>오류메시지</legend>
			<div id="Message" runat="server" />
		</fieldset>
		<fieldset id="errorStackTrace">
			<legend><a href="javascript:showStackTrace();">StackTrace</a></legend>
			<div id="StackTrace" runat="server" />
		</fieldset>
	</div>
	</form>
</body>
</html>
