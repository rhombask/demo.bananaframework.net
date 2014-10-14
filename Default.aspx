<%@ Page Title="" Language="C#" MasterPageFile="~/Control/Xenon/Xenon.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="demo.bananaframework.net.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<script src="/Common/Scripts/jquery-validate/jquery.validate.min.js"></script>
	<script src="/Common/Scripts/toastr/toastr.min.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			// body에 클래스 추가
			$("body").addClass("login-page");
			$("body").addClass("login-light");
			// form에 클래스 추가
			$("#form1").addClass("login-form");
			$("#form1").addClass("fade-in-effect");
			// Reveal Login form
			setTimeout(function () { $(".fade-in-effect").addClass('in'); }, 1);
			// Validation and Ajax action
			$("form#form1").validate({
				rules: {
					username: {
						required: true
					},
					passwd: {
						required: true
					}
				},
				messages: {
					username: {
						required: "아이디를 입력하세요."
					},
					passwd: {
						required: "비밀번호를 입력하세요."
					}
				},
				// Form Processing via AJAX
				submitHandler: function (form) {
					show_loading_bar(70); // Fill progress bar to 70% (just a given value)
					var opts = {
						"closeButton": true,
						"debug": false,
						"positionClass": "toast-top-full-width",
						"onclick": null,
						"showDuration": "300",
						"hideDuration": "1000",
						"timeOut": "5000",
						"extendedTimeOut": "1000",
						"showEasing": "swing",
						"hideEasing": "linear",
						"showMethod": "fadeIn",
						"hideMethod": "fadeOut"
					};
					$.ajax({
						url: "data/login-check.php",
						method: 'POST',
						dataType: 'json',
						data: {
							do_login: true,
							username: $(form).find('#username').val(),
							passwd: $(form).find('#passwd').val(),
						},
						success: function (resp) {
							show_loading_bar({
								delay: .5,
								pct: 100,
								finish: function () {
									// Redirect after successful login page (when progress bar reaches 100%)
									if (resp.accessGranted) {
										window.location.href = 'dashboard-1.html';
									}
								}
							});
							// Remove any alert
							$(".errors-container .alert").slideUp('fast');
							// Show errors
							if (resp.accessGranted == false) {
								$(".errors-container").html('<div class="alert alert-danger">\
									<button type="button" class="close" data-dismiss="alert">\
										<span aria-hidden="true">&times;</span>\
										<span class="sr-only">Close</span>\
									</button>\
									' + resp.errors + '\
								</div>');
								$(".errors-container .alert").hide().slideDown();
								$(form).find('#passwd').select();
							}
						}
					});
				}
			});
			// Set Form focus
			$("form#form1 .form-group:has(.form-control):first .form-control").focus();
		});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphContent" runat="server">
	<div class="login-container">
		<div class="row">
			<div class="col-sm-6">
				<!-- Errors container -->
				<div class="errors-container"></div>
				<!-- Add class "fade-in-effect" for login form effect -->
				<form id="form1" runat="server">
				<div class="login-header">
					<a href="dashboard-1.aspx" class="logo">
						<img src="/Images/logo-white-bg@2x.png" alt="" width="80" />
						<span>log in</span>
					</a>
					<p>정상적인 이용을 위해서는 시스템에 로그인 하셔야 합니다.</p>
				</div>
				<div class="form-group">
					<label class="control-label" for="username">아이디</label>
					<input type="text" class="form-control" name="username" id="username" autocomplete="off" />
				</div>
				<div class="form-group">
					<label class="control-label" for="passwd">비밀번호</label>
					<input type="password" class="form-control" name="passwd" id="passwd" autocomplete="off" />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary  btn-block text-left">
						<i class="fa-lock"></i>
						Log In
						</button>
				</div>
				<div class="login-footer">
					<a href="#">Forgot your password?</a>
					<div class="info-links">
						<a href="#">ToS</a> -
					
						<a href="#">Privacy Policy</a>
					</div>
				</div>
				</form>
				<!-- External login -->
				<div class="external-login">
					<%--<a href="#" class="facebook">
						<i class="fa-facebook"></i>
						Facebook Login
					</a>
					<a href="#" class="twitter">
						<i class="fa-twitter"></i>
						Login with Twitter
					</a>
					<a href="#" class="gplus">
						<i class="fa-google-plus"></i>
						Login with Google Plus
					</a>--%>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="_cphModalArea" runat="server">
</asp:Content>
