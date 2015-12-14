<%@ Page Title="" Language="C#" MasterPageFile="~/Controllers/Xenon/VerticalMenu.master" AutoEventWireup="true" CodeBehind="chart_03.aspx.cs" Inherits="demo.bananaframework.net._Test.chart_03" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<script src="/Common/Scripts/devexpress-web-14.1/js/globalize.min.js"></script>
	<script src="/Common/Scripts/devexpress-web-14.1/js/dx.chartjs.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			// #1
			var gauge = $('#gauge-1').dxCircularGauge({
				scale: {
					startValue: 50,
					endValue: 150,
					majorTick: {
						tickInterval: 10
					}
				},
				rangeContainer: {
					palette: 'pastel',
					ranges: [
						{ startValue: 50, endValue: 90, color: '#8dc63f' },
						{ startValue: 90, endValue: 130, color: '#ffba00' },
						{ startValue: 130, endValue: 150, color: '#cc3f44' },
					]
				},
				title: {
					text: 'Temperature of the Liquid in the Boiler',
					font: { size: 28 }
				},
				value: 105
			}).dxCircularGauge('instance');
			$("#gauge-1-randomize").on('click', function (ev) {
				ev.preventDefault();
				gauge.value(between(50, 150));
			});
			$("#gauge-1-res").on('click', function (ev) {
				ev.preventDefault();
				gauge.value(50);
			});
			// #2
			var gauge = $('#gauge-2').dxCircularGauge({
				scale: {
					startValue: 0,
					endValue: 1000,
					majorTick: {
						color: '#1A1100',
						tickInterval: 100
					},
					minorTick: {
						color: '#1A1100',
						visible: true,
						tickInterval: 25
					}
				},
				rangeContainer: {
					backgroundColor: 'none'
				},
				title: {
					text: 'Fan Speed (in rpm)',
					font: { size: 28 }
				},
				value: 750
			}).dxCircularGauge('instance');
			$("#gauge-2-randomize").on('click', function (ev) {
				ev.preventDefault();
				gauge.value(between(0, 1000));
			});
			$("#gauge-2-res").on('click', function (ev) {
				ev.preventDefault();
				gauge.value(0);
			});
			// #3
			var gauge = $('#gauge-3').dxCircularGauge({
				scale: {
					startValue: 0,
					endValue: 100,
					majorTick: {
						tickInterval: 10
					},
					label: {
						customizeText: function (arg) {
							return arg.valueText + ' %';
						}
					}
				},
				rangeContainer: {
					ranges: [
						{ startValue: 0, endValue: 20, color: '#4fcdfc' },
						{ startValue: 20, endValue: 50, color: '#2a6e87' },
						{ startValue: 50, endValue: 100, color: '#1e4d5e' }
					]
				},
				title: {
					text: 'Battery Charge',
					font: { size: 28 }
				},
				value: 45
			}).dxCircularGauge('instance');
			$("#gauge-3-randomize").on('click', function (ev) {
				ev.preventDefault();
				gauge.value(between(0, 100));
			});
			$("#gauge-3-res").on('click', function (ev) {
				ev.preventDefault();
				gauge.value(0);
			});
			// #4
			var c1 = $('#gauge-4-1');
			var c2 = $('#gauge-4-2');
			var c3 = $('#gauge-4-3');
			var c4 = $('#gauge-4-4');
			var options = {
				geometry: {
					startAngle: 180, endAngle: 0
				},
				scale: {
					startValue: 0, endValue: 100,
					majorTick: {
						tickInterval: 50
					},
					label: {
						customizeText: function (arg) {
							return arg.valueText + ' %';
						}
					}
				}
			};
			c1.dxCircularGauge($.extend(true, {}, options, {
				value: 75,
				valueIndicator: {
					type: 'rectangleNeedle',
					color: '#40bbea'
				}
			}));
			c2.dxCircularGauge($.extend(true, {}, options, {
				value: 80,
				valueIndicator: {
					type: 'twoColorNeedle',
					color: '#d5080f',
					secondColor: '#0e62c7'
				}
			}));
			c3.dxCircularGauge($.extend(true, {}, options, {
				value: 65,
				valueIndicator: {
					type: 'triangleNeedle',
					color: '#7c38bc'
				}
			}));
			c4.dxCircularGauge($.extend(true, {}, options, {
				value: 90,
				valueIndicator: {
					type: 'rangebar',
					color: '#68b828'
				}
			}));
			// #5
			var c1 = $('#gauge-5');
			var options = {
				geometry: {
					startAngle: 180, endAngle: 0
				},
				scale: {
					startValue: 0, endValue: 10,
					majorTick: { tickInterval: 1 }
				}
			};
			c1.dxCircularGauge($.extend(true, {}, options, {
				value: 7,
				subvalues: [4, 9],
				subvalueIndicator: {
					type: 'triangleMarker',
					color: '#cc3f44'
				}
			}));
			// #6
			var c1 = $('#gauge-6-1');
			var c2 = $('#gauge-6-2');
			var c3 = $('#gauge-6-3');
			var c4 = $('#gauge-6-4');
			var options = {
				scale: {
					startValue: 0, endValue: 100,
					majorTick: { tickInterval: 10 }
				}
			};
			c1.dxCircularGauge($.extend(true, {}, options, {
				geometry: { startAngle: 180, endAngle: 90 },
				value: 80
			}));
			c2.dxCircularGauge($.extend(true, {}, options, {
				scale: { startValue: 100, endValue: 0 },
				geometry: { startAngle: 90, endAngle: 0 },
				value: 75
			}));
			c3.dxCircularGauge($.extend(true, {}, options, {
				scale: { startValue: 100, endValue: 0 },
				geometry: { startAngle: -90, endAngle: -180 },
				value: 70
			}));
			c4.dxCircularGauge($.extend(true, {}, options, {
				geometry: { startAngle: 0, endAngle: -90 },
				value: 68
			}));
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
			<h1 class="title">Gauges</h1>
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
					<strong>Circular Gauges</strong>
				</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Circular Gauges</h3>
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
					<div id="gauge-1" style="height: 440px; width: 100%;"></div>
					<br />
					<div class="text-center">
						<a href="#" id="gauge-1-randomize" class="btn btn-pink btn-small">Randomize</a>
						<a href="#" id="gauge-1-res" class="btn btn-white btn-small">Restart</a>
					</div>
				</div>
				<hr />
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-6">
							<h4 class="no-top-margin">Scale Minor Ticks</h4>
							<div id="gauge-2" style="height: 440px; margin: 0 30px;"></div>
							<div class="text-center">
								<a href="#" id="gauge-2-randomize" class="btn btn-pink btn-small">Randomize</a>
								<a href="#" id="gauge-2-res" class="btn btn-white btn-small">Restart</a>
							</div>
						</div>
						<div class="col-sm-6">
							<h4 class="no-top-margin">Scale Label Formatting</h4>
							<div id="gauge-3" style="height: 440px; margin: 0 30px;"></div>
							<div class="text-center">
								<a href="#" id="gauge-3-randomize" class="btn btn-pink btn-small">Randomize</a>
								<a href="#" id="gauge-3-res" class="btn btn-white btn-small">Restart</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Different Value Indicator Types</h3>
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
							<div id="gauge-4-1" style="margin: 0 30px;"></div>
						</div>
						<div class="col-sm-6">
							<div id="gauge-4-2" style="margin: 0 30px;"></div>
						</div>
					</div>
					<hr />
					<div class="row">
						<div class="col-sm-6">
							<div id="gauge-4-3" style="margin: 0 30px;"></div>
						</div>
						<div class="col-sm-6">
							<div id="gauge-4-4" style="margin: 0 30px;"></div>
						</div>
					</div>
					<hr />
					<h4 class="no-top-margin">Different Subvalue Indicator Types</h4>
					<div class="row">
						<div class="col-sm-12">
							<div id="gauge-5" style="margin: 0 30px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Angles Customization</h3>
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
							<div id="gauge-6-1" style="margin: 0 30px;"></div>
						</div>
						<div class="col-sm-6">
							<div id="gauge-6-2" style="margin: 0 30px;"></div>
						</div>
					</div>
					<hr />
					<div class="row">
						<div class="col-sm-6">
							<div id="gauge-6-3" style="margin: 0 30px;"></div>
						</div>
						<div class="col-sm-6">
							<div id="gauge-6-4" style="margin: 0 30px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<a href="charts-gauges-linear.aspx" class="btn btn-secondary  btn-icon btn-icon-standalone text-left">
		<i class="linecons-params"></i>
		<span>We have also included Linear Gauges, click here to view them
					&raquo;
				</span>
	</a>
	<br />
	<br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="_cphModalArea" runat="server">
</asp:Content>
