<%@ Page Title="게시물 상세보기/작성하기" Language="C#" MasterPageFile="~/Controllers/Popup.Master" AutoEventWireup="true" CodeBehind="1010.aspx.cs" Inherits="demo.bananaframework.net.Views.BRD._1010" %>

<%@ Register Assembly="BANANA.Web.Controls.v4.5" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
	<fieldset>
		<legend>지사 기본정보</legend>
		<table class="infoTable">
			<tr>
				<td class="infoCol" style="width: 120px;">게시판DB</td>
				<td class="inputCol" style="width: 200px;"><bf:DropDownList ID="_ddlDB" runat="server" /></td>
				<td class="infoCol" style="width: 120px;">작성자</td>
				<td class="inputCol" style="width: 200px;"><bf:TextBox ID="_txtWRITER_NAME" runat="server" /></td>
				<td class="infoCol" style="width: 120px;">공지여부</td>
				<td class="inputCol"><bf:CheckBox ID="_chkNOTICEFLAG" runat="server" Text="체크하면, 게시물의 가장 위쪽에 항상 표시됩니다." /></td>
			</tr>
			<tr>
				<td class="infoCol">제목</td>
				<td class="inputCol" colspan="5"><bf:TextBox ID="_txtSUBJECT" runat="server" Width="90%" /></td>
			</tr>
			<tr>
				<td class="infoCol">내용</td>
				<td class="inputCol" colspan="5"><bf:TextBox ID="_txtCONTENT" runat="server" Width="90%" Height="300px" TextMode="MultiLine" /></td>
			</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend>명령수행</legend>
		<div id="_dvSYSINFO" runat="server" class="infoSystem" />
		<div class="infoCommand">
			<bf:Button ID="_btnSave" runat="server" Text="저장" ButtonImage="Save" ButtonConfirm="True" ValidationGroup="Save" OnClick="_btnSave_Click" />
			<!--
			parent.closeModalPopup() 함수에 필요한 변수(들)를 던지면, 창이 닫혔다는 이벤트와 함께 목록 페이지에서 해당 변수들을 받을 수 있습니다.
			-->
			<bf:Button ID="_btnList" runat="server" Text="닫기" ButtonImage="Cancel" OnClientClick="javascript:parent.closeModalPopup();" />
		</div>
	</fieldset>
</asp:Content>
