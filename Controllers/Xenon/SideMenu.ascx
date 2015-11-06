<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideMenu.ascx.cs" Inherits="demo.bananaframework.net.Controllers.Xenon.SideMenu" %>
<!-- Add "fixed" class to make the sidebar fixed always to the browser viewport. -->
<!-- Adding class "toggle-others" will keep only one menu item open at a time. -->
<!-- Adding class "collapsed" collapse sidebar root elements and show only icons. -->
<div id="sidebar" class="sidebar-menu toggle-others">
	<div class="sidebar-menu-inner">
		<header class="logo-env">
			<!-- logo -->
			<div class="logo">
				<a href="/Framework/Coconut/Default.aspx" class="logo-expanded"><img src="/Images/logo@2x.png" style="width:80px;" alt="" /></a>
				<a href="/Framework/Coconut/Default.aspx" class="logo-collapsed"><img src="/Images/logo-collapsed@2x.png" style="width:40px;" alt="" /></a>
			</div>
			<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
			<div class="mobile-menu-toggle visible-xs">
				<a href="#" data-toggle="user-info-menu"><i class="fa-bell-o"></i><span class="badge badge-success">7</span></a>
				<a href="#" data-toggle="mobile-menu"><i class="fa-bars"></i></a>
			</div>
			<!-- This will open the popup with user profile settings, you can use for any purpose, just be creative -->
			<div class="settings-icon">
				<a href="#" data-toggle="settings-pane" data-animate="true"><i class="linecons-cog"></i></a>
			</div>
		</header>
		<asp:Literal ID="_ltMenu" runat="server" />
	</div>
</div>
