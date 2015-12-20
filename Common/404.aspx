<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="demo.bananaframework.net.Common._404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>페이지를 찾을 수 없습니다.</title>
	<link href="/Common/Css/default.css" rel="stylesheet" />
	<link href="/Common/Css/Error.css" rel="stylesheet" />
	<script src="/Common/Scripts/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#container").height($(document).height() - 45);
		});
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<div id="container">
		<h1>404 Error</h1>
		<fieldset id="errorMessage">
			<legend>오류메시지</legend>
			<div id="Message" runat="server" />
		</fieldset>
	</div>
	</form>
</body>
</html>
