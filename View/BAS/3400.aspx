<%@ Page Title="" Language="C#" MasterPageFile="~/Control/Web.Master" AutoEventWireup="true" CodeBehind="3400.aspx.cs" Inherits="demo.bananaframework.net.View.BAS._3400" %>

<%@ Register Assembly="BANANA.Web.Controls" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
	<fieldset id="search">
		<legend>검색조건</legend>
		<table class="gridSearch">
			<tr>
				<td class="searchLabel"><bf:Label ID="Label3" runat="server" Text="대메뉴" /></td>
				<td class="searchObject"><bf:DropDownList ID="_ddlBIGMENU" runat="server" /></td>
				<td class="searchLabel"><bf:Label ID="Label1" runat="server" Text="프로그램 ID" /></td>
				<td class="searchObject"><bf:TextBox ID="_txtID" runat="server" /></td>
				<td class="searchLabel"><bf:Label ID="Label2" runat="server" Text="프로그램명" /></td>
				<td class="searchObject"><bf:TextBox ID="_txtNAME" runat="server" /></td>
				<td class="searchButton" style="width: 150px;">
					<bf:Button ID="_btnSearch" runat="server" Text="검색" OnClick="_btnSearch_Click" />
					<bf:Button ID="_btnNew" runat="server" ButtonImage="New" Text="신규 등록" OnClick="_btnNew_Click" />
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset id="result">
		<legend>검색결과</legend>
		<bf:FixedGrid ID="FixedGrid1" runat="server" Dock="Fill" ShowRowNumber="true" FixedColumn="1" AllowPaging="true" OnPageIndexChanged="FixedGrid1_PageIndexChanged" OnPageSizeChanged="FixedGrid1_PageSizeChanged" PageSize="50,100,300,500">
			<bf:TemplateField ID="ID" HeaderText="프로그램ID" HorizontalAlignment="Center" Width="80px">
				<ItemTemplate>
					<bf:HyperLink ID="_hlID" runat="server" Text='<%# Eval("ID") %>' NavigateUrl='<%# string.Format("/View/BAS/3410.aspx?ID={0}", Eval("ID")) %>' />
				</ItemTemplate>
			</bf:TemplateField>
			<bf:TemplateField ID="NAME" HeaderText="프로그램명" Width="350px">
				<ItemTemplate>
					<bf:Label ID="_hlID" runat="server" Text='<%# Eval("NAME") %>' ToolTip='<%# Eval("NAME") %>' />
				</ItemTemplate>
			</bf:TemplateField>
			<bf:BoundDataField ID="USE_YN" DataTextField="USE_YN" HeaderText="사용 여부" HorizontalAlignment="Center" />
			<bf:BoundDataField ID="ORDNO" DataTextField="ORDNO" HeaderText="순번" HorizontalAlignment="Right" Width="60px" />
			<bf:BoundDataField ID="URL" DataTextField="URL" HeaderText="프로그램 경로" Width="200px" />
			<bf:BoundDataField ID="PID" DataTextField="PID" HeaderText="부모 프로그램ID" HorizontalAlignment="Center" />
			<bf:TemplateField ID="CHILD_ID" HeaderText="자식 프로그램 경로" Width="500px">
				<ItemTemplate>
					<bf:Label ID="_hlID" runat="server" Text='<%# Eval("CHILD_ID") %>' ToolTip='<%# Eval("CHILD_ID") %>' />
				</ItemTemplate>
			</bf:TemplateField>
		</bf:FixedGrid>
	</fieldset>
</asp:Content>
