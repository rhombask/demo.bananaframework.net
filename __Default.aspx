<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="__Default.aspx.cs" Inherits="demo.bananaframework.net.__Default" %>

<%@ Register Assembly="BANANA.Web.Controls" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>로그인</title>
	<link href="/Common/Css/default.css" rel="stylesheet" />
	<link href="/Common/Css/login.css" rel="stylesheet" />
	<script src="/Common/Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="/Framework/Common/Common.js" type="text/javascript"></script>
</head>
<body>
	<form id="login" runat="server">
	<h1>Log In</h1>
	<fieldset id="inputs">
		<legend>로그인 항목</legend>
		<asp:TextBox ID="_txtUserID" runat="server" CssClass="loginID" placeholder="로그인 계정" autofocus="autofocus" required="required" />
		<asp:TextBox ID="_txtUserPassword" runat="server" TextMode="Password" CssClass="loginPW" placeholder="비밀번호" required="required" />
	</fieldset>
	<fieldset id="actions">
		<legend>로그인 버튼</legend>
		<asp:Button ID="_btnLOGIN" runat="server" Text="로그인" CssClass="loginButton" OnClick="_btnLOGIN_Click" />
		<a href="javascript:findIdAndPW();">아이디 혹은 비밀번호를 잊으셨나요?</a>
	</fieldset>
	</form>
</body>
</html>
