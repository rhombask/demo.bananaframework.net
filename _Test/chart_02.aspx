<%@ Page Title="" Language="C#" MasterPageFile="~/Controllers/Xenon/VerticalMenu.master" AutoEventWireup="true" CodeBehind="chart_02.aspx.cs" Inherits="demo.bananaframework.net._Test.chart_02" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<script src="/Common/Scripts/devexpress-web-14.1/js/globalize.min.js"></script>
	<script src="/Common/Scripts/devexpress-web-14.1/js/dx.chartjs.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			// #1
			var gauge = $('#gauge-linear-1').dxLinearGauge({
				scale: {
					startValue: 0,
					endValue: 5,
					majorTick: {
						tickInterval: 2.5
					},
					minorTick: {
						visible: true,
						tickInterval: 0.625
					}
				},
				title: {
					text: 'TV Show Rating',
					font: { size: 28 }
				},
				value: 4.3
			}).dxLinearGauge('instance');
			$("#gauge-linear-1-randomize").on('click', function (ev) {
				ev.preventDefault();
				gauge.value(between(0, 5));
			});
			// #2
			var gauge = $('#gauge-linear-2').dxLinearGauge({
				geometry: { orientation: 'vertical' },
				scale: {
					startValue: 0,
					endValue: 50,
					majorTick: {
						customTickValues: [0, 10, 25, 50],
						showCalculatedTicks: false
					}
				},
				title: {
					text: 'Fuel Volume (in Liters)',
					font: { size: 28 }
				},
				value: 35
			}).dxLinearGauge('instance');
			$("#gauge-linear-2-randomize").on('click', function (ev) {
				ev.preventDefault();
				gauge.value(between(0, 50));
			});
			// #3
			var gauge = $('#gauge-linear-3-1').dxLinearGauge({
				scale: {
					startValue: 0, endValue: 30,
					majorTick: {
						color: '#536878',
						tickInterval: 5
					},
					label: {
						indentFromTick: -3
					}
				},
				rangeContainer: {
					offset: 10,
					ranges: [
						{ startValue: 0, endValue: 5, color: '#4fcdfc' },
						{ startValue: 5, endValue: 20, color: '#fcd036' },
						{ startValue: 20, endValue: 30, color: '#68b828' }
					]
				},
				valueIndicator: {
					offset: 20
				},
				subvalueIndicator: {
					offset: -15
				},
				title: {
					text: 'Issues Closed (with Min and Max Expected)',
					font: { size: 28 }
				},
				value: 17,
				subvalues: [5, 25]
			}).dxLinearGauge('instance');
			$("#gauge-linear-3-randomize").on('click', function (ev) {
				ev.preventDefault();
				gauge.value(between(10, 50));
			});
		});
		function between(randNumMin, randNumMax) {
			var randInt = Math.floor((Math.random() * ((randNumMax + 1) - randNumMin)) + randNumMin);
			return randInt;
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphContent" runat="server">
	<div class="page-title">
		<div class="title-env">
			<h1 class="title">Linear Gauges</h1>
			<p class="description">Data visualization widgets for your stats</p>
		</div>
		<div class="breadcrumb-env">
			<ol class="breadcrumb bc-1">
				<li>
					<a href="dashboard-1.aspx"><i class="fa-home"></i>Home</a>
				</li>
				<li>
					<a href="charts-main.aspx">Charts</a>
				</li>
				<li class="active">
					<strong>Linear Gauges</strong>
				</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Linear Gauges</h3>
					<div class="panel-options">
						<a href="#" data-toggle="panel">
							<span class="collapse-icon">&ndash;</span>
							<span class="expand-icon">+</span>
						</a>
						<a href="#" data-toggle="remove">&times;
								</a>
					</div>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-6">
							<h4 class="no-top-margin">Scale Custom Tick Interval</h4>
							<div id="gauge-linear-1" style="height: 400px;"></div>
							<div class="text-center">
								<a href="#" id="gauge-linear-1-randomize" class="btn btn-turquoise btn-small">Randomize</a>
							</div>
						</div>
						<div class="col-sm-6">
							<h4 class="no-top-margin">Scale Custom Tick Values</h4>
							<div id="gauge-linear-2" style="height: 400px;"></div>
							<div class="text-center">
								<a href="#" id="gauge-linear-2-randomize" class="btn btn-turquoise btn-small">Randomize</a>
							</div>
						</div>
					</div>
				</div>
				<hr />
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-12">
							<h4 class="no-top-margin">Custom Layout</h4>
							<div id="gauge-linear-3-1" style="height: 120px;"></div>
							<div class="text-center">
								<a href="#" id="gauge-linear-3-randomize" class="btn btn-turquoise btn-small">Randomize</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="_cphModalArea" runat="server">
</asp:Content>
