<%@ Page Title="지사정보관리" Language="C#" MasterPageFile="~/Control/Web.Master" AutoEventWireup="true" CodeBehind="1000.aspx.cs" Inherits="demo.bananaframework.net.View.CNT._1000" %>

<%@ Register Assembly="BANANA.Web.Controls" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<script type="text/javascript">
		function openPage(code) {
			// 경로 설정
			var url		= "/View/CNT/1010.aspx?CNT_CD=" + code;

			// 인디케이터 원상복귀
			$("#<%=_btnNew.ContainerID%>").HideIndicator();

			// 부모창에 모달 윈도우 뛰우기
			parent.openModalPopup(url, 1100, 700, function (args) {
				alert(args);
			});
        }
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
	<fieldset id="search">
		<legend>검색조건</legend>
		<table class="gridSearch">
			<tr>
				<td class="searchLabel">지사코드</td>
				<td class="searchObject"><bf:TextBox ID="_txtMBR_CD" runat="server" /></td>
				<td class="searchLabel">지사명</td>
				<td class="searchObject"><bf:TextBox ID="_txtMBR_NM" runat="server" /></td>
				<td class="searchLabel">휴대폰번호</td>
				<td class="searchObject"><bf:TextBox ID="_txtCNTR_HPNO" runat="server" /></td>
			</tr>
			<tr>
				<td class="searchLabel">계약자명</td>
				<td class="searchObject"><bf:TextBox ID="_txtCNTR_NM" runat="server" /></td>
				<td class="searchButton" colspan="4">
					<bf:Button ID="_btnSearch" runat="server" Text="검색" />
					<bf:Button ID="_btnNew" runat="server" ButtonImage="New" Text="지사등록" OnClientClick="javascript:openPage('');" />
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset id="result">
		<legend>검색결과</legend>
		<bf:FixedGrid ID="FixedGrid1" runat="server" Dock="Fill" FixedColumn="3" ShowRowNumber="true" AllowPaging="true" OnPageIndexChanged="FixedGrid1_PageIndexChanged" OnPageSizeChanged="FixedGrid1_PageSizeChanged" PageSize="50,100,300,500" OnExcelClicked="FixedGrid1_ExcelClicked" ShowExcel="True">
			<bf:BoundDataField ID="REGDT" DataTextField="REGDT" HeaderText="등록일자" HorizontalAlignment="Center" />
			<bf:TemplateField ID="MBR_CD" HeaderText="지사아이디" HorizontalAlignment="Center">
				<ItemTemplate>
					<bf:HyperLink runat="server" Text='<%# Eval("MBR_CD") %>' />
				</ItemTemplate>
			</bf:TemplateField>
			<bf:BoundDataField ID="MBR_NM" DataTextField="MBR_NM" HeaderText="지사명" HorizontalAlignment="Center" />
			<bf:BoundDataField ID="CNTR_NM" DataTextField="CNTR_NM" HeaderText="계약자명" HorizontalAlignment="Center" />
			<bf:BoundDataField ID="CNTR_HPNO" DataTextField="CNTR_HPNO" HeaderText="계약자휴대폰" HorizontalAlignment="Center" />
			<bf:BoundDataField ID="SAUP_NO" DataTextField="SAUP_NO" HeaderText="사업자등록번호" HorizontalAlignment="Center" />
			<bf:TemplateField HeaderText="대리점수" HorizontalAlignment="Right" Width="60px">
				<ItemTemplate>
					<bf:HyperLink runat="server" Text='<%# Eval("AGNT_CNT") %>' />
				</ItemTemplate>
			</bf:TemplateField>
			<bf:TemplateField HeaderText="가맹점수" HorizontalAlignment="Right" Width="60px">
				<ItemTemplate>
					<bf:HyperLink runat="server" Text='<%# Eval("AFF_CNT") %>' />
				</ItemTemplate>
			</bf:TemplateField>
			<bf:TemplateField HeaderText="기기보유수" HorizontalAlignment="Right" Width="60px">
				<ItemTemplate>
					<bf:HyperLink ID="HyperLink3" runat="server" Text='<%# Eval("DVC_CNT") %>' />
				</ItemTemplate>
			</bf:TemplateField>
			<bf:BoundDataField DataTextField="SYSREGDATE" HeaderText="등록일" HorizontalAlignment="Center" Width="140px" />
			<bf:BoundDataField DataTextField="SYSREGNAME" HeaderText="등록자" HorizontalAlignment="Center" Width="140px" />
			<bf:BoundDataField DataTextField="SYSMODDATE" HeaderText="수정일" HorizontalAlignment="Center" Width="140px" />
			<bf:BoundDataField DataTextField="SYSMODNAME" HeaderText="수정자" HorizontalAlignment="Center" Width="140px" />
		</bf:FixedGrid>
	</fieldset>
</asp:Content>
