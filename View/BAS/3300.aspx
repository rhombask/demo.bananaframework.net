<%@ Page Title="" Language="C#" MasterPageFile="~/Control/Web.Master" AutoEventWireup="true" CodeBehind="3300.aspx.cs" Inherits="demo.bananaframework.net.View.BAS._3300" %>
<%@ Register Assembly="BANANA.Web.Controls" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var _winWidth = $(window).width();
            $("#<%=FixedGrid2.ContainerID %>").width(_winWidth - 300);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
    <asp:HiddenField ID="_hdCODE" runat="server" />
    <fieldset id="search">
		<legend>검색조건</legend>
		<table class="gridSearch">
			<tr>
				<td class="searchLabel">그룹명</td>
				<td class="searchObject"><bf:TextBox ID="_txtGRP_NM" runat="server" /></td>
				<td class="searchButton">
                    <bf:Button ID="_btnSearch" runat="server" Text="검색" Enabled="false" OnClick="_btnSearch_Click" />
					<bf:Button ID="_btnSave" runat="server" Text="저장" ButtonImage="Save" Enabled="false" ButtonConfirm="true" OnClick="_btnSave_Click" />
				</td>
			</tr>
		</table>
	</fieldset>
	<table id="grid" style="width:100%;">
		<tr>
			<td style="width:330px;vertical-align:top;position:relative;">
				<fieldset>
					<legend>메인코드</legend>
					<bf:FixedGrid ID="FixedGrid1" runat="server" AllowPaging="True" Dock="Fill" FixedColumn="1" PageSize="50,100,300,500" OnPageIndexChanged="FixedGrid1_PageIndexChanged" OnPageSizeChanged="FixedGrid1_PageSizeChanged" OnItemCommand="FixedGrid1_ItemCommand">
						<bf:BoundDataField DataTextField="TOTAL_CODE" HeaderText="그룹코드" HorizontalAlignment="Center" Width="70px" />
						<bf:TemplateField HeaderText="그룹명" Width="150px">
							<ItemTemplate>
								<asp:LinkButton ID="LinkButton5" runat="server" Text='<%# Eval("CODE_NAME") %>' CommandArgument='<%# Eval("TOTAL_CODE") %>' />
							</ItemTemplate>
						</bf:TemplateField>
					</bf:FixedGrid>
				</fieldset>
			</td>
			<td style="vertical-align:top;position:relative;">
				<fieldset>
					<legend>공통코드</legend>
					<bf:FixedGrid ID="FixedGrid2" runat="server" Dock="Fill" ShowRowNumber="true" FixedColumn="2">
						<bf:BoundDataField DataTextField="PRG_ID" HeaderText="프로그램ID" HorizontalAlignment="Center" Width="80px" />
						<bf:TemplateField HeaderText="프로그램명" Width="350px">
							<ItemTemplate>
								<asp:Label runat="server" Text='<%# Eval("NAME") %>' ToolTip='<%# Eval("NAME") %>' />
							</ItemTemplate>
						</bf:TemplateField>
		            </bf:FixedGrid>
				</fieldset>
			</td>
		</tr>
	</table>
</asp:Content>
