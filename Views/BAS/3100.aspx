<%@ Page Title="이용자정보관리" Language="C#" MasterPageFile="~/Controllers/Web.Master" AutoEventWireup="true" CodeBehind="3100.aspx.cs" Inherits="demo.bananaframework.net.Views.BAS._3100" %>

<%@ Register Assembly="BANANA.Web.Controls.v4.5" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
	<fieldset id="search">
		<legend>검색조건</legend>
		<table class="gridSearch">
			<tr>
				<td class="searchLabel">
					<bf:Label ID="Label1" runat="server" Text="그룹" /></td>
				<td class="searchObject">
					<bf:DropDownList ID="_ddlUSER_GRP" runat="server" /></td>
				<td class="searchLabel">
					<bf:Label ID="Label2" runat="server" Text="이용자명" /></td>
				<td class="searchObject"><bf:TextBox ID="_txtNAME" runat="server" /></td>
				<td class="searchLabel">
					<bf:Label ID="Label3" runat="server" Text="이용자ID" /></td>
				<td class="searchObject"><bf:TextBox ID="_txtUSRID" runat="server" /></td>
				<td class="searchButton">
					<bf:Button ID="_btnSearch" runat="server" Text="검색" OnClick="_btnSearch_Click" />
					<bf:Button ID="_btnNew" runat="server" ButtonImage="New" Text="신규 등록" OnClick="_btnNew_Click" />
					<bf:Button ID="_btnDel" runat="server" ButtonImage="Delete" Text="계정 삭제" OnClick="_btnDel_Click" />
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset id="result">
		<legend>검색결과</legend>
		<bf:FixedGrid ID="FixedGrid1" runat="server" Dock="Fill" ShowRowNumber="true" AllowPaging="true" OnPageIndexChanged="FixedGrid1_PageIndexChanged" OnPageSizeChanged="FixedGrid1_PageSizeChanged" PageSize="50,100,300,500">
			<bf:TemplateField ID="_CKF_ALL" HorizontalAlignment="Center" Width="50px">
				<ItemTemplate>
					<bf:CheckBox ID="_ckbSELECT" runat="server" CssClass="_ckbSELECT" />
				</ItemTemplate>
				<HeaderTemplate>
					<bf:CheckBox ID="_ckb_H_SELECT" runat="server" onclick="toggleCheckBox(this, '_ckbSELECT');" />
				</HeaderTemplate>
			</bf:TemplateField>
			<bf:BoundDataField ID="NAME" DataTextField="NAME" HeaderText="이용자명" HorizontalAlignment="Center" />
			<bf:TemplateField ID="USRID" HeaderText="이용자ID" HorizontalAlignment="Center">
				<ItemTemplate>
					<bf:HyperLink ID="_hlUSRID" runat="server" Text='<%# Eval("USRID") %>' NavigateUrl='<%# string.Format("/Views/BAS/3110.aspx?USRID={0}", Eval("USRID")) %>' />
				</ItemTemplate>
			</bf:TemplateField>
			<bf:BoundDataField ID="USER_GRP_NM" DataTextField="USER_GRP_NM" HeaderText="사용자그룹" HorizontalAlignment="Center" />
			<bf:BoundDataField ID="LOGIN_DATE" DataTextField="LOGIN_DATE" HeaderText="최근 로그인 시간" HorizontalAlignment="Center" Width="200px" />
            <bf:BoundDataField ID="SYSREGDATE" DataTextField="SYSREGDATE" HeaderText="시스템등록일" HorizontalAlignment="Center" Width="140px" />
            <bf:BoundDataField ID="SYSREGNAME" DataTextField="SYSREGNAME" HeaderText="시스템등록자" HorizontalAlignment="Center" Width="140px" />
            <bf:BoundDataField ID="SYSMODDATE" DataTextField="SYSMODDATE" HeaderText="시스템수정일" HorizontalAlignment="Center" Width="140px" />
            <bf:BoundDataField ID="SYSMODNAME" DataTextField="SYSMODNAME" HeaderText="시스템수정자" HorizontalAlignment="Center" Width="140px" />
		</bf:FixedGrid>
	</fieldset>
</asp:Content>
