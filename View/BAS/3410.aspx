<%@ Page Title="" Language="C#" MasterPageFile="~/Control/Web.Master" AutoEventWireup="true" CodeBehind="3410.aspx.cs" Inherits="demo.bananaframework.net.View.BAS._3410" %>
<%@ Register Assembly="BANANA.Web.Controls.v4.5" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
    <fieldset id="basic">
		<legend>기본 정보</legend>
		<table class="infoTable">
			<tr>
				<td class="infoCol" style="width:120px;">프로그램ID</td>
				<td class="inputCol"><bf:TextBox ID="_txtID" runat="server" Compulsory="true" MaxLength="10" ValidationGroup="_vgPrg" /></td>
				<td class="infoCol" style="width:120px;">프로그램명</td>
				<td class="inputCol"><bf:TextBox ID="_txtNAME" runat="server" Compulsory="true" ValidationGroup="_vgPrg" /></td>
                <td class="infoCol" style="width:120px;">사용여부</td>
				<td class="inputCol">
                    <bf:RadioButtonList ID="_rblUSE_YN" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"  >
                        <asp:ListItem Text="사용" Value="1" Selected="True" />
                        <asp:ListItem Text="미사용" Value="0" />
			        </bf:RadioButtonList>
				</td>
			</tr>
            <tr>
				<td class="infoCol" style="width:120px;">프로그램경로</td>
				<td class="inputCol"><bf:TextBox ID="_txtURL" runat="server" /></td>
				<td class="infoCol" style="width:120px;">부모 프로그램ID</td>
				<td class="inputCol"><bf:TextBox ID="_txtPID" runat="server" /></td>
                <td class="infoCol" style="width:120px;">순번</td>
				<td class="inputCol"><bf:TextBox ID="_txtORDNO" runat="server" ImeMode="Integer" /></td>
			</tr>
			<tr>
				<td class="infoCol">자식 프로그램 경로</td>
				<td class="inputCol" colspan="5"><bf:TextBox ID="_txtCHILD_ID" runat="server" Width="90%" TextMode="MultiLine" Rows="5" /><br /><br />
					<span style="line-height:20px;">자식 프로그램ID는 기본적으로 부모 프로그램의 권한을 따라가도록 설계되어 있습니다.<br />부모 프로그램을 인식시키기 위해서는 "/View/BAS/3310.aspx;"와 같이 부모 프로그램 정보에 자식 프로그램ID들을 입력해 주어야 합니다.<br />
					이때, 자식 프로그램의 경로와 함께 세미콜론(;)을 마지막에 꼭 붙여줘야 합니다.
					</span>
				</td>
			</tr>
            <tr>
				<td class="infoCol">메모</td>
				<td class="inputCol" colspan="5"><bf:TextBox ID="_txtNOTE" runat="server" Width="90%" TextMode="MultiLine" Rows="5" /></td>
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
