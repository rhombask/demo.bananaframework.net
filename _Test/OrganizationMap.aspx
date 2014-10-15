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
		#controlPanel{font-size:12px;}
		#controlPanel fieldset {margin-top:5px;margin-bottom:5px;float:left;height:40px;}
	</style>
	<script src="/Common/Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="/Common/Scripts/primitives/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="/Common/Scripts/primitives/primitives.min.js?204"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#orgDiagram").width( $(window).width() - 10 );
			$("#orgDiagram").height( $(window).height() - $("#controlPanel").height() - 10 );
		});
	</script>
</head>
<body style="background-color: #ffffff;">
	<form id="form1" runat="server">
	<asp:ScriptManager ID="ScriptManager" runat="server">
	</asp:ScriptManager>
	<div id="controlPanel" style="background-color:yellow;width:100%;height:60px;">
		<fieldset>
			<legend>조직도타입</legend>
			<input type="radio" id="Radio3" /><label for="Radio3">추천</label>
			<input type="radio" id="Radio4" /><label for="Radio4">후원</label>
		</fieldset>
		<fieldset>
			<legend>페이지 맞춤</legend>
			<input type="radio" id="pageFit01" /><label for="pageFit01">없음</label>
			<input type="radio" id="pageFit02" /><label for="pageFit02">넓이</label>
			<input type="radio" id="pageFit03" /><label for="pageFit03">높이</label>
			<input type="radio" id="pageFit04" /><label for="pageFit04">페이지</label>
		</fieldset>
		<fieldset>
			<legend>방향</legend>
			<input type="radio" id="Radio1" /><label for="Radio1">상하</label>
			<input type="radio" id="Radio2" /><label for="Radio2">좌우</label>
		</fieldset>
		<fieldset>
			<legend>연결선 종류</legend>
			<input type="radio" id="Radio5" /><label for="Radio5">꺾은선</label>
			<input type="radio" id="Radio6" /><label for="Radio6">직선</label>
			<input type="radio" id="Radio7" /><label for="Radio7">곡선</label>
		</fieldset>
		<fieldset>
			<legend>그래픽</legend>
			<input type="radio" id="Radio8" /><label for="Radio8">SVG</label>
			<input type="radio" id="Radio9" /><label for="Radio9">Canvas</label>
			<input type="radio" id="Radio10" /><label for="Radio10">VML</label>
		</fieldset>
		<fieldset>
			<legend>찾기</legend>
			<input type="radio" id="Radio11" /><label for="Radio11">최상위</label>
			<input type="text" id="Radio12" /><button>검색</button>
		</fieldset>
	</div>
	<cc1:OrgDiagramServerControl ID="orgDiagram" runat="server"
		BorderColor="#000066" BorderStyle="Solid" BorderWidth="1px" MaximumColumnsInMatrix="5" DotItemsInterval="10" DotLevelShift="10" ChildrenPlacementType="Horizontal" ShowButtons="False" ShowCheckBoxes="False" PageFitMode="None">
	</cc1:OrgDiagramServerControl>
	</form>
	<script type="text/javascript" src="/Common/Scripts/primitives/UserTemplates.js?1029"></script>
</body>
</html>
