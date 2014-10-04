<%@ Page Title="회원정보 등록/수정" Language="C#" MasterPageFile="~/Control/Popup.Master" AutoEventWireup="true" CodeBehind="1010.aspx.cs" Inherits="demo.bananaframework.net.View.MBR._1010" %>

<%@ Register Assembly="BANANA.Web.Controls" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
	<fieldset>
		<legend>회원 기본정보</legend>
		<table class="infoTable">
			<tr>
				<td class="infoCol" style="width: 120px;">회원코드</td>
				<td class="inputCol" style="width: 200px;"><bf:TextBox ID="_txtCNT_CD" runat="server" Width="90px" /><bf:CheckBox ID="_chkAuto" runat="server" Text="자동채번" /></td>
				<td class="infoCol" style="width: 120px;">회원명</td>
				<td class="inputCol" style="width: 200px;"><bf:TextBox ID="_txtCNT_NM" runat="server" Compulsory="True" ValidationGroup="Save" /></td>
				<td class="infoCol" style="width: 120px;">등록일자</td>
				<td class="inputCol"><bf:DatePicker ID="_dpREGDT" runat="server" Compulsory="True" ValidationGroup="Save" /></td>
			</tr>
			<tr>
				<td class="infoCol">로그인아이디</td>
				<td class="inputCol"><bf:TextBox ID="_txtCNT_ID" runat="server" /></td>
				<td class="infoCol"><bf:Label ID="Label7" runat="server" Text="비밀번호" ShowHelp="True" HelpMessage="3-DES 암호화 되어서 저장됩니다." /></td>
				<td class="inputCol"><bf:TextBox ID="_txtPWD" runat="server" /></td>
				<td class="infoCol">해제일자</td>
				<td class="inputCol"><bf:DatePicker ID="_dpCNCDT" runat="server" /></td>
			</tr>
			<tr>
				<td class="infoCol">소속지사</td>
				<td class="inputCol"><bf:CodeHelper ID="_chBARNCH_CD" runat="server" CodeHelperType="Branch" Compulsory="True" ValidationGroup="Save" /></td>
				<td class="infoCol">소속대리점</td>
				<td class="inputCol"><bf:CodeHelper ID="_chAGENT_CD" runat="server" CodeHelperType="Agency" /></td>
				<td class="infoCol">직급</td>
				<td class="inputCol"><bf:DropDownList ID="_ddlJIKUP_CD" runat="server" /></td>
			</tr>
			<tr>
				<td class="infoCol">추천인</td>
				<td class="inputCol"><bf:CodeHelper ID="_chREC_CD" runat="server" CodeHelperType="RECID" Compulsory="True" ValidationGroup="Save" /></td>
				<td class="infoCol">후원인</td>
				<td class="inputCol"><bf:CodeHelper ID="_chSUP_CD" runat="server" CodeHelperType="SUPID" /></td>
				<td class="infoCol"><bf:Label ID="Label1" runat="server" Text="주민등록번호" ShowHelp="True" HelpMessage="3-DES 암호화 되어서 저장됩니다." /></td>
				<td class="inputCol"><bf:TextBox ID="TextBox3" runat="server" ImeMode="DashNumeric" MaxLength="14" /></td>
			</tr>
			<tr>
				<td class="infoCol">생년월일</td>
				<td class="inputCol"><bf:DatePicker ID="DatePicker1" runat="server" /></td>
				<td class="infoCol"><bf:Label ID="Label2" runat="server" Text="휴대폰" ShowHelp="True" HelpMessage="3-DES 암호화 되어서 저장됩니다." /></td>
				<td class="inputCol"><bf:TextBox ID="TextBox8" runat="server" ImeMode="DashNumeric" /></td>
				<td class="infoCol"><bf:Label ID="Label3" runat="server" Text="이메일" ShowHelp="True" HelpMessage="3-DES 암호화 되어서 저장됩니다." /></td>
				<td class="inputCol"><bf:TextBox ID="TextBox9" runat="server" /></td>
			</tr>
			<tr>
				<td class="infoCol"><bf:Label ID="Label4" runat="server" Text="주소" ShowHelp="True" HelpMessage="3-DES 암호화 되어서 저장됩니다." /></td>
				<td class="inputCol" colspan="5"><bf:TextBox ID="TextBox10" runat="server" Width="816px" /></td>
			</tr>
			<tr>
				<td class="infoCol">거래은행</td>
				<td class="inputCol"><bf:DropDownList ID="_ddlBK_CD" runat="server" /></td>
				<td class="infoCol"><bf:Label ID="Label5" runat="server" Text="계좌번호" ShowHelp="True" HelpMessage="3-DES 암호화 되어서 저장됩니다." /></td>
				<td class="inputCol"><bf:TextBox ID="_txtBK_ACCT_NO" runat="server" ImeMode="DashNumeric" /></td>
				<td class="infoCol"><bf:Label ID="Label6" runat="server" Text="예금주" ShowHelp="True" HelpMessage="3-DES 암호화 되어서 저장됩니다." /></td>
				<td class="inputCol"><bf:TextBox ID="_txtBK_OWNER" runat="server" /></td>
			</tr>
			<tr>
				<td class="infoCol">메모</td>
				<td class="inputCol" colspan="5"><bf:TextBox ID="_txtMEMO" runat="server" Width="816px" TextMode="MultiLine" Rows="5" /></td>
			</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend>명령수행</legend>
		<div id="_dvSYSINFO" runat="server" class="infoSystem" />
		<div class="infoCommand">
			<bf:Button ID="_btnSave" runat="server" Text="저장" ButtonImage="Save" ButtonConfirm="True" ValidationGroup="Save" />
			<!--
			parent.closeModalPopup() 함수에 필요한 변수(들)를 던지면, 창이 닫혔다는 이벤트와 함께 목록 페이지에서 해당 변수들을 받을 수 있습니다.
			-->
			<bf:Button ID="_btnList" runat="server" Text="닫기" ButtonImage="Cancel" OnClientClick="javascript:parent.closeModalPopup();" />
		</div>
	</fieldset>
</asp:Content>
