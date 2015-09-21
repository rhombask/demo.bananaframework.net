<%@ Page Title="공통코드관리" Language="C#" MasterPageFile="~/Control/Web.Master" AutoEventWireup="true" CodeBehind="1000.aspx.cs" Inherits="demo.bananaframework.net.View.BAS._1000" %>

<%@ Register Assembly="BANANA.Web.Controls.v4.5" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<script type="text/javascript">
		$(document).ready(function () {
			resizeControls();
		});

		//$(window).resize(function () {
		//	resizeControls();
		//});

		function resizeControls() {
			var h_doc		= $(window).height();
			var h_navigator	= $("#navigator").height();
			var h_search	= $("#search").height();
			
			// 각 컨트롤의 크기를 재 조정하는데에 방해가 되지 않도록 그리드는 조금 줄여 놓도록 한다 : S //
			$("#<%=FixedGrid1.ContainerID%>").height(100);
			$("#<%=FixedGrid1.ContainerID%>").width(100);
			// 아래 함수를 호출해 줘야, 페이지 컨트롤이 제 자리를 찾아간다.
			$("#<%=FixedGrid1.ClientID%>").FixedGridSizeChagned();
			
			$("#<%=FixedGrid2.ContainerID%>").height(100);
			$("#<%=FixedGrid2.ContainerID%>").width(100);
			// 아래 함수를 호출해 줘야, 페이지 컨트롤이 제 자리를 찾아간다.
			$("#<%=FixedGrid2.ClientID%>").FixedGridSizeChagned();
			// 각 컨트롤의 크기를 재 조정하는데에 방해가 되지 않도록 그리드는 조금 줄여 놓도록 한다 : E //
			
			// 테이블과 필드셋 크기 재 조정
			var margin1		= 25;
			if ($.browser.chrome)
				margin1 += 20;
			else if ($.browser.firefox)
				margin1 += 20;
			else if ($.browser.msie)
				margin1 += 0;
			else if ($.browser.safari)
				margin1 += 20;
			else if ($.browser.opera)
				margin1 += 0;
			$("#grid").height( h_doc - h_navigator - h_search - margin1 );	// 마진, 패딩 등을 뺌
			$("#grid").find("fieldset").height( $("#grid").height() - 25 );

			// 좌측 그리드 크기 재 조정
			var h_fieldset_01	= $("#fieldset_01").innerHeight() - 20;
			var w_fieldset_01	= $("#fieldset_01").innerWidth();
			$("#<%=FixedGrid1.ContainerID%>").height(h_fieldset_01);
			$("#<%=FixedGrid1.ContainerID%>").width(w_fieldset_01);
			// 아래 함수를 호출해 줘야, 페이지 컨트롤이 제 자리를 찾아간다.
			$("#<%=FixedGrid1.ClientID%>").FixedGridSizeChagned();

			// 우측 그리드 크기 재 조정
			var h_fieldset_02	= $("#fieldset_02").innerHeight() - 20;
			var w_fieldset_02	= $("#fieldset_02").innerWidth();
			$("#<%=FixedGrid2.ContainerID%>").height(h_fieldset_02);
			$("#<%=FixedGrid2.ContainerID%>").width(w_fieldset_02 - 20);
			// 아래 함수를 호출해 줘야, 페이지 컨트롤이 제 자리를 찾아간다.
			$("#<%=FixedGrid2.ClientID%>").FixedGridSizeChagned();
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
	<fieldset id="search">
		<legend>검색조건</legend>
		<table class="gridSearch">
			<tr>
				<td class="searchLabel">메인코드명</td>
				<td class="searchObject"><bf:TextBox ID="_txtCODE_NAME1" runat="server" /></td>
				<td class="searchLabel">공통코드명</td>
				<td class="searchObject"><bf:TextBox ID="_txtCODE_NAME2" runat="server" /></td>
				<td class="searchButton" style="width: 300px;"><bf:Button ID="_btnSearch" runat="server" Text="검색" OnClick="_btnSearch_Click" />
					<bf:Button ID="_btnNew1" runat="server" Text="신규(메인코드)" ButtonImage="New" OnClick="_btnNew1_Click" />
					<bf:Button ID="_btnNew2" runat="server" Text="신규(공통코드)" ButtonImage="New" OnClick="_btnNew2_Click" Enabled="false" />
				</td>
			</tr>
		</table>
	</fieldset>
	<table id="grid" style="width:100%;">
		<tr>
			<td style="width:330px;vertical-align:top;position:relative;">
				<fieldset id="fieldset_01">
					<legend>메인코드</legend>
					<bf:FixedGrid ID="FixedGrid1" runat="server" AllowPaging="True" FixedColumn="1" PageSize="50,100,300,500" OnPageIndexChanged="FixedGrid1_PageIndexChanged" OnPageSizeChanged="FixedGrid1_PageSizeChanged" OnItemCommand="FixedGrid1_ItemCommand">
						<bf:TemplateField HeaderText="메인코드" HorizontalAlignment="Center" Width="70px">
							<ItemTemplate>
								<asp:HyperLink ID="Label1" runat="server" Text='<%# Eval("MAIN_CODE") %>' NavigateUrl='<%# string.Format("/View/BAS/1010.aspx?MAIN_CODE={0}", Eval("MAIN_CODE")) %>'></asp:HyperLink>
							</ItemTemplate>
						</bf:TemplateField>
						<bf:TemplateField HeaderText="코드명" Width="200px">
							<ItemTemplate>
								<asp:LinkButton ID="LinkButton5" runat="server" Text='<%# Eval("CODE_NAME") %>' CommandArgument='<%# Eval("MAIN_CODE") %>' />
							</ItemTemplate>
						</bf:TemplateField>
					</bf:FixedGrid>
				</fieldset>
			</td>
			<td style="vertical-align:top;position:relative;">
				<fieldset id="fieldset_02">
					<legend>공통코드</legend>
					<bf:FixedGrid ID="FixedGrid2" runat="server" AllowPaging="True" FixedColumn="1" PageSize="50,100,300,500" OnPageIndexChanged="FixedGrid1_PageIndexChanged" OnPageSizeChanged="FixedGrid1_PageSizeChanged">
						<bf:TemplateField HeaderText="공통코드" HorizontalAlignment="Center" Width="80px">
							<ItemTemplate>
								<asp:HyperLink ID="Label1" runat="server" Text='<%# Eval("TOTAL_CODE") %>' NavigateUrl='<%# string.Format("/View/BAS/1020.aspx?TOTAL_CODE={0}", Eval("TOTAL_CODE")) %>'></asp:HyperLink>
							</ItemTemplate>
						</bf:TemplateField>
						<bf:TemplateField HeaderText="코드명" Width="150px">
							<ItemTemplate>
								<asp:Label ID="Label1" runat="server" Text='<%# Eval("CODE_NAME") %>' ToolTip='<%# Eval("CODE_NAME") %>'></asp:Label>
							</ItemTemplate>
						</bf:TemplateField>
						<bf:BoundDataField DataTextField="SYSTEMYN" HeaderText="시스템" HorizontalAlignment="Center" Width="50px" />
						<bf:BoundDataField DataTextField="DISPLAYYN" HeaderText="사용여부" HorizontalAlignment="Center" Width="60px" />
						<bf:BoundDataField DataTextField="ORDERBY" HeaderText="순서" HorizontalAlignment="Right" Width="50px" />
						<bf:BoundDataField DataTextField="BIGO1" HeaderText="비고1" />
						<bf:BoundDataField DataTextField="BIGO2" HeaderText="비고2" />
						<bf:BoundDataField DataTextField="BIGO3" HeaderText="비고3" />
						<bf:BoundDataField DataTextField="BIGO4" HeaderText="비고4" />
						<bf:BoundDataField DataTextField="BIGO5" HeaderText="비고5" />
						<bf:BoundDataField DataTextField="BIGO6" HeaderText="비고6" />
						<%--<bf:BoundDataField DataTextField="SYSREGDATE" HeaderText="시스템등록일" HorizontalAlignment="Center" Width="140px" />
						<bf:BoundDataField DataTextField="SYSREGNAME" HeaderText="시스템등록자" HorizontalAlignment="Center" Width="140px" />
						<bf:BoundDataField DataTextField="SYSMODDATE" HeaderText="시스템수정일" HorizontalAlignment="Center" Width="140px" />
						<bf:BoundDataField DataTextField="SYSMODNAME" HeaderText="시스템수정자" HorizontalAlignment="Center" Width="140px" />--%>
					</bf:FixedGrid>
				</fieldset>
			</td>
		</tr>
	</table>
</asp:Content>
