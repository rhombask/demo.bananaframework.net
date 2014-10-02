<%@ Page Title="휴일관리 화면" Language="C#" MasterPageFile="~/Control/Web.Master" AutoEventWireup="true" CodeBehind="2000.aspx.cs" Inherits="demo.bananaframework.net.View.BAS._2000" %>
<%@ Register Assembly="BANANA.Web.Controls" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
    <fieldset id="search">
		<legend>검색조건</legend>
		<table class="gridSearch">
			<tr>
				<td class="searchLabel">기준연도</td>
				<td class="searchObject"><bf:DropDownList ID="_ddlYYYY" runat="server" /></td>
				<td class="searchButton" style="width: 300px;">
                    <bf:Button ID="_btnSearch" runat="server" Text="검색" OnClick="_btnSearch_Click" />
					<bf:Button ID="_btnNew" runat="server" Text="공휴일 등록" ButtonImage="New" OnClick="_btnNew_Click" />
				</td>
			</tr>
		</table>
	</fieldset>
    <fieldset>
		<legend>검색결과</legend>
		<bf:FixedGrid ID="FixedGrid1" runat="server" AllowPaging="True" Dock="Fill" FixedColumn="1" PageSize="50,100,300,500" OnPageIndexChanged="FixedGrid1_PageIndexChanged" OnPageSizeChanged="FixedGrid1_PageSizeChanged">
		    <bf:TemplateField ID="WKDAY" HeaderText="공휴일자" HorizontalAlignment="Center">
                <ItemTemplate>
                    <bf:HyperLink ID="_hlWKDAY" runat="server" Text='<%# Eval("WKDAY") %>' NavigateUrl='<%# string.Format("/View/BAS/2010.aspx?WKDAY={0}", Eval("WKDAY")) %>' />
                </ItemTemplate>
            </bf:TemplateField>
            <bf:BoundDataField ID="WKMEMO" DataTextField="WKMEMO" HeaderText="메모" />
            <bf:BoundDataField ID="SYSREGDATE" DataTextField="SYSREGDATE" HeaderText="시스템등록일" HorizontalAlignment="Center" Width="140px" />
            <bf:BoundDataField ID="SYSREGNAME" DataTextField="SYSREGNAME" HeaderText="시스템등록자" HorizontalAlignment="Center" Width="140px" />
            <bf:BoundDataField ID="SYSMODDATE" DataTextField="SYSMODDATE" HeaderText="시스템수정일" HorizontalAlignment="Center" Width="140px" />
            <bf:BoundDataField ID="SYSMODNAME" DataTextField="SYSMODNAME" HeaderText="시스템수정자" HorizontalAlignment="Center" Width="140px" />
		</bf:FixedGrid>
	</fieldset>
</asp:Content>
