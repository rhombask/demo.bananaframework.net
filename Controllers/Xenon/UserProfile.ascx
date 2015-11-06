<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.ascx.cs" Inherits="demo.bananaframework.net.Controllers.Xenon.UserProfile" %>
<div class="user-info">
	<div class="user-image"><a href="extra-profile.aspx"><img src="/Images/user-2.png" class="img-responsive img-circle" /></a></div>
	<div class="user-details">
		<h3>
			<a href="/Office/MBR/1000.aspx"><asp:Literal ID="_ltUserName" runat="server" /></a>
			<!-- Available statuses: is-online, is-idle, is-busy and is-offline -->
			<span class="user-status is-online"></span>
		</h3>
		<p class="user-title"><asp:Literal ID="_ltJikupName" runat="server" /></p>
		<div class="user-links">
			<a href="/Office/MBR/1000.aspx" class="btn btn-primary">본인정보조회</a>
			<%--<a href="extra-profile.aspx" class="btn btn-success">Upgrade</a>--%>
		</div>
	</div>
</div>
