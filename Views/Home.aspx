<%@ Page Title="홈" Language="C#" MasterPageFile="~/Controllers/Web.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="demo.bananaframework.net.Views.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<style type="text/css">
		body { font-size: 14px; line-height: 25px; padding: 10px; }
		ol li { list-style-type: decimal-leading-zero; }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphBody" runat="server">
바나나 프레임워크를 활용한 웹 업무시스템 템플릿입니다.<br />
ERP, MIS, CRM 등 기간계 업무시스템을 개발하시려면 처음 시작할 때에 프레임워크(플랫폼) 작업을 하셔야 하죠?<br />
이 프레임워크 개발에 많은 시간과 비용이 드는 것은 사실입니다만, 많은 고객사들은 그 비용을 지불할 생각을 안 하네요.<br />
ASP.NET 개발자라면 누구나 무료로 사용하실 수 있는 일반적인 템플릿의 프레임워크를 공개합니다.<br />
본 템플릿에는 아래의 가능들이 기본적으로 개발되어 있습니다.<br />
-- 아 래 --
<ol>
	<li>이용자정보관리</li>
	<li>권한그룹관리</li>
	<li>권한그룹별권한관리</li>
	<li>화면관리</li>
	<li>공통코드관리</li>
	<li>휴일관리</li>
	<li>기타 샘플 화면들</li>
	<li>기본적인 권한 처리</li>
	<li>탭 처리</li>
	<li>풀다운 메뉴</li>
</ol>
또한, SQL Server 연결 정보도 공개되어 있으니 각종 테이블, 프로시저 및 사용자 정의 함수도 다운로드 받으셔서 연습해 보실 수 있습니다.<br />
※ 본 템플릿 자체는 무료이나, 프레임워크의 기본이 되는 "바나나 프레임워크( <a href="http://www.bananaframework.net" target="_blank">http://www.bananaframework.net</a> )"은 무료가 아닙니다.<br />
※ 바나나 프레임워크의 라이선스 정책에 대해서는 여기( <a href="http://www.bananaframework.net/Views/License.aspx" target="_blank">http://www.bananaframework.net/Views/License.aspx</a> )를 참고하세요.<br />
※ 본 템플릿을 제대로 구동하기 위해서는 바나나 프레임워크가 우선 설치되어야 합니다.<br />
※ 바나나 프레임워크는 개인 개발자에게 무료로 배포되고 있습니다. 설치 파일은 여기 ( <a href="http://www.bananaframework.net/Views/Download.aspx" target="_blank">http://www.bananaframework.net/Views/Download.aspx</a> )를 클릭하세요.<br />
※ /Controllers/Web.Maste 및 /Controllers/Popup.Master에서 구글 Analytics 관련 함수는 지우고 이용하시기 바랍니다.<br />
※ 전체 소스는 다음 경로에서 다운로드 받으실 수 있습니다.<br />
<a href="https://github.com/rhombask/demo.bananaframework.net" target="_blank">https://github.com/rhombask/demo.bananaframework.net</a><br />
</asp:Content>
