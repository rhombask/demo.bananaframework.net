<%@ Page Title="권한그룹관리 상세" Language="C#" MasterPageFile="~/Control/Web.Master" AutoEventWireup="true" CodeBehind="3210.aspx.cs" Inherits="demo.bananaframework.net.View.BAS._3210" %>
<%@ Register Assembly="BANANA.Web.Controls.v4.5" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
    <fieldset id="basic">
		<legend>기본 정보</legend>
		<table class="infoTable">
			<tr>
				<td class="infoCol" style="width:120px;">공통코드</td>
				<td class="inputCol"><bf:Label ID="_lblTOTAL_CODE" runat="server" /></td>
				<td class="infoCol" style="width:120px;">메인코드</td>
				<td class="inputCol"><bf:Label ID="_lblMAIN_CODE" runat="server" /></td>
				<td class="infoCol" style="width:120px;">서브코드</td>
				<td class="inputCol"><bf:Label ID="_lblSUB_CODE" runat="server" /></td>
			</tr>
			<tr>
				<td class="infoCol">코드명</td>
				<td class="inputCol"><bf:TextBox ID="_txtCODE_NAME" runat="server" Compulsory="True" ValidationGroup="Save" /></td>
				<td class="infoCol">사용여부</td>
				<td class="inputCol"><bf:CheckBox ID="_chkDISPLAYYN" runat="server" Text="사용" /></td>
				<td class="infoCol">순서</td>
				<td class="inputCol"><bf:TextBox ID="_txtORDERBY" runat="server" ImeMode="Integer" /></td>
			</tr>
			<tr>
				<td class="infoCol">비고1</td>
				<td class="inputCol"><bf:TextBox ID="_txtBIGO1" runat="server" Width="90%" /></td>
				<td class="infoCol">비고2</td>
				<td class="inputCol"><bf:TextBox ID="_txtBIGO2" runat="server" Width="90%" /></td>
				<td class="infoCol">비고3</td>
				<td class="inputCol"><bf:TextBox ID="_txtBIGO3" runat="server" Width="90%" /></td>
			</tr>
			<tr>
				<td class="infoCol">비고4</td>
				<td class="inputCol"><bf:TextBox ID="_txtBIGO4" runat="server" Width="90%" ImeMode="Decimal" /></td>
				<td class="infoCol">비고5</td>
				<td class="inputCol"><bf:TextBox ID="_txtBIGO5" runat="server" Width="90%" ImeMode="Decimal" /></td>
				<td class="infoCol">비고6</td>
				<td class="inputCol"><bf:TextBox ID="_txtBIGO6" runat="server" Width="90%" ImeMode="Decimal" /></td>
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
