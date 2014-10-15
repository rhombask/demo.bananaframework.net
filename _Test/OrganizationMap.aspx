<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizationMap.aspx.cs" Inherits="demo.bananaframework.net._Test.OrganizationMap" %>

<%@ Register Assembly="OrganizationChart" Namespace="OrganizationChart" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<link href="/Common/Scripts/primitives/primitives.latest.css" rel="stylesheet" />
	<link href="/Common/Scripts/primitives/ui-lightness/jquery-ui-1.10.2.custom.min.css" rel="stylesheet" />
	<style type="text/css">
		body{margin:0;padding:0;}
	</style>
	<script src="/Common/Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="/Common/Scripts/primitives/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="/Common/Scripts/primitives/primitives.min.js?204"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#orgDiagram").width( $(window).width() - 10 );
			$("#orgDiagram").height( $(window).height() - 10 );
		});
	</script>
</head>
<body style="background-color: #ffffff;">
	<form id="form1" runat="server">
	<asp:ScriptManager ID="ScriptManager" runat="server">
	</asp:ScriptManager>
	<cc1:OrgDiagramServerControl ID="orgDiagram" runat="server"
		BorderColor="#000066" BorderStyle="Solid" BorderWidth="1px" MaximumColumnsInMatrix="5" DotItemsInterval="10" DotLevelShift="10" ChildrenPlacementType="Horizontal" ShowButtons="False" ShowCheckBoxes="False" PageFitMode="None">
	</cc1:OrgDiagramServerControl>
	</form>
	<script type="text/javascript" src="/Common/Scripts/primitives/UserTemplates.js?1029"></script>
</body>
</html>
