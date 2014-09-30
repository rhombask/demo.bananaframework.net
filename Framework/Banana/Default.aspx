<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="demo.bananaframework.net.Framework.Banana.Default" %>

<%@ Register Assembly="BANANA.Web.Controls" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>바나나 템플릿</title>
	<link href="/Common/Css/jquery-ui.css" rel="stylesheet" />
	<link href="/Framework/Banana/banana.css" rel="stylesheet" />
	<script src="/Common/Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="/Common/Scripts/jquery.ui-1.9.2.min.js" type="text/javascript"></script>
	<script src="/Framework/Banana/banana.js" type="text/javascript"></script>
	<script src="/Framework/Common/Common.js" type="text/javascript"></script>
	<script src="/Framework/Common/clock.js" type="text/javascript"></script>
</head>
<body>
	<form id="form1" runat="server">
	<div id="frContainer">
		<div id="frTop">
			<div id="logo"><a href="/Framework/Banana/Default.aspx"><img src="/Images/logo.png" class="logo" alt="BANANA Framework v4.2" title="BANANA Framework v4.2" /></a></div>
			<div id="controlPanel">
				<div id="currentTime">2013-02-11 15:45:59</div>
				<div id="currentInfo">
					<div id="settings"><button id="config" class="ui-icon ui-icon-gear"></button></div>
					<div id="userInfo"><asp:Label ID="_lblWelcome" runat="server" /></div>
					<div id="userMenu">
						<div><asp:LinkButton ID="_btnLogout" runat="server" Text="로그아웃" OnClick="_btnLogout_Click" /></div>
						<div><a href="javascript:showMyInfo();">개인정보 수정</a></div>
						<div><a href="javascript:showPassword();">비밀번호 변경</a></div>
					</div>
					<div id="organization" style="display: none;"><asp:DropDownList ID="_ddlCompany" runat="server" CssClass="DropDownListBehavior" /></div>
				</div>
			</div>
		</div>
		<div id="frMenu">
			<bf:DropDownMenu ID="DropDownMenu1" runat="server" />
		</div>
		<div id="frTabs">
			<div style="float: right; margin: 5px 3px 0 0;">
				<%--<input type="button" class="ui-icon ui-icon-circle-triangle-w" style="margin-right: -5px;" />
				<input type="button" class="ui-icon ui-icon-circle-triangle-e" style="margin-right: -5px;" />--%>
				<input type="button" id="tabClose" class="ui-icon ui-icon-circle-close" style="margin-right: -5px;" />
			</div>
		</div>
		<div id="frMain"></div>
		<div id="divPageProgress">
			<img src="/Images/ajax-loader.gif" alt="Loading..." title="화면을 로딩 중입니다. 잠시만 기다리세요..." style="position: absolute; top: 50%; margin-top: -23px; margin-left: 10px;" />
			<span style="position: absolute; top: 50%; margin-top: -6px; margin-left: 70px; font-size: 12px;">화면을 로딩 중입니다. 잠시만 기다리세요...</span>
		</div>
		<iframe id="_popupFrame" style="display:none;" />
	</div>
	</form>
</body>
</html>
