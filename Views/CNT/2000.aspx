<%@ Page Title="대리점정보관리" Language="C#" MasterPageFile="~/Controllers/Web.Master" AutoEventWireup="true" CodeBehind="2000.aspx.cs" Inherits="demo.bananaframework.net.Views.CNT._2000" %>

<%@ Register Assembly="BANANA.Web.Controls.v4.5" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<script type="text/javascript">
		function openPage(code) {
			// 경로 설정
			var url		= "/Views/CNT/2010.aspx?CNT_CD=" + code;

			// 인디케이터 원상복귀
			$("#<%=_btnNew.ContainerID%>").HideIndicator();

			// 부모창에 모달 윈도우 뛰우기
			parent.openModalPopup(url, 1000, 600, function (args) {
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
				<td class="searchLabel">대리점코드</td>
				<td class="searchObject"><bf:TextBox ID="_txtCNT_CD" runat="server" /></td>
				<td class="searchLabel">대리점명</td>
				<td class="searchObject"><bf:TextBox ID="_txtCNT_NM" runat="server" /></td>
				<td class="searchLabel">사업자등록번호</td>
				<td class="searchObject"><bf:TextBox ID="_txtSAUP_NO" runat="server" /></td>
				<td class="searchButton" rowspan="2" style="width:140px;">
					<bf:Button ID="_btnSearch" runat="server" Text="검색" OnClick="_btnSearch_Click" />
					<bf:Button ID="_btnNew" runat="server" ButtonImage="New" Text="대리점등록" OnClientClick="javascript:openPage('');" />
				</td>
			</tr>
			<tr>
				<td class="searchLabel">대표자명</td>
				<td class="searchObject"><bf:TextBox ID="_txtPRSDNT_NM" runat="server" /></td>
				<td class="searchLabel">대표자휴대폰</td>
				<td class="searchObject"><bf:TextBox ID="_txtPRSDNT_HPNO" runat="server" /></td>
				<td class="searchLabel">등록일자</td>
				<td class="searchObject"><bf:DatePicker ID="_dpSTRT" runat="server" /> ~ <bf:DatePicker ID="_dpEND" runat="server" /></td>
			</tr>
		</table>
	</fieldset>
	<fieldset id="result">
		<legend>검색결과</legend>
		<bf:FixedGrid ID="FixedGrid1" runat="server" Dock="Fill" FixedColumn="3" ShowRowNumber="true" AllowPaging="true" OnPageIndexChanged="FixedGrid1_PageIndexChanged" OnPageSizeChanged="FixedGrid1_PageSizeChanged" PageSize="50,100,300,500" OnExcelClicked="FixedGrid1_ExcelClicked" ShowExcel="True">
			<bf:TemplateField HeaderText="대리점코드" HorizontalAlignment="Center" Width="80px">
				<ItemTemplate>
					<bf:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("CNT_CD") %>' NavigateUrl='<%# string.Format("javascript:openPage(&#39;{0}&#39;);", Eval("CNT_CD")) %>' />
				</ItemTemplate>
			</bf:TemplateField>
			<bf:BoundDataField DataTextField="CNT_NM" HeaderText="대리점명" />
			<bf:TemplateField HeaderText="소속지사" Width="160px">
				<ItemTemplate>
					<bf:Label runat="server" Text='<%# Eval("BRANCH") %>' ToolTip='<%# Eval("BRANCH") %>' />
				</ItemTemplate>
			</bf:TemplateField>
			<bf:BoundDataField DataTextField="REGDT" HeaderText="등록일자" HorizontalAlignment="Center" Width="70px" />
			<bf:BoundDataField DataTextField="CNCDT" HeaderText="해제일자" HorizontalAlignment="Center" Width="70px" />
			<bf:BoundDataField DataTextField="CNT_ID" HeaderText="로그인아이디" />
			<bf:BoundDataField DataTextField="PRSDNT_NM" HeaderText="대표자명" HorizontalAlignment="Center" Width="60px" />
			<bf:BoundDataField DataTextField="PRSDNT_HPNO" HeaderText="대표자휴대폰" HorizontalAlignment="Center" Width="90px" />
			<bf:BoundDataField DataTextField="SAUP_NO" HeaderText="사업자등록번호" HorizontalAlignment="Center" Width="100px" />
			<bf:BoundDataField DataTextField="BK_NM" HeaderText="은행명" />
			<bf:BoundDataField DataTextField="BK_ACCT_NO" HeaderText="계좌번호" />
			<bf:BoundDataField DataTextField="BK_OWNER" HeaderText="예금주" />
			<bf:BoundDataField DataTextField="SYSREGDATE" HeaderText="시스템등록일" HorizontalAlignment="Center" Width="150px" />
			<bf:BoundDataField DataTextField="SYSREGNAME" HeaderText="시스템등록자" HorizontalAlignment="Center" Width="130px" />
			<bf:BoundDataField DataTextField="SYSMODDATE" HeaderText="시스템수정일" HorizontalAlignment="Center" Width="150px" />
			<bf:BoundDataField DataTextField="SYSMODNAME" HeaderText="시스템수정자" HorizontalAlignment="Center" Width="130px" />
		</bf:FixedGrid>
	</fieldset>
</asp:Content>
