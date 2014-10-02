<%@ Page Title="휴일관리 상세화면" Language="C#" MasterPageFile="~/Control/Web.Master" AutoEventWireup="true" CodeBehind="2010.aspx.cs" Inherits="demo.bananaframework.net.View.BAS._2010" %>
<%@ Register Assembly="BANANA.Web.Controls" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
    <script type="text/javascript">
        $(document).click(function (event) {
            var target = $(event.target);
            var id = target.attr("id") == null ? "" : target.attr("id");
            var cls = target.attr("class") == null ? "" : target.attr("class");

            if (!(
                (id.indexOf("<%=_dptWKDAY.ClientID%>_Button") >= 0)
                || (cls.indexOf("next") >= 0)
                || (cls.indexOf("prev") >= 0)
                )) {
                $('.bnn-DatePicker').hide();
            }
        });
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
   <fieldset id="basic">
		<legend>기본 정보</legend>
		<table class="infoTable">
			<tr>
				<td class="infoCol" style="width:120px;">공휴일</td>
				<td class="inputCol"><bf:DatePicker ID="_dptWKDAY" runat="server" Compulsory="True" ValidationGroup="Save" /></td>
				<td class="infoCol" style="width:120px;">메모</td>
				<td class="inputCol"><bf:TextBox ID="_txtWKMEMO" runat="server" /></td>
			</tr>
		</table>
		<div id="_dvSYSINFO" runat="server" class="infoSystem" />
		<div class="infoCommand">
			<bf:Button ID="_btnSave" runat="server" Text="저장" ButtonImage="Save" OnClick="_btnSave_Click" ButtonConfirm="True" ValidationGroup="Save" />
			<bf:Button ID="_btnDel" runat="server" Text="삭제" ButtonImage="Delete" ButtonConfirm="True" OnClick="_btnDel_Click" />
			<bf:Button ID="_btnList" runat="server" Text="목록" ButtonImage="List" OnClick="_btnList_Click" />
		</div>
	</fieldset>
</asp:Content>
