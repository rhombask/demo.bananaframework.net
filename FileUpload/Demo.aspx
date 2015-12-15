<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="demo.bananaframework.net.FileUpload.Demo" %>

<%@ Register Assembly="BANANA.Web.Controls.v4.5" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>바나나 프레임워크 파일 업로드 컨트롤 데모</title>
	<script src="/Common/Scripts/jquery-1.11.1.min.js"></script>
	<style type="text/css">
		a:link, a:visited { color: #0075ff; outline: 0; }
		a:hover { color: #ff9900; }
		body { font-family: "맑은 고딕", Gulim, Verdana; font-size: 12px; line-height: 22px; }
		h1 { font-size: 22px; }
		h2 { font-size: 16px; margin-left: 15px; color: #004080; }
		h3 { font-weight: bold; }
		.l { text-align: left; }
		.c { text-align: center; }
		.r { text-align: right; }

		.tblSolid { border-collapse: collapse; border: 1px solid #004080; }
		.tblSolid TD { border: 1px solid #004080; padding: 5px; }
	</style>
	<script type="text/javascript">
		function uploadFinished(files) {
			alert("업로드가 완료되고, 포스트백을 시작합니다.");
		}
	</script>
</head>
<body>
	<h1>바나나 프레임워크 파일 업로드 컨트롤 데모</h1>
	<script type="text/javascript">
		function uploadFiles() {
			<%=FileUpload1.ClientID%>.StartUpload();
		}

		//navigator.msLaunchUri("banana://"
		//	, function () {
		//		alert("프로토콜 성공");
		//	}
		//	, function () {
		//		alert("프로토콜 실패");
		//	}
		//);
	</script>
	<form id="form1" runat="server">
		<bf:FileUpload ID="FileUpload1" runat="server" Width="1000px" UploadPath="/Storage">
			<ClientEvents OnComplete="uploadFinished" />
		</bf:FileUpload>
		<br />
		<bf:Button ID="_btnUpload" runat="server" ButtonImage="Top" Text="외부 업로드 버튼" OnClick="_btnUpload_Click" OnClientClick="javascript:uploadFiles();" OnWaitCallback="uploadFinished" />
		<bf:Button ID="_btnQuery" runat="server" ButtonImage="Search" Text="업로드한 자료 조회" OnClick="_btnQuery_Click" /><br />
		업로드한 자료를 조회하고 싶으시면, "외부 업로드 버튼"을 이용해서 파일을 업로드 하세요.
		<br /><br />
		<asp:Button ID="_btnApply_01" runat="server" Text="옵 션 적 용" OnClick="_btnApply_01_Click" /><br /><br />
		<b>각종 옵션 설정</b>
		<fieldset>
			<legend>Buttons</legend>
			<table style="width:1000px;">
				<tr>
					<td style="width:160px;">ShowAdd: </td>
					<td style="width:180px;"><bf:RadioButtonList id="_rblButtonsShowAdd" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" /></td>
					<td>추가 버튼을 보여주거나 숨깁니다.</td>
				</tr>
				<tr>
					<td>ShowRemoveAllFiles: </td>
					<td><bf:RadioButtonList id="_rblButtonsShowRemoveAllFiles" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" /></td>
					<td>모두제거 버튼을 보여주거나 숨깁니다.</td>
				</tr>
				<tr>
					<td>ShowRemoveSelectedFiles: </td>
					<td><bf:RadioButtonList id="_rblButtonsShowRemoveSelectedFiles" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" /></td>
					<td>선택제거 버튼을 보여주거나 숨깁니다.</td>
				</tr>
				<tr>
					<td>ShowStartUpload: </td>
					<td><bf:RadioButtonList id="_rblButtonsShowStartUpload" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" /></td>
					<td>업로드 시작 버튼을 보여주거나 숨깁니다. 업로드 시작 버튼을 숨기면, 외부 업로드 버튼을 이용해서 업로드를 시작할 수 있습니다.</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<legend>DownloadManager</legend>
			<table style="width:1000px;">
				<tr>
					<td style="width:160px;">DefaultFolder: </td>
					<td colspan="2"><bf:TextBox ID="_txtDownloadManagerDefaultFolder" runat="server" Width="500px" /><br />다운로드 매니저 창에서 파일을 다운로드 받을 기본 폴더의 경로를 지정합니다.<br />
						클라이언트 컴퓨터에 해당 폴더가 존재하지 않을 경우에는 해당 폴더를 자동으로 생성합니다.<br />
						다만, 지정한 드라이브가 존재하지 않을 경우에는 1) 직전에 다운로드 받은 폴더, 2) 내 문서 폴더의 순서대로 설정됩니다.
					</td>
				</tr>
				<tr>
					<td>EnableCancelButton: </td>
					<td style="width:180px;"><bf:RadioButtonList id="_rblDownloadManagerEnableCancelButton" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" /></td>
					<td>바나나 에이전트의 다운로드 매니저 창에서 다운로드 취소 버튼을 비/활성화 처리합니다.</td>
				</tr>
				<tr>
					<td>EnableChangeFolderButton: </td>
					<td><bf:RadioButtonList id="_rblDownloadManagerEnableChangeFolderButton" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" /></td>
					<td>바나나 에이전트의 다운로드 매니저 창에서 경로변경 버튼을 비/활성화 처리합니다.</td>
				</tr>
				<tr>
					<td>EnableOpenFolderButton: </td>
					<td><bf:RadioButtonList id="_rblDownloadManagerEnableOpenFolderButton" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" /></td>
					<td>바나나 에이전트의 다운로드 매니저 창에서 폴더열기 취소 버튼을 비/활성화 처리합니다.</td>
				</tr>
				<tr>
					<td>RootFolder: </td>
					<td><bf:DropDownList id="_ddlDownloadManagerRootFolder" runat="server" /></td>
					<td>다운로드 받을 최상위 경로 제한 정보를 저장하거나 가져옵니다.<br />최상위 경로를 제한하시면, 해당 경로의 상위 경로에는 파일을 다운로드할 수 없습니다.</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<legend>Limit</legend>
			<table>
				<tr>
					<td style="width:160px;">IndividualFileLength: </td>
					<td style="width:180px;"><bf:TextBox id="_txtLimitIndividualFileLength" runat="server" ImeMode="Integer" /></td>
					<td>개별 업로드 파일의 용량 제한을 가져오거나 저장합니다.</td>
				</tr>
				<tr>
					<td>IndividualFileUnit: </td>
					<td><bf:DropDownList id="_ddlLimitIndividualFileUnit" runat="server" /></td>
					<td>개별 업로드 파일의 용량 제한 단위를 가져오거나 저장합니다.</td>
				</tr>
				<tr>
					<td>PermittedExtensions: </td>
					<td colspan="2"><bf:TextBox id="_txtLimitPermittedExtensions" runat="server" Width="500px" /><br />
						업로드를 허용할 파일 확장자들을 가져오거나 저장합니다.<br />확장자들은 콤마(,) 혹은 세미콜론(;)으로 구분해 주세요. 콤마 혹은 세미콜론을 복합적으로 사용해도 됩니다(예: .ppt;.doc,.hwp).<br />또한, 확장자명 앞의 점(.)은 생략할 수 있습니다(예: ppt;.doc,hwp).<br />모든 확장자를 허용하려면, 공백으로 비워 두세요.
					</td>
				</tr>
				<tr>
					<td>TotalFilesCount: </td>
					<td><bf:TextBox id="_txtLimitTotalFilesCount" runat="server" ImeMode="Integer" /></td>
					<td>한 번에 업로드할 수 있는 파일의 갯수를 가져오거나 저장합니다.</td>
				</tr>
				<tr>
					<td>TotalFilesLength: </td>
					<td><bf:TextBox id="_txtLimitTotalFilesLength" runat="server" ImeMode="Integer" /></td>
					<td>전체 업로드 파일의 용량 제한을 가져오거나 저장합니다.</td>
				</tr>
				<tr>
					<td>TotalFilesUnit: </td>
					<td><bf:DropDownList id="_ddlLimitTotalFilesUnit" runat="server" /></td>
					<td>전체 업로드 파일의 용량 제한 단위를 가져오거나 저장합니다.</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<legend>기타</legend>
			<table>
				<tr>
					<td style="width:160px;">FileNameFormat: </td>
					<td style="width:180px;"><bf:DropDownList id="_ddlFileNameFormat" runat="server" /></td>
					<td>서버에 저장할 파일명의 형태를 지정합니다.<br />Guid_FileName은 "4c41f87d-0ae0-41cf-a475-bfe20e44bb65_debian-8.1.0-amd64-DVD-2.iso"의 형태로 저장되며,<br />FileName_Guid은 "debian-8.1.0-amd64-DVD-2_4c41f87d-0ae0-41cf-a475-bfe20e44bb65.iso"의 형태로 저장됩니다.</td>
				</tr>
				<tr>
					<td>IndividualFileClickMode: </td>
					<td><bf:DropDownList id="_ddlIndividualFileClickMode" runat="server" /></td>
					<td>개별 파일 링크 클릭 시, 처리할 액션 모드를 가져오거나 저장합니다.<br />DocumentViewer: 도큐먼트 뷰어를 바로 실행합니다.<br />DownloadManager: 다운로드 매니저를 통하여 파일을 다운로드 합니다.<br />단, 이 enum은 UseBananaAgent가 false일 경우에는 동작하지 않습니다.</td>
				</tr>
				<tr>
					<td>UploadPath: </td>
					<td><bf:TextBox id="_txtUploadPath" runat="server" Text="/Storage" ReadOnly="true" /></td>
					<td>업로드할 서버의 경로를 가져오거나 저장합니다.<br />경로는 "/Storage/Files"와 같이 논리 경로는 입력하거나, "D:\\Storage\\Files"와 같이 물리 경로를 입력해도 됩니다.<br />단, "D:\\Storage/TempFolder/"와 같이 논리 경로와 물리 경로가 함께 사용될 수는 없습니다.<br />논리 경로 혹은 물리 경로에서 마지막 디렉토리 구분자(논리: "/", 물리: "\")는 붙여도 되고 붙이지 않아도 됩니다.<br />
						데모 버전에서는 수정이 불가합니다.
					</td>
				</tr>
				<tr>
					<td>UseBananaAgent: </td>
					<td><bf:RadioButtonList id="_rblUseBananaAgent" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" /></td>
					<td>바나나 에이전트를 사용할지 여부를 가져오거나 저장합니다. 바나나 에이전트를 사용하지 않으면,<br />다운로드 버튼 클릭 시 선택된 파일들이 zip으로 압축되어서 다운로드 됩니다.<br />또한, 개별 파일의 링크를 클릭 시 웹 브라우저를 통해서 다운로드 됩니다.</td>
				</tr>
			</table>
		</fieldset>
		<br />
		<asp:Button ID="_btnApply_02" runat="server" Text="옵 션 적 용" OnClick="_btnApply_01_Click" />
	</form>
</body>
</html>
