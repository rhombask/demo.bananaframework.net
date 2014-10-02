<%@ Page Title="메인코드 상세" Language="C#" MasterPageFile="~/Control/Web.Master" AutoEventWireup="true" CodeBehind="1010.aspx.cs" Inherits="demo.bananaframework.net.View.BAS._1010" %>

<%@ Register Assembly="BANANA.Web.Controls" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
	<fieldset id="basic">
		<legend>기본 정보</legend>
		<table class="infoTable">
			<tr>
				<td class="infoCol" style="width:120px;">메인코드</td>
				<td class="inputCol"><bf:TextBox ID="_txtMAIN_CODE" runat="server" MaxLength="3" /></td>
				<td class="infoCol" style="width:120px;">코드명</td>
				<td class="inputCol"><bf:TextBox ID="_txtCODE_NAME" runat="server" Compulsory="True" ValidationGroup="Save" /></td>
			</tr>
			<tr>
				<td class="infoCol">비고</td>
				<td class="inputCol" colspan="3"><bf:TextBox ID="_txtBIGO" runat="server" Width="90%" TextMode="MultiLine" Rows="5" /></td>
			</tr>
		</table>
		<div id="_dvSYSINFO" runat="server" class="infoSystem" />
		<div class="infoCommand">
			<bf:Button ID="_btnSave" runat="server" Text="저장" ButtonImage="Save" OnClick="_btnSave_Click" ButtonConfirm="True" ValidationGroup="Save" />
			<bf:Button ID="_btnDel" runat="server" Text="삭제" ButtonImage="Delete" ButtonConfirm="True" OnClick="_btnDel_Click" />
			<bf:Button ID="_btnList" runat="server" Text="목록" ButtonImage="List" OnClick="_btnList_Click" />
		</div>
	</fieldset>
</asp:Content>
