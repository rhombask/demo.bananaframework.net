<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusinessNo.aspx.cs" Inherits="demo.bananaframework.net.Common.BusinessNo" %>

<%@ Register Assembly="BANANA.Web.Controls" Namespace="BANANA.Web.Controls" TagPrefix="bf" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>사업자등록증 검색</title>
	<link href="/Common/Css/default.css" rel="stylesheet" />
	<link href="/Common/Css/View.css" rel="stylesheet" />
	<style type="text/css">
		body{background-color:#ffffff;}
	</style>
	<script src="/Common/Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		// 부모페이지의 개체들
		var $modal_container; // 코드헬퍼 창이 화면에 출력되면, 배경화면에 마우스 클릭을 막고 opacity를 70%로 떨어뜨리는 DIV
		var $iframe_container; // 코드헬퍼 검색창을 감싸는 iframe
		var $codehelper_container; // 부모 페이지의 코드, 코드명 및 이미지버튼을 감싸는 SPAN 컨테이너
		var $totalcode_textbox; // 코드 텍스트박스
		var $codename_textbox; // 코드명 텍스트박스

		// 부모페이지의 개체들을 설정해 줌(이 함수명을 변경하면 안 됨)
		function setParentObject(a, b, c, d, e) {
			$modal_container = a;
			$iframe_container = b;
			$codehelper_container = c;
			$totalcode_textbox = d;
			$codename_textbox = e;
		}

		// 부모페이지의 코드와 코드명에 값을 바인딩 처리함
		function returnBusinessNo(BUBIN_NO, SAUP_NO, COMPANY_NM, UPTE, UPJONG, PRSDNT_NM, TELNO, FAXNO, EMAIL, COMPANY_TYPE, ADDR) {
			// TotalCode
			$totalcode_textbox.val(COMPANY_NM);
			// CodeName
			$codename_textbox.val(SAUP_NO);

			// Update 이벤트 트리거를 실행합니다.
			var json_object = { "BUBIN_NO": BUBIN_NO
				, "SAUP_NO": SAUP_NO
				, "COMPANY_NM": COMPANY_NM
				, "UPTE": UPTE
				, "UPJONG": UPJONG
				, "PRSDNT_NM": PRSDNT_NM
				, "TELNO": TELNO
				, "FAXNO": FAXNO
				, "EMAIL": EMAIL
				, "COMPANY_TYPE": COMPANY_TYPE
				, "ADDR": ADDR
				};
			$codehelper_container.trigger("update", json_object);
			
			// 흐릿한 배경화면 개체를 제거합니다.
			$(parent.document).find($modal_container).remove();
			// 코드헬퍼 검색창을 제거합니다.
			$(parent.document).find($iframe_container).remove();
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<fieldset id="search">
		<legend>검색조건</legend>
		<table class="gridSearch">
			<tr>
				<td class="searchLabel">사업자등록번호</td>
				<td class="searchObject"><bf:TextBox ID="_txtSAUP_NO" runat="server" /></td>
				<td class="searchLabel">법인등록번호</td>
				<td class="searchObject"><bf:TextBox ID="_txtBUBIN_NO" runat="server" /></td>
				<td class="searchLabel">회사명</td>
				<td class="searchObject"><bf:TextBox ID="_txtCOMPANY_NM" runat="server" /></td>
			</tr>
			<tr>
				<td class="searchLabel">대표자명</td>
				<td class="searchObject"><bf:TextBox ID="_txtPRSDNT_NM" runat="server" /></td>
				<td class="searchButton" colspan="4">
					<bf:Button ID="_btnSearch" runat="server" Text="검색" OnClick="_btnSearch_Click" />
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset id="result">
		<legend>검색결과</legend>
		<bf:FixedGrid ID="FixedGrid1" runat="server" Dock="Fill" ShowRowNumber="true" AllowPaging="true" OnPageIndexChanged="FixedGrid1_PageIndexChanged" OnPageSizeChanged="FixedGrid1_PageSizeChanged" PageSize="50,100,300,500">
			<bf:TemplateField HeaderText="사업자등록번호" HorizontalAlignment="Center">
				<ItemTemplate>
					<bf:HyperLink runat="server" Text='<%# Eval("SAUP_NO") %>' NavigateUrl='<%# getUrl(Eval("BUBIN_NO"), Eval("SAUP_NO"), Eval("COMPANY_NM"), Eval("UPTE"), Eval("UPJONG"), Eval("PRSDNT_NM"), Eval("TELNO"), Eval("FAXNO"), Eval("EMAIL"), Eval("COMPANY_TYPE_CD"), Eval("ADDR")) %>' />
				</ItemTemplate>
			</bf:TemplateField>
			<bf:BoundDataField DataTextField="COMPANY_NM" HeaderText="회사명" />
			<bf:BoundDataField DataTextField="BUBIN_NO" HeaderText="법인등록번호" HorizontalAlignment="Center" Width="100px" />
			<bf:BoundDataField DataTextField="PRSDNT_NM" HeaderText="대표자명" />
			<bf:BoundDataField DataTextField="UPTE" HeaderText="업태" />
			<bf:BoundDataField DataTextField="UPJONG" HeaderText="업종" />
			<bf:BoundDataField DataTextField="TELNO" HeaderText="전화" />
			<bf:BoundDataField DataTextField="FAXNO" HeaderText="팩스" />
			<bf:BoundDataField DataTextField="EMAIL" HeaderText="이메일" />
			<bf:BoundDataField DataTextField="ADDR" HeaderText="주소" />
			<bf:TemplateField HeaderText="주소" Width="300px">
				<ItemTemplate>
					<bf:Label runat="server" Text='<%# Eval("ADDR") %>' ToolTip='<%# Eval("ADDR") %>' />
				</ItemTemplate>
			</bf:TemplateField>
		</bf:FixedGrid>
	</fieldset>
	</form>
</body>
</html>
