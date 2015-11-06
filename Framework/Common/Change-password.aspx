<%@ Page Title="비밀번호 변경" Language="C#" MasterPageFile="~/Controllers/Popup.Master" AutoEventWireup="true" CodeBehind="Change-password.aspx.cs" Inherits="demo.bananaframework.net.Framework.Common.Change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
	<h1 onclick="javascript:close();">비밀번호 변경</h1>
	<p>기존 비밀번호, 신규 비밀번호 및 비밀번호 확인을 입력하시면 변경이 가능합니다.</p>
	<div class="popupContent" style="width:420px;margin-left:-210px;">
		<fieldset>
			<legend>비밀번호 입력</legend>
			<asp:TextBox ID="_txtPassword1" runat="server" TextMode="Password" placeholder="기존 비밀번호" required="required" />
			<asp:TextBox ID="_txtPassword2" runat="server" TextMode="Password" placeholder="신규 비밀번호" required="required" />
			<asp:TextBox ID="_txtPassword3" runat="server" TextMode="Password" placeholder="비밀번호 확인" required="required" />
		</fieldset>
		<asp:Label ID="_lblResult" runat="server" CssClass="result" />
		<div class="popupContent" style="width:120px;margin-left:-60px;margin-top:20px;"><asp:Button ID="_btnOK" runat="server" Text="확  인" CssClass="commandButton" OnClick="_btnOK_Click" /></div>
	</div>
</asp:Content>
