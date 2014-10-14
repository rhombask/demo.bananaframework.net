﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopMenu.ascx.cs" Inherits="demo.bananaframework.net.Control.Xenon.TopMenu" %>
<nav class="navbar horizontal-menu">
	<!-- set fixed position by adding class "navbar-fixed-top" -->
	<div class="navbar-inner">
		<!-- Navbar Brand -->
		<div class="navbar-brand">
			<a href="dashboard-1.aspx" class="logo">
				<img src="/Images/logo-white-bg@2x.png" width="80" alt="" class="hidden-xs" />
				<img src="/Images/logo@2x.png" width="80" alt="" class="visible-xs" />
			</a>
			<a href="#" data-toggle="settings-pane" data-animate="true">
				<i class="linecons-cog"></i>
			</a>
		</div>

		<!-- Mobile Toggles Links -->
		<div class="nav navbar-mobile">
			<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
			<div class="mobile-menu-toggle">
				<!-- This will open the popup with user profile settings, you can use for any purpose, just be creative -->
				<a href="#" data-toggle="settings-pane" data-animate="true"><i class="linecons-cog"></i></a>
				<a href="#" data-toggle="user-info-menu-horizontal"><i class="fa-bell-o"></i><span class="badge badge-success">7</span></a>

				<!-- data-toggle="mobile-menu-horizontal" will show horizontal menu links only -->
				<!-- data-toggle="mobile-menu" will show sidebar menu links only -->
				<!-- data-toggle="mobile-menu-both" will show sidebar and horizontal menu links -->
				<a href="#" data-toggle="mobile-menu-horizontal"><i class="fa-bars"></i></a>
			</div>
		</div>

		<div class="navbar-mobile-clear"></div>

		<!-- main menu -->
		<asp:Literal ID="_ltMenu" runat="server" />

		<!-- notifications and other links : S -->
		<ul class="nav nav-userinfo navbar-right">
			<li class="search-form">
				<!-- You can add "always-visible" to show make the search input visible -->
				<input type="text" name="s" class="form-control search-field" placeholder="Type to search..." />
				<button type="submit" class="btn btn-link">
					<i class="linecons-search"></i>
				</button>
			</li>
			<li class="dropdown xs-left">
				<a href="#" data-toggle="dropdown" class="notification-icon">
					<i class="fa-envelope-o"></i>
					<span class="badge badge-green">15</span>
				</a>

				<ul class="dropdown-menu messages">
					<li>

						<ul class="dropdown-menu-list list-unstyled ps-scrollbar">

							<li class="active">
								<!-- "active" class means message is unread -->
								<a href="#">
									<span class="line">
										<strong>Luc Chartier</strong>
										<span class="light small">- yesterday</span>
									</span>

									<span class="line desc small">This ain’t our first item, it is the best of the rest.
									</span>
								</a>
							</li>

							<li class="active">
								<a href="#">
									<span class="line">
										<strong>Salma Nyberg</strong>
										<span class="light small">- 2 days ago</span>
									</span>

									<span class="line desc small">Oh he decisively impression attachment friendship so if everything.
									</span>
								</a>
							</li>

							<li>
								<a href="#">
									<span class="line">Hayden Cartwright
											<span class="light small">- a week ago</span>
									</span>

									<span class="line desc small">Whose her enjoy chief new young. Felicity if ye required likewise so doubtful.
									</span>
								</a>
							</li>

							<li>
								<a href="#">
									<span class="line">Sandra Eberhardt
											<span class="light small">- 16 days ago</span>
									</span>

									<span class="line desc small">On so attention necessary at by provision otherwise existence direction.
									</span>
								</a>
							</li>

							<!-- Repeated -->

							<li class="active">
								<!-- "active" class means message is unread -->
								<a href="#">
									<span class="line">
										<strong>Luc Chartier</strong>
										<span class="light small">- yesterday</span>
									</span>

									<span class="line desc small">This ain’t our first item, it is the best of the rest.
									</span>
								</a>
							</li>

							<li class="active">
								<a href="#">
									<span class="line">
										<strong>Salma Nyberg</strong>
										<span class="light small">- 2 days ago</span>
									</span>

									<span class="line desc small">Oh he decisively impression attachment friendship so if everything.
									</span>
								</a>
							</li>

							<li>
								<a href="#">
									<span class="line">Hayden Cartwright
											<span class="light small">- a week ago</span>
									</span>

									<span class="line desc small">Whose her enjoy chief new young. Felicity if ye required likewise so doubtful.
									</span>
								</a>
							</li>

							<li>
								<a href="#">
									<span class="line">Sandra Eberhardt
											<span class="light small">- 16 days ago</span>
									</span>

									<span class="line desc small">On so attention necessary at by provision otherwise existence direction.
									</span>
								</a>
							</li>

						</ul>

					</li>

					<li class="external">
						<a href="blank-sidebar.aspx">
							<span>All Messages</span>
							<i class="fa-link-ext"></i>
						</a>
					</li>
				</ul>

			</li>

			<li class="dropdown xs-left">
				<a href="#" data-toggle="dropdown" class="notification-icon notification-icon-messages">
					<i class="fa-bell-o"></i>
					<span class="badge badge-purple">7</span>
				</a>

				<ul class="dropdown-menu notifications">
					<li class="top">
						<p class="small">
							<a href="#" class="pull-right">Mark all Read</a>
							You have <strong>3</strong> new notifications.
						</p>
					</li>

					<li>
						<ul class="dropdown-menu-list list-unstyled ps-scrollbar">
							<li class="active notification-success">
								<a href="#">
									<i class="fa-user"></i>

									<span class="line">
										<strong>New user registered</strong>
									</span>

									<span class="line small time">30 seconds ago
									</span>
								</a>
							</li>

							<li class="active notification-secondary">
								<a href="#">
									<i class="fa-lock"></i>

									<span class="line">
										<strong>Privacy settings have been changed</strong>
									</span>

									<span class="line small time">3 hours ago
									</span>
								</a>
							</li>

							<li class="notification-primary">
								<a href="#">
									<i class="fa-thumbs-up"></i>

									<span class="line">
										<strong>Someone special liked this</strong>
									</span>

									<span class="line small time">2 minutes ago
									</span>
								</a>
							</li>

							<li class="notification-danger">
								<a href="#">
									<i class="fa-calendar"></i>

									<span class="line">John cancelled the event
									</span>

									<span class="line small time">9 hours ago
									</span>
								</a>
							</li>

							<li class="notification-info">
								<a href="#">
									<i class="fa-database"></i>

									<span class="line">The server is status is stable
									</span>

									<span class="line small time">yesterday at 10:30am
									</span>
								</a>
							</li>

							<li class="notification-warning">
								<a href="#">
									<i class="fa-envelope-o"></i>

									<span class="line">New comments waiting approval
									</span>

									<span class="line small time">last week
									</span>
								</a>
							</li>
						</ul>
					</li>

					<li class="external">
						<a href="#">
							<span>View all notifications</span>
							<i class="fa-link-ext"></i>
						</a>
					</li>
				</ul>
			</li>

			<li class="dropdown user-profile">
				<a href="#" data-toggle="dropdown">
					<img src="/Images/user-1.png" alt="user-image" class="img-circle img-inline userpic-32" width="28" />
					<span>Arlind Nushi
							<i class="fa-angle-down"></i>
					</span>
				</a>

				<ul class="dropdown-menu user-profile-menu list-unstyled">
					<li>
						<a href="#edit-profile">
							<i class="fa-edit"></i>
							New Post
						</a>
					</li>
					<li>
						<a href="#settings">
							<i class="fa-wrench"></i>
							Settings
						</a>
					</li>
					<li>
						<a href="#profile">
							<i class="fa-user"></i>
							Profile
						</a>
					</li>
					<li>
						<a href="#help">
							<i class="fa-info"></i>
							Help
						</a>
					</li>
					<li class="last">
						<a href="extra-lockscreen.aspx">
							<i class="fa-lock"></i>
							Logout
						</a>
					</li>
				</ul>
			</li>

			<li>
				<a href="#" data-toggle="chat">
					<i class="fa-comments-o"></i>
				</a>
			</li>

		</ul>
		<!-- notifications and other links : E -->
	</div>
</nav>
