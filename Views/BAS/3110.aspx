<%@ Page Title="이용자정보관리 상세" Language="C#" MasterPageFile="~/Controllers/Web.Master" AutoEventWireup="true" CodeBehind="3110.aspx.cs" Inherits="demo.bananaframework.net.Views.BAS._3110" %>
<%@ Register Assembly="BANANA.Web.Controls.v4.5" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
    <fieldset id="basic">
		<legend>기본 정보</legend>
		<table class="infoTable">
			<tr>
				<td class="infoCol" style="width:120px;">이용자명</td>
				<td class="inputCol"><bf:TextBox ID="_txtNAME" runat="server" Compulsory="true" ValidationGroup="_vgUser" /></td>
				<td class="infoCol" style="width:120px;">이용자ID</td>
				<td class="inputCol"><bf:TextBox ID="_txtUSRID" runat="server" Compulsory="true" MaxLength="10" ValidationGroup="_vgUser" /></td>
                <td class="infoCol" style="width:120px;">비밀번호</td>
				<td class="inputCol"><bf:TextBox ID="_txtPWD" runat="server" Compulsory="true" ValidationGroup="_vgUser" /></td>
			</tr>
            <tr>
				<td class="infoCol" style="width:120px;">사용자그룹</td>
				<td class="inputCol"><bf:DropDownList ID="_ddlUSER_GRP" runat="server" Compulsory="true" ValidationGroup="_vgUser" /></td>
				<td class="infoCol" style="width:120px;">전화번호</td>
				<td class="inputCol"><bf:TextBox ID="_txtTELNO" runat="server" ImeMode="DashNumeric" /></td>
                <td class="infoCol" style="width:120px;">E-Mail</td>
				<td class="inputCol"><bf:TextBox ID="_txtEMAIL" runat="server" ImeMode="Email" /></td>
			</tr>
			<tr>
				<td class="infoCol">비고</td>
				<td class="inputCol" colspan="5"><bf:TextBox ID="_txtBIGO" runat="server" Width="90%" TextMode="MultiLine" Rows="5" /></td>
			</tr>
		</table>
		<div id="_dvSYSINFO" runat="server" class="infoSystem" />
		<div class="infoCommand">
			<bf:Button ID="_btnSave" runat="server" ButtonImage="Save" Text="저장" ButtonConfirm="True" ValidationGroup="_vgUser" OnClick="_btnSave_Click" />
                <bf:Button ID="_btnDelete" runat="server" ButtonImage="Delete" Text="삭제" ButtonConfirm="True" OnClick="_btnDelete_Click" />
                <bf:Button ID="_btnList" runat="server" Text="목록" ButtonImage="List" OnClick="_btnList_Click" />
		</div>
	</fieldset>
</asp:Content>
