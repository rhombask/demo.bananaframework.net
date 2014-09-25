<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopupFrame.aspx.cs" Inherits="demo.bananaframework.net.Framework.Common.PopupFrame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>팝업 프레임</title>
	<style type="text/css">
		html{height:100%;}
		body{padding:0px;margin:0px;height:100%;overflow-x:hidden;}
	</style>
	<script src="/Common/Scripts/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#<%=_ifPOPUP.ClientID %>").width($(window).width());
			$("#<%=_ifPOPUP.ClientID %>").height($(window).height());

			$("#<%=_ifPOPUP.ClientID %>").load(function () {
				document.title = $("#<%=_ifPOPUP.ClientID %>").contents().find("title").html();
			});
		});

		$(window).resize(function () {
			$("#<%=_ifPOPUP.ClientID %>").width($(window).width());
			$("#<%=_ifPOPUP.ClientID %>").height($(window).height());
		});
	</script>
</head>
<body>
    <form id="form1" runat="server">
		<iframe id="_ifPOPUP" runat="server" frameborder="0" style="width: 100%; height: 100%; overflow-x: none; overflow-y: scroll;"></iframe>
    </form>
</body>
</html>
