<%@ Page Title="" Language="C#" MasterPageFile="~/Controllers/Xenon/VerticalMenu.master" AutoEventWireup="true" CodeBehind="chart_01.aspx.cs" Inherits="demo.bananaframework.net._Test.chart_01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<script src="/Common/Scripts/devexpress-web-14.1/js/globalize.min.js"></script>
	<script src="/Common/Scripts/devexpress-web-14.1/js/dx.chartjs.js"></script>
	<script src="/Common/Scripts/devexpress-web-14.1/js/knockout-3.1.0.js"></script>
	<script type="text/javascript">
		var xenonPalette = ['#68b828', '#7c38bc', '#0e62c7', '#fcd036', '#4fcdfc', '#00b19d', '#ff6264', '#f7aa47'];
		jQuery(document).ready(function ($) {
			// #1
			$('#bar-gauge-1').dxBarGauge({
				startValue: 0,
				endValue: 100,
				values: [47.27, 65.32, 84.59, 71.86],
				label: {
					indent: 30,
					format: 'fixedPoint',
					precision: 1,
					customizeText: function (arg) {
						return arg.valueText + ' %';
					}
				},
				title: {
					text: "Series' Ratings",
					font: {
						size: 28
					}
				},
				palette: xenonPalette
			});
			// #2
			$('#bar-gauge-2').dxBarGauge({
				startValue: -50,
				endValue: 50,
				baseValue: 0,
				values: [-21.3, 14.8, -30.9, 45.2],
				label: {
					customizeText: function (arg) {
						return arg.valueText + ' mm';
					}
				},
				palette: 'ocean',
				title: {
					text: 'Deviations in the Manufactured Parts',
					font: {
						size: 28
					}
				}
			});
			// #3
			$('#bar-gauge-3').append(
				'<div id="gauge" style="width: 80%; height: 100%; margin-top: 20px; float: left;"></div>',
				'<div id="panel" style="width: 20%; text-align: left; margin-top: 20px; float: left;"></div>'
			);
			var products = [
				{ name: 'Hummers', count: 41 },
				{ name: 'Shovers', count: 32 },
				{ name: 'Ladders', count: 13 },
				{ name: 'Watering cans', count: 48 },
				{ name: 'Screwdrivers', count: 24 },
				{ name: 'Nail pullers', count: 8 },
				{ name: 'Drills', count: 19 }
			];
			var gauge = $('#gauge').dxBarGauge({
				startValue: 0,
				endValue: 50,
				label: {
					format: 'fixedPoint',
					precision: 0
				},
				palette: xenonPalette
			}).dxBarGauge('instance');
			$('#panel').append($.map(products, function (product) {
				return $('<div></div>').append(
					'<input type="checkbox" class="cbr" value="' + product.count + '" checked></input>',
					'<span style="margin-left: 10px;">' + product.name + '</span>'
				);
			}));
			var $inputs = $('#panel input').change(handleChange);
			function handleChange() {
				var values = $.map($inputs, function (input) {
					return $(input).prop('checked') ? $(input).val() : null;
				});
				gauge.values(values);
			}
			handleChange();
			cbr_replace();
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
			<h1 class="title">Bar Gauges</h1>
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
					<strong>Bar Gauges</strong>
				</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Labels Customization</h3>
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
					<div id="bar-gauge-1" style="height: 440px; width: 100%;"></div>
					<br />
					<div class="text-center">
						<a href="#" id="gauge-1-randomize" class="btn btn-pink btn-small">Randomize</a>
						<a href="#" id="gauge-1-res" class="btn btn-white btn-small">Restart</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Palette</h3>
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
					<div id="bar-gauge-2" style="height: 440px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Variable Number of Bars</h3>
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
					<div id="bar-gauge-3" style="height: 440px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="_cphModalArea" runat="server">
</asp:Content>
