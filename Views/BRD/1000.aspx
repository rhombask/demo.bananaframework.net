<%@ Page Title="게시판 목록" Language="C#" MasterPageFile="~/Controllers/Web.Master" AutoEventWireup="true" CodeBehind="1000.aspx.cs" Inherits="demo.bananaframework.net.Views.BRD._1000" %>

<%@ Register Assembly="BANANA.Web.Controls.v4.5" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<script type="text/javascript">
		function openPage(idx) {
			// 경로 설정
			var url		= "/Views/BRD/1010.aspx?db=free&idx=" + idx;

			// 인디케이터 원상복귀
			$("#<%=_btnNew.ContainerID%>").HideIndicator();

			// 부모창에 모달 윈도우 뛰우기
			parent.openModalPopup(url, 1000, 550, function (args) {
				//alert(args);
			});
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
	<fieldset id="search">
		<legend>검색조건</legend>
		<table class="gridSearch">
			<tr>
				<td class="searchLabel">제목</td>
				<td class="searchObject"><bf:TextBox ID="_txtCNT_CD" runat="server" /></td>
				<td class="searchButton" rowspan="2" style="width:130px;">
					<bf:Button ID="_btnSearch" runat="server" Text="검색" OnClick="_btnSearch_Click" />
					<bf:Button ID="_btnNew" runat="server" ButtonImage="New" Text="신규등록" OnClientClick="javascript:openPage('');" />
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset id="result">
		<legend>검색결과</legend>
		<bf:FixedGrid ID="FixedGrid1" runat="server" Dock="Fill" FixedColumn="3" ShowRowNumber="true" AllowPaging="true" OnPageIndexChanged="FixedGrid1_PageIndexChanged" OnPageSizeChanged="FixedGrid1_PageSizeChanged" PageSize="50,100,300,500" ShowExcel="True">
			<bf:TemplateField HeaderText="제목" HorizontalAlignment="Center" Width="80px">
				<ItemTemplate>
					<bf:HyperLink runat="server" Text='<%# Eval("SUBJECT") %>' NavigateUrl='<%# string.Format("javascript:openPage(&#39;{0}&#39;);", Eval("IDX")) %>' />
				</ItemTemplate>
			</bf:TemplateField>
			<bf:BoundDataField DataTextField="WRITER_NAME" HeaderText="작성자" />
			<bf:BoundDataField DataTextField="SYSREGDATE" HeaderText="작성일" />
		</bf:FixedGrid>
	</fieldset>
</asp:Content>
