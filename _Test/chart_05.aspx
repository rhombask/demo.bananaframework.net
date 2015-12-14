﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Controllers/Xenon/VerticalMenu.master" AutoEventWireup="true" CodeBehind="chart_05.aspx.cs" Inherits="demo.bananaframework.net._Test.chart_05" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_cphHead" runat="server">
	<script src="/Common/Scripts/devexpress-web-14.1/js/globalize.min.js"></script>
	<script src="/Common/Scripts/devexpress-web-14.1/js/dx.chartjs.js"></script>
	<script src="/Common/Scripts/devexpress-web-14.1/js/vectormap-data/world.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			// #1
			var countries = {
				"Russia": { totalArea: 17.12, color: "#1E90FF" },
				"Canada": { totalArea: 9.98, color: "#B8860B" },
				"China": { totalArea: 9.59, color: "#BDB76B" },
				"United States": { totalArea: 9.52, color: "#FFA07A" },
				"Brazil": { totalArea: 8.51, color: "#3CB371" },
				"Australia": { totalArea: 7.69, color: "#D8BFD8" },
				"India": { totalArea: 3.29, color: "#DB7093" },
				"Argentina": { totalArea: 2.78, color: "#FFD700" },
				"Kazakhstan": { totalArea: 2.72, color: "#CD5C5C" },
				"Algeria": { totalArea: 2.38, color: "#B0C4DE" }
			};
			$("#map-1").dxVectorMap({
				mapData: DevExpress.viz.map.sources.world,
				bounds: [-180, 85, 180, -60],
				tooltip: {
					enabled: true,
					border: {
						visible: false
					},
					customizeTooltip: function (arg) {
						var name = arg.attribute("name"),
							country = countries[name];
						if (country) {
							return { text: name + ": " + country.totalArea + "M km&#178", color: country.color };
						}
					}
				},
				areaSettings: {
					click: function (arg) {
						if (countries[arg.attribute("name")]) {
							arg.selected(!arg.selected());
						}
					},
					customize: function (arg) {
						var country = countries[arg.attributes.name];
						if (country) {
							return {
								color: country.color,
								hoveredColor: "#e0e000",
								selectedColor: "#008f00"
							}
						}
					}
				}
			});
			// #2
			var markers = [
				{
					coordinates: [-0.1262, 51.5002],
					attributes: {
						name: 'London'
					}
				},
				{
					coordinates: [149.1286, -35.2820],
					attributes: {
						name: 'Canberra'
					}
				},
				{
					coordinates: [139.6823, 35.6785],
					attributes: {
						name: 'Tokyo'
					}
				},
				{
					coordinates: [-77.0241, 38.8921],
					attributes: {
						name: 'Washington'
					}
				},
				{
					coordinates: [-75.6794, 45.4214],
					attributes: {
						name: 'Ottawa'
					}
				},
				{
					coordinates: [37.617778, 55.751667],
					attributes: {
						name: 'Moscow'
					}
				},
				{
					coordinates: [116.4, 39.933333],
					attributes: {
						name: 'Beijing'
					}
				},
				{
					coordinates: [12.5, 41.9],
					attributes: {
						name: 'Rome'
					}
				},
				{
					coordinates: [23.716667, 38],
					attributes: {
						name: 'Athens'
					}
				},
				{
					coordinates: [2.333333, 48.833333],
					attributes: {
						name: 'Paris'
					}
				},
				{
					coordinates: [-3.683333, 40.4],
					attributes: {
						name: 'Madrid'
					}
				},
				{
					coordinates: [-47.866667, -15.798889],
					attributes: {
						name: 'Brasilia'
					}
				}
			];
			var vectorMap = $('#map-2').dxVectorMap({
				mapData: DevExpress.viz.map.sources.world,
				markers: markers,
				tooltip: {
					enabled: true,
					customizeTooltip: function (arg) {
						if (arg.type === 'marker') {
							return { text: arg.attribute('name') }
						}
					}
				},
				markerSettings: {
					click: function (marker) {
						vectorMap.center(marker.coordinates());
						vectorMap.zoomFactor(10);
					}
				},
				bounds: [-180, 85, 180, -60],
				areaSettings: {
					hoverEnabled: false
				}
			}).dxVectorMap("instance");
			$("#reset-map-2").click(function () {
				vectorMap.center(null).zoomFactor(1);
			});
			// #3
			var markers = [
				{
					coordinates: [-74, 40.7],
					text: 'New York City',
					value: 8406
				},
				{
					coordinates: [100.47, 13.75],
					text: 'Bangkok',
					value: 8281
				},
				{
					coordinates: [44.43, 33.33],
					text: 'Baghdad',
					value: 7181
				},
				{
					coordinates: [37.62, 55.75],
					text: 'Moscow',
					value: 12111
				},
				{
					coordinates: [121.5, 31.2],
					text: 'Shanghai',
					value: 24150
				},
				{
					coordinates: [-43.18, -22.9],
					text: 'Rio de Janeiro',
					value: 6429
				},
				{
					coordinates: [31.23, 30.05],
					text: 'Cairo',
					value: 8922
				},
				{
					coordinates: [28.95, 41],
					text: 'Istanbul',
					value: 14160
				},
				{
					coordinates: [127, 37.55],
					text: 'Seoul',
					value: 10388
				},
				{
					coordinates: [139.68, 35.68],
					text: 'Tokyo',
					value: 9071
				},
				{
					coordinates: [103.83, 1.28],
					text: 'Singapore',
					value: 5399
				},
				{
					coordinates: [30.3, 59.95],
					text: 'Saint Petersburg',
					value: 5131
				},
				{
					coordinates: [28.03, -26.2],
					text: 'Johannesburg',
					value: 4434
				},
				{
					coordinates: [144.95, -37.8],
					text: 'Melbourne',
					value: 4252
				}
			];
			$.each(markers, function (_, marker) {
				marker.attributes = {
					tooltip: '<b>' + marker.text + '</b>\n' + marker.value + 'K'
				};
				delete marker.text;
			});
			$('#map-3').dxVectorMap({
				mapData: DevExpress.viz.map.sources.world,
				markers: markers,
				areaSettings: {
					hoverEnabled: false
				},
				markerSettings: {
					type: 'bubble',
					minSize: 10,
					maxSize: 40
				},
				tooltip: {
					enabled: true,
					customizeTooltip: function (arg) {
						if (arg.type === 'marker') {
							return { text: arg.attribute('tooltip') };
						}
					}
				},
				bounds: [-180, 85, 180, -60]
			});
			// #4
			var names = ['Chrisian', 'Muslim', 'Unaffiliated', 'Buddhist', 'Jewish'];
			var markers = [
				{
					coordinates: [34.6, -5.1],
					values: [61.4, 35.2, 1.4, 0, 0],
					attributes: {
						country: 'Tanzania'
					}
				},
				{
					coordinates: [18.8, 15],
					values: [40.6, 55.3, 2.5, 0, 0],
					attributes: {
						country: 'Chad'
					}
				},
				{
					coordinates: [7.36, 9.97],
					values: [49.3, 48.8, 0.4, 0, 0],
					attributes: {
						country: 'Nigeria'
					}
				},
				{
					coordinates: [135.61, -24.57],
					values: [67.3, 2.4, 24.2, 2.7, 0.5],
					attributes: {
						country: 'Australia'
					}
				},
				{
					coordinates: [103.3, 34.85],
					values: [5.1, 1.8, 52.2, 18.2, 0],
					attributes: {
						country: 'China'
					}
				},
				{
					coordinates: [139.5, 37],
					values: [1.6, 0.2, 57, 36.2, 0],
					attributes: {
						country: 'Japan'
					}
				},
				{
					coordinates: [100.8, 15.9],
					values: [0.9, 5.5, 0.3, 93.2, 0],
					attributes: {
						country: 'Thailand'
					}
				},
				{
					coordinates: [10.4, 51.4],
					values: [68, 7, 5.8, 24.7, 0.3, 0.3],
					attributes: {
						country: 'Germany'
					}
				},
				{
					coordinates: [100.8, 65.3],
					values: [73.3, 10, 16.2, 0.1, 0.2],
					attributes: {
						country: 'Russia'
					}
				},
				{
					coordinates: [-3.48, 40.36],
					values: [78.6, 2.1, 19, 0, 0.1],
					attributes: {
						country: 'Spain'
					}
				},
				{
					coordinates: [-78.01, 21.72],
					values: [59.2, 0, 23, 0, 0],
					attributes: {
						country: 'Cuba'
					}
				},
				{
					coordinates: [-63.7, -31.92],
					values: [85.2, 1, 12.2, 0.05, 0.5],
					attributes: {
						country: 'Argentina'
					}
				},
				{
					coordinates: [-110.53, 60.78],
					values: [69, 2.1, 23.7, 0.5, 0.3],
					attributes: {
						country: 'Canada'
					}
				},
				{
					coordinates: [-100.1, 40.14],
					values: [78.3, 0.9, 16.4, 1.2, 1.8],
					attributes: {
						country: 'United States'
					}
				},
				{
					coordinates: [34.88, 31.16],
					values: [2, 18.6, 3.1, 0.3, 75.6],
					attributes: {
						country: 'Israel'
					}
				}
			];
			$.each(markers, function (_, marker) {
				var list = ['<b>' + marker.attributes.country + '</b>'];
				$.each(marker.values, function (i, value) {
					if (value > 0) {
						list.push(names[i] + ': ' + value + '%');
					}
				});
				marker.attributes.tooltip = list.join('\n');
			});
			$('#map-4').dxVectorMap({
				mapData: DevExpress.viz.map.sources.world,
				markers: markers,
				areaSettings: {
					hoverEnabled: false
				},
				markerSettings: {
					type: 'pie'
				},
				tooltip: {
					enabled: true,
					customizeTooltip: function (arg) {
						if (arg.type === 'marker') {
							return { text: arg.attribute('tooltip') };
						}
					}
				},
				bounds: [-180, 85, 180, -60]
			});
			// #5
			var viewportCoordinates = {
				all: null,
				NorthAmerica: [-180, 84.52, -22.11, -1.57],
				SouthAmerica: [-112.47, 14.26, -27.52, -57.44],
				Africa: [-29.34, 39.09, 55.60, -39.00],
				Europe: [-2.35, 70.91, 61.35, 35.84],
				Asia: [27.62, 83.11, 180, -19.36],
				Australia: [104.87, -6.61, 149.98, -45.87]
			};
			var vectorMap = $('#map-5').dxVectorMap({
				mapData: DevExpress.viz.map.sources.world,
				bounds: [-180, 85, 180, -60],
				zoomFactorChanged: function (zoomFactor) {
					$("#zoomFactor").val(zoomFactor.toFixed(2));
				},
				centerChanged: function (center) {
					$("#center").val(center[0].toFixed(3) + ", " + center[1].toFixed(3));
				}
			}).dxVectorMap("instance");
			$('#dropdownListSelector').change(function () {
				vectorMap.viewport(viewportCoordinates[this.value]);
			});
		});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_cphContent" runat="server">
	<div class="page-title">
		<div class="title-env">
			<h1 class="title">Map</h1>
			<p class="description">Interactive world map suitable for stats</p>
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
					<strong>Map Charts</strong>
				</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Map Chart</h3>
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
					<h4 class="no-top-margin">Colors Customization</h4>
					<div id="map-1" style="height: 440px; width: 100%;"></div>
				</div>
				<hr />
				<div class="panel-body">
					<h4 class="no-top-margin">Zooming and Centering</h4>
					<div id="map-2" style="height: 440px; width: 100%;"></div>
					<br />
					<button id="reset-map-2" class="btn btn-white">Reset Zoom</button>
				</div>
				<hr />
				<div class="panel-body">
					<h4 class="no-top-margin">Bubble Markers</h4>
					<div id="map-3" style="height: 440px; width: 100%;"></div>
				</div>
				<hr />
				<div class="panel-body">
					<h4 class="no-top-margin">Pie Markers</h4>
					<div id="map-4" style="height: 440px; width: 100%;"></div>
				</div>
				<hr />
				<div class="panel-body">
					<h4 class="no-top-margin">Dynamic Viewport</h4>
					<div id="map-5" style="height: 440px; width: 100%;"></div>
					<div style="margin-top: 10px">Choose a Continent:
							
						<select id="dropdownListSelector">
							<option value="all">All</option>
							<option value="NorthAmerica">North America</option>
							<option value="SouthAmerica">South America</option>
							<option value="Africa">Africa</option>
							<option value="Europe">Europe</option>
							<option value="Asia">Asia</option>
							<option value="Australia">Australia</option>
						</select>
						ZoomFactor:
							
						<input type="text" id="zoomFactor" readonly="readonly" />Center:
							
						<input type="text" id="center" readonly="readonly" />
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="_cphModalArea" runat="server">
</asp:Content>
