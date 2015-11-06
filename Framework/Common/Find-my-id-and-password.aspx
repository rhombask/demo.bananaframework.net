<%@ Page Title="아이디/비밀번호 찾기" Language="C#" MasterPageFile="~/Controllers/Popup.Master" AutoEventWireup="true" CodeBehind="Find-my-id-and-password.aspx.cs" Inherits="demo.bananaframework.net.Framework.Common.Find_my_id_and_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<style type="text/css">
		.result { margin-top:10px;color:blue; }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
	<h1>아이디/비밀번호 찾기</h1>
	<p>성명과 이메일주소를 입력하시면, 아이디와 비밀번호를 확인하실 수 있습니다.</p>
	<div class="popupContent" style="width:420px;margin-left:-210px;">
		<fieldset>
			<legend>성명/이메일 입력</legend>
			<asp:TextBox ID="_txtUserName" runat="server" placeholder="성명" required="required" />
			<asp:TextBox ID="_txtEmail" runat="server" placeholder="이메일주소" required="required" />
		</fieldset>
		<asp:Label ID="_lblResult" runat="server" CssClass="result" />
		<div class="popupContent" style="width:120px;margin-left:-60px;margin-top:20px;"><asp:Button ID="_btnOK" runat="server" Text="확  인" CssClass="commandButton" OnClick="_btnOK_Click" /></div>
	</div>
</asp:Content>
