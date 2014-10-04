<%@ Page Title="지사정보 등록/수정" Language="C#" MasterPageFile="~/Control/Popup.Master" AutoEventWireup="true" CodeBehind="1010.aspx.cs" Inherits="demo.bananaframework.net.View.CNT._1010" %>

<%@ Register Assembly="BANANA.Web.Controls" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<script type="text/javascript">
        // 체크박스 및 라디오 버튼 리스트 값 변경 이벤트
        $(document).ready(function () {
            $("#<%=_chkNew.ClientID%>").change(function () {
                if (this.checked) {
                    $("#<%=_chSAUP_NO.ContainerID%>").hide();
				    $("#<%=_txtSAUP_NO.ClientID%>").show();
				}
				else {
				    $("#<%=_chSAUP_NO.ContainerID%>").show();
				    $("#<%=_txtSAUP_NO.ClientID%>").hide();
				}
            });

			// 로그인아이디 onblur시, ajax로 중복 체크 처리
			$("#<%=_txtCNT_ID.ClientID%>").blur(function () {
				var $login_id	= $(this);

				// serializedData
				var serializedData	= "UserID=" + encodeURIComponent($($login_id).val());
				serializedData		+= "&UserCode=" + encodeURIComponent($("#<%=_txtCNT_CD.ClientID%>").val());

				var request = $.ajax({
					url: "/Control/CheckDuplicatedLoginID.ashx?" + serializedData,
					type: "get"
				});

				request.done(function (response, textStatus, jqXHR) {
					// 실패
					if (response[0].GUBUN != "OK") {
						$($login_id).val("");
						$.NotificationBar.Show(response[0].Message, NotificationType.Error, 3000);
					}
				});

				request.fail(function (jqXHR, textStatus, errorThrown) {
					$.NotificationBar.Show("[" + textStatus + "] " + errorThrown, NotificationType.Error, 3000);
				});

				request.always(function () {
				});
			});

			$("#<%=_txtCNT_CD.ClientID%>").focus();
        });

		// 사업자등록번호 찾기 이벤트
		function update_saupNo(e, json_object) {
		    $("#<%=_txtCOMPANY_NM.ClientID%>").val(json_object.COMPANY_NM);
		    $("#<%=_txtBUBIN_NO.ClientID%>").val(json_object.COMPANY_NM);
		    $("#<%=_txtPRSDNT_NM2.ClientID%>").val(json_object.PRSDNT_NM);
		    $("#<%=_txtUPTE.ClientID%>").val(json_object.UPTE);
		    $("#<%=_txtUPJONG.ClientID%>").val(json_object.UPJONG);
		    $("#<%=_txtTELNO.ClientID%>").val(json_object.TELNO);
		    $("#<%=_txtFAXNO.ClientID%>").val(json_object.FAXNO);
		    $("#<%=_txtEMAIL.ClientID%>").val(json_object.EMAIL);
		    $("#<%=_ddlCOMPANY_TYPE_CD.ClientID%>").val(json_object.COMPANY_TYPE);
		    $("#<%=_txtADDR.ClientID%>").val(json_object.ADDR);
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
	<fieldset>
		<legend>지사 기본정보</legend>
		<table class="infoTable">
			<tr>
				<td class="infoCol" style="width: 120px;">지사코드</td>
				<td class="inputCol" style="width: 200px;"><bf:TextBox ID="_txtCNT_CD" runat="server" Compulsory="True" ValidationGroup="Save" /></td>
				<td class="infoCol" style="width: 120px;">지사명</td>
				<td class="inputCol" style="width: 200px;"><bf:TextBox ID="_txtCNT_NM" runat="server" Compulsory="True" ValidationGroup="Save" /></td>
				<td class="infoCol" style="width: 120px;">등록일자</td>
				<td class="inputCol"><bf:DatePicker ID="_dpREGDT" runat="server" Compulsory="True" ValidationGroup="Save" /></td>
			</tr>
			<tr>
				<td class="infoCol">로그인아이디</td>
				<td class="inputCol"><bf:TextBox ID="_txtCNT_ID" runat="server" Compulsory="True" ValidationGroup="Save" /></td>
				<td class="infoCol"><bf:Label ID="Label7" runat="server" Text="비밀번호" ShowHelp="True" HelpMessage="3-DES 암호화 되어서 저장됩니다." /></td>
				<td class="inputCol"><bf:TextBox ID="_txtPWD" runat="server" Compulsory="True" ValidationGroup="Save" /></td>
				<td class="infoCol">해제일자</td>
				<td class="inputCol"><bf:DatePicker ID="_dpCNCDT" runat="server" /></td>
			</tr>
			<tr>
				<td class="infoCol">대표자명</td>
				<td class="inputCol"><bf:TextBox ID="_txtPRSDNT_NM1" runat="server" Compulsory="True" ValidationGroup="Save" /></td>
				<td class="infoCol"><bf:Label ID="Label1" runat="server" Text="대표자주민번호" ShowHelp="True" HelpMessage="3-DES 암호화 되어서 저장됩니다." /></td>
				<td class="inputCol"><bf:TextBox ID="_txtPRSDNT_JUMIN_NO" runat="server" /></td>
				<td class="infoCol"><bf:Label ID="Label2" runat="server" Text="대표자휴대폰" ShowHelp="True" HelpMessage="3-DES 암호화 되어서 저장됩니다." /></td>
				<td class="inputCol"><bf:TextBox ID="_txtPRSDNT_HPNO" runat="server" /></td>
			</tr>
			<tr>
				<td class="infoCol"><bf:Label ID="Label3" runat="server" Text="대표자이메일" ShowHelp="True" HelpMessage="3-DES 암호화 되어서 저장됩니다." /></td>
				<td class="inputCol"><bf:TextBox ID="_txtPRSDNT_EMAIL" runat="server" /></td>
				<td class="infoCol"><bf:Label ID="Label4" runat="server" Text="대표자주소" ShowHelp="True" HelpMessage="3-DES 암호화 되어서 저장됩니다." /></td>
				<td class="inputCol" colspan="3"><bf:TextBox ID="_txtPRSDNT_ADDR" runat="server" Width="488px" /></td>
			</tr>
			<tr>
				<td class="infoCol">거래은행</td>
				<td class="inputCol"><bf:DropDownList ID="_ddlBK_CD" runat="server" /></td>
				<td class="infoCol"><bf:Label ID="Label5" runat="server" Text="계좌번호" ShowHelp="True" HelpMessage="3-DES 암호화 되어서 저장됩니다." /></td>
				<td class="inputCol"><bf:TextBox ID="_txtBK_ACCT_NO" runat="server" /></td>
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
		<legend>사업자등록정보</legend>
		<table class="infoTable">
			<tr>
				<td class="infoCol" style="width: 120px;"><bf:Label ID="Label8" runat="server" Text="사업자등록번호" ShowHelp="True" HelpMessage="기존에 등록된 사업자등록번호가 없으면, [신규]를 클릭하세요." /></td>
				<td class="inputCol" style="width: 200px;">
					<bf:CodeHelper ID="_chSAUP_NO" runat="server">
						<ClientEvents OnUpdate="update_saupNo" />
						<CodeHelperPage HelperUrl="/Common/BusinessNo.aspx" Width="800px" />
					</bf:CodeHelper>
					<bf:TextBox ID="_txtSAUP_NO" runat="server" Style="display: none;" ImeMode="DashNumeric" MaxLength="12" />
					<br />
					<bf:CheckBox ID="_chkNew" runat="server" Text="신규" />
				</td>
				<td class="infoCol" style="width: 120px;">상호</td>
				<td class="inputCol" style="width: 200px;"><bf:TextBox ID="_txtCOMPANY_NM" runat="server" /></td>
				<td class="infoCol" style="width: 120px;">법인등록번호</td>
				<td class="inputCol"><bf:TextBox ID="_txtBUBIN_NO" runat="server" ImeMode="DashNumeric" MaxLength="14" /></td>
			</tr>
			<tr>
				<td class="infoCol">대표자명</td>
				<td class="inputCol"><bf:TextBox ID="_txtPRSDNT_NM2" runat="server" /></td>
				<td class="infoCol">업태</td>
				<td class="inputCol"><bf:TextBox ID="_txtUPTE" runat="server" /></td>
				<td class="infoCol">업종</td>
				<td class="inputCol"><bf:TextBox ID="_txtUPJONG" runat="server" /></td>
			</tr>
			<tr>
				<td class="infoCol">전화</td>
				<td class="inputCol"><bf:TextBox ID="_txtTELNO" runat="server" ImeMode="DashNumeric" /></td>
				<td class="infoCol">팩스</td>
				<td class="inputCol"><bf:TextBox ID="_txtFAXNO" runat="server" ImeMode="DashNumeric" /></td>
				<td class="infoCol">이메일</td>
				<td class="inputCol"><bf:TextBox ID="_txtEMAIL" runat="server" /></td>
			</tr>
			<tr>
				<td class="infoCol">회사형태</td>
				<td class="inputCol"><bf:DropDownList ID="_ddlCOMPANY_TYPE_CD" runat="server" /></td>
				<td class="infoCol">주소</td>
				<td class="inputCol" colspan="3"><bf:TextBox ID="_txtADDR" runat="server" Width="488px" /></td>
			</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend>명령수행</legend>
		<div id="_dvSYSINFO" runat="server" class="infoSystem" />
		<div class="infoCommand">
			<bf:Button ID="_btnSave" runat="server" Text="저장" ButtonImage="Save" ButtonConfirm="True" ValidationGroup="Save" OnClick="_btnSave_Click" />
			<!--
			parent.closeModalPopup() 함수에 필요한 변수(들)를 던지면, 창이 닫혔다는 이벤트와 함께 목록 페이지에서 해당 변수들을 받을 수 있습니다.
			-->
			<bf:Button ID="_btnList" runat="server" Text="닫기" ButtonImage="Cancel" OnClientClick="javascript:parent.closeModalPopup();" />
		</div>
	</fieldset>
</asp:Content>
