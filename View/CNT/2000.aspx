<%@ Page Title="대리점정보관리" Language="C#" MasterPageFile="~/Control/Web.Master" AutoEventWireup="true" CodeBehind="2000.aspx.cs" Inherits="demo.bananaframework.net.View.CNT._2000" %>

<%@ Register Assembly="BANANA.Web.Controls" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<script type="text/javascript">
		function openPage(code) {
			// 경로 설정
			var url		= "/View/CNT/2010.aspx?CNT_CD=" + code;

			// 인디케이터 원상복귀
			$("#<%=_btnNew.ContainerID%>").HideIndicator();

			// 부모창에 모달 윈도우 뛰우기
			parent.openModalPopup(url, 1100, 700, function (args) {
				alert("대리점정보관리 닫혔음");
			});
        }
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
	개발중입니다.
	<bf:Button ID="_btnNew" runat="server" ButtonImage="New" Text="지사등록" OnClientClick="javascript:openPage('');" />
</asp:Content>
