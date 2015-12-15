<%@ Page Title="회원정보관리" Language="C#" MasterPageFile="~/Controllers/Web.Master" AutoEventWireup="true" CodeBehind="1000.aspx.cs" Inherits="demo.bananaframework.net.Views.MBR._1000" %>

<%@ Register Assembly="BANANA.Web.Controls.v4.5" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<script type="text/javascript">
		function openPage(code) {
			// 경로 설정
			var url = "/Views/MBR/1010.aspx?MBR_CD=" + code;

			// 인디케이터 원상복귀
			$("#<%=_btnNew.ContainerID%>").HideIndicator();

			// 부모창에 모달 윈도우 뛰우기
			parent.openModalPopup(url, 1000, 430, function (args) {
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
				<td class="searchLabel">회원코드</td>
				<td class="searchObject">
					<bf:TextBox ID="_txtMBR_CD" runat="server" /></td>
				<td class="searchLabel">회원명</td>
				<td class="searchObject">
					<bf:TextBox ID="_txtMBR_NM" runat="server" /></td>
				<td class="searchLabel">소속지사</td>
				<td class="searchObject">
					<bf:CodeHelper ID="_chBRANCH_CD" runat="server" CodeHelperType="Branch" />
				</td>
				<td class="searchButton" rowspan="2" style="width: 130px;">
					<bf:Button ID="_btnSearch" runat="server" Text="검색" OnClick="_btnSearch_Click" />
					<bf:Button ID="_btnNew" runat="server" ButtonImage="New" Text="회원등록" OnClientClick="javascript:openPage('');" />
				</td>
			</tr>
			<tr>
				<td class="searchLabel">추천회원</td>
				<td class="searchObject">
					<bf:CodeHelper ID="_chREC_CD" runat="server" CodeHelperType="RECID" />
				</td>
				<td class="searchLabel">후원회원</td>
				<td class="searchObject">
					<bf:CodeHelper ID="_chSUP_CD" runat="server" CodeHelperType="SUPID" />
				</td>
				<td class="searchLabel">등록일자</td>
				<td class="searchObject">
					<bf:DatePicker ID="_dpSTRT" runat="server" />
					~
					<bf:DatePicker ID="_dpEND" runat="server" />
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset id="result">
		<legend>검색결과</legend>
		<bf:FixedGrid ID="FixedGrid1" runat="server" Dock="Fill" FixedColumn="3" ShowRowNumber="true" AllowPaging="true" OnPageIndexChanged="FixedGrid1_PageIndexChanged" OnPageSizeChanged="FixedGrid1_PageSizeChanged" PageSize="50,100,300,500" OnExcelClicked="FixedGrid1_ExcelClicked" ShowExcel="True">
			<bf:TemplateField HeaderText="회원코드" HorizontalAlignment="Center" Width="80px">
				<ItemTemplate>
					<bf:HyperLink runat="server" Text='<%# Eval("MBR_CD") %>' NavigateUrl='<%# string.Format("javascript:openPage(&#39;{0}&#39;);", Eval("MBR_CD")) %>' />
				</ItemTemplate>
			</bf:TemplateField>
			<bf:BoundDataField DataTextField="MBR_NM" HeaderText="회원명" />
			<bf:BoundDataField DataTextField="MBR_ID" HeaderText="로그인아이디" />
			<bf:BoundDataField DataTextField="REC_NM" HeaderText="추천회원" />
			<bf:BoundDataField DataTextField="SUP_NM" HeaderText="후원회원" />
			<bf:BoundDataField DataTextField="BRANCH_NM" HeaderText="소속지사" />
			<bf:BoundDataField DataTextField="AGENT_NM" HeaderText="소속대리점" />
			<bf:BoundDataField DataTextField="REGDT" HeaderText="등록일자" HorizontalAlignment="Center" Width="70px" />
			<bf:BoundDataField DataTextField="MBR_BIRTH_DT" HeaderText="생년월일" HorizontalAlignment="Center" Width="70px" />
			<bf:BoundDataField DataTextField="MBR_HPNO" HeaderText="휴대폰" />
			<bf:BoundDataField DataTextField="JIKUP_NM" HeaderText="직급" />
			<bf:BoundDataField DataTextField="SYSREGDATE" HeaderText="시스템등록일" HorizontalAlignment="Center" Width="150px" />
			<bf:BoundDataField DataTextField="SYSREGNAME" HeaderText="시스템등록자" HorizontalAlignment="Center" Width="130px" />
			<bf:BoundDataField DataTextField="SYSMODDATE" HeaderText="시스템수정일" HorizontalAlignment="Center" Width="150px" />
			<bf:BoundDataField DataTextField="SYSMODNAME" HeaderText="시스템수정자" HorizontalAlignment="Center" Width="130px" />
		</bf:FixedGrid>
	</fieldset>
</asp:Content>
