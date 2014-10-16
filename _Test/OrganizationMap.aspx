<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizationMap.aspx.cs" Inherits="demo.bananaframework.net._Test.OrganizationMap" %>

<%@ Register Assembly="OrganizationChart" Namespace="OrganizationChart" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<!-- Xenon -->
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic" />
	<link rel="stylesheet" href="/Common/Fonts/linecons/css/linecons.css" />
	<link rel="stylesheet" href="/Common/Fonts/fontawesome/css/font-awesome.min.css" />
	<link rel="stylesheet" href="/Common/Css/bootstrap.css" />
	<link rel="stylesheet" href="/Common/Css/xenon-core.css" />
	<link rel="stylesheet" href="/Common/Css/xenon-forms.css" />
	<link rel="stylesheet" href="/Common/Css/xenon-components.css" />
	<link rel="stylesheet" href="/Common/Css/xenon-skins.css" />
	<link rel="stylesheet" href="/Common/Css/custom.css" />

	<!-- OrganizationControl -->
	<link href="/Common/Scripts/primitives/primitives.latest.css" rel="stylesheet" />
	<link href="/Common/Scripts/primitives/ui-lightness/jquery-ui-1.10.2.custom.min.css" rel="stylesheet" />
	<style type="text/css">
		body { margin: 0; padding: 0; }
		#controlPanel { font-size: 12px; background-color: #eeeeee; width: 100%; height: 60px; }
		#controlPanel fieldset { margin: 5px; min-width: inherit; padding: 7px; float: left; height: 50px; border: solid 1px #8dc63f; line-height: inherit; }
		#controlPanel fieldset legend { font-size: inherit; display: inherit; width: inherit; margin-bottom: -5px; padding: 0px; color: inherit; border: 0; }
		#controlPanel fieldset div { margin: 0; }
		#controlPanel button i { margin-right: 5px; }
		::-webkit-input-placeholder { color: #808080; }
		:-moz-placeholder { color: #808080; opacity: 1; }
		::-moz-placeholder { color: #808080; opacity: 1; }
		:-ms-input-placeholder { color: #808080; }
	</style>
	<script src="/Common/Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="/Common/Scripts/primitives/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="/Common/Scripts/primitives/primitives.min.js?204"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#orgDiagram").width($(window).width() - 10);
			$("#orgDiagram").height($(window).height() - $("#controlPanel").height() - 10);

			//alert(primitives.common.OrientationType.Left);
			primitives.common.PageFitMode.fit

			// 조직도타입(추천)
			$("#orgType01").click(function () {
				$(this).addClass("disabled");
				$("#orgType02").removeClass("disabled");
			});
			// 조직도타입(후원)
			$("#orgType02").click(function () {
				$(this).addClass("disabled");
				$("#orgType01").removeClass("disabled");
			});

			// primitives.common.PageFitMode.None
			// 페이지 맞춤(없음-0)
			$("#pageFit01").click(function () {
				$(this).addClass("disabled");
				$("#pageFit02").removeClass("disabled");
				$("#pageFit03").removeClass("disabled");
				$("#pageFit04").removeClass("disabled");

				$("#PageFitMode").val(0);
				Update(jQuery("#orgDiagram"), primitives.common.UpdateMode.Refresh);
			});
			// primitives.common.PageFitMode.PageWidth
			// 페이지 맞춤(넓이-1)
			$("#pageFit02").click(function () {
				$(this).addClass("disabled");
				$("#pageFit01").removeClass("disabled");
				$("#pageFit03").removeClass("disabled");
				$("#pageFit04").removeClass("disabled");

				$("#PageFitMode").val(1);
				Update(jQuery("#orgDiagram"), primitives.common.UpdateMode.Refresh);
			});
			// primitives.common.PageFitMode.PageHeight
			// 페이지 맞춤(높이-2)
			$("#pageFit03").click(function () {
				$(this).addClass("disabled");
				$("#pageFit01").removeClass("disabled");
				$("#pageFit02").removeClass("disabled");
				$("#pageFit04").removeClass("disabled");

				$("#PageFitMode").val(2);
				Update(jQuery("#orgDiagram"), primitives.common.UpdateMode.Refresh);
			});
			// primitives.common.PageFitMode.FitToPage
			// 페이지 맞춤(페이지-3)
			$("#pageFit04").click(function () {
				$(this).addClass("disabled");
				$("#pageFit01").removeClass("disabled");
				$("#pageFit02").removeClass("disabled");
				$("#pageFit03").removeClass("disabled");

				$("#PageFitMode").val(3);
				Update(jQuery("#orgDiagram"), primitives.common.UpdateMode.Refresh);
			});

			// primitives.common.OrientationType.Top
			// 방향(상하-0)
			$("#direction01").click(function () {
				$(this).addClass("disabled");
				$("#direction02").removeClass("disabled");

				$("#OrientationType").val(0);
				Update(jQuery("#orgDiagram"), primitives.common.UpdateMode.Refresh);
			});
			// primitives.common.OrientationType.Left
			// 방향(좌우-2)
			$("#direction02").click(function () {
				$(this).addClass("disabled");
				$("#direction01").removeClass("disabled");

				$("#OrientationType").val(2);
				Update(jQuery("#orgDiagram"), primitives.common.UpdateMode.Refresh);
			});

			// primitives.common.ConnectorType.Squared
			// 연결선 종류(꺽은선-0)
			$("#lineType01").click(function () {
				$(this).addClass("disabled");
				$("#lineType02").removeClass("disabled");
				$("#lineType03").removeClass("disabled");

				$("#ConnectorType").val(0);
				Update(jQuery("#orgDiagram"), primitives.common.UpdateMode.Refresh);
			});
			// primitives.common.ConnectorType.Angular
			// 연결선 종류(직선-1)
			$("#lineType02").click(function () {
				$(this).addClass("disabled");
				$("#lineType01").removeClass("disabled");
				$("#lineType03").removeClass("disabled");

				$("#ConnectorType").val(1);
				Update(jQuery("#orgDiagram"), primitives.common.UpdateMode.Refresh);
			});
			// primitives.common.ConnectorType.Curved
			// 연결선 종류(곡선-2)
			$("#lineType03").click(function () {
				$(this).addClass("disabled");
				$("#lineType01").removeClass("disabled");
				$("#lineType02").removeClass("disabled");

				$("#ConnectorType").val(2);
				Update(jQuery("#orgDiagram"), primitives.common.UpdateMode.Refresh);
			});

			// primitives.common.GraphicsType.SVG
			// 그래픽(SVG-0)
			$("#graph01").click(function () {
				$(this).addClass("disabled");
				$("#graph02").removeClass("disabled");
				$("#graph03").removeClass("disabled");

				$("#GraphicsType").val(0);
				Update(jQuery("#orgDiagram"), primitives.common.UpdateMode.Refresh);
			});
			// primitives.common.GraphicsType.Canvas
			// 그래픽(Canvas-1)
			$("#graph02").click(function () {
				$(this).addClass("disabled");
				$("#graph01").removeClass("disabled");
				$("#graph03").removeClass("disabled");

				$("#GraphicsType").val(1);
				Update(jQuery("#orgDiagram"), primitives.common.UpdateMode.Refresh);
			});
			// primitives.common.GraphicsType.VML
			// 그래픽(VML-2)
			$("#graph03").click(function () {
				$(this).addClass("disabled");
				$("#graph01").removeClass("disabled");
				$("#graph02").removeClass("disabled");

				$("#GraphicsType").val(2);
				Update(jQuery("#orgDiagram"), primitives.common.UpdateMode.Refresh);
			});

			// 최상위
			$("#search01").click(function () {
				$("#orgDiagram").orgDiagram({ cursorItem: 0 });
				$("#orgDiagram").orgDiagram("update", primitives.common.UpdateMode.Refresh);
			});

			// 검색 텍스트박스
			$("#search02").keydown(function (event) {
				if (event.keyCode == 13) {
					$("#search03").click();
					event.preventDefault();
					return false;
				}
			});

			// 검색 버튼
			$("#search03").click(function () {
				if ($("#search02").val() == "") {
					alert("검색어를 입력하세요.");
					return;
				}

				var found = false;
				OrganizationChart.OrgDiagramClientControl.prototype.DataSet.forEach(function (entry) {
					if (entry.title.indexOf($("#search02").val()) > -1) {
						$("#orgDiagram").orgDiagram({ cursorItem: entry.index });
						$("#orgDiagram").orgDiagram("update", primitives.common.UpdateMode.Refresh);
						found = true;
						return;
					}
				});

				if (!found) {
					alert("검색 결과가 없습니다.");
				}
			});
		});

		function GetOrgDiagramConfig() {
			var graphicsType = parseInt($("#GraphicsType").val(), 10);
			var pageFitMode = parseInt($("#PageFitMode").val(), 10);
			var orientationType = parseInt($("#OrientationType").val(), 10);
			var minimalVisibility = 2;			// Dot
			var selectionPathMode = 1;			// FullStack
			var leavesPlacementType = 2;			// Horizontal
			var hasSelectorCheckbox = 2;			// False
			var hasButtons = 2;			// False
			var verticalAlignment = 1;			// Middle
			var horizontalAlignment = 0;			// Center
			var connectorType = parseInt($("#ConnectorType").val(), 10);
			var showLabels = 2;			// False
			var labelOrientation = 0;			// Horizontal
			var labelPlacement = 1;			// Top
			var color = "#c0c0c0";	// Silver
			var lineWidth = 1;
			var lineType = 0;			// Solid


			var minimizedItemCornerRadius = 4;
			minimizedItemCornerRadius = minimizedItemCornerRadius == -1 ? null : minimizedItemCornerRadius;

			var minimizedItemSize = 4;
			var highlightPadding = 2;

			var normalLevelShift = 20;
			var dotLevelShift = 20;
			var lineLevelShift = 10;
			var normalItemsInterval = 10;
			var dotItemsInterval = 2;
			var lineItemsInterval = 2;
			var cousinsIntervalMultiplier = 5;

			var buttons = [];
			buttons.push(new primitives.orgdiagram.ButtonConfig("delete", "ui-icon-close", "Delete"));
			buttons.push(new primitives.orgdiagram.ButtonConfig("properties", "ui-icon-gear", "Info"));
			buttons.push(new primitives.orgdiagram.ButtonConfig("add", "ui-icon-person", "Add"));

			var templates = [
				getContactTemplate(minimizedItemCornerRadius, minimizedItemSize, highlightPadding),
				getDefaultTemplate(minimizedItemCornerRadius, minimizedItemSize, highlightPadding)
			];

			return {
				graphicsType: graphicsType,
				pageFitMode: pageFitMode,
				orientationType: orientationType,
				verticalAlignment: verticalAlignment,
				horizontalAlignment: horizontalAlignment,
				connectorType: connectorType,
				minimalVisibility: minimalVisibility,
				hasSelectorCheckbox: hasSelectorCheckbox,
				selectionPathMode: selectionPathMode,
				leavesPlacementType: leavesPlacementType,
				hasButtons: hasButtons,
				buttons: buttons,
				templates: templates,
				//onButtonClick: onButtonClick,
				//onCursorChanging: onCursorChanging,
				//onCursorChanged: onCursorChanged,
				//onHighlightChanging: onHighlightChanging,
				//onHighlightChanged: onHighlightChanged,
				//onSelectionChanged: onSelectionChanged,
				onItemRender: onTemplateRender,
				itemTitleFirstFontColor: primitives.common.Colors.White,
				itemTitleSecondFontColor: primitives.common.Colors.White,
				showLabels: showLabels,
				labelOrientation: labelOrientation,
				labelPlacement: labelPlacement,
				labelOffset: 2,
				linesType: lineType,
				linesColor: color,
				linesWidth: lineWidth,
				defaultTemplateName: "defaultTemplate",
				normalLevelShift: normalLevelShift,
				dotLevelShift: dotLevelShift,
				lineLevelShift: lineLevelShift,
				normalItemsInterval: normalItemsInterval,
				dotItemsInterval: dotItemsInterval,
				lineItemsInterval: lineItemsInterval,
				cousinsIntervalMultiplier: cousinsIntervalMultiplier
			};
		}

		function getDefaultTemplate(minimizedItemCornerRadius, minimizedItemSize, highlightPadding) {
			var result = new primitives.orgdiagram.TemplateConfig();
			result.name = "defaultTemplate";

			// If we don;t change anything in template all its properties assigned to default values
			// So we change only default dot size and corner radius
			result.minimizedItemSize = new primitives.common.Size(minimizedItemSize, minimizedItemSize);
			result.minimizedItemCornerRadius = minimizedItemCornerRadius;
			result.highlightPadding = new primitives.common.Thickness(highlightPadding, highlightPadding, highlightPadding, highlightPadding);

			return result;
		}
		function getContactTemplate(minimizedItemCornerRadius, minimizedItemSize, highlightPadding) {
			var result = new primitives.orgdiagram.TemplateConfig();
			result.name = "UserTemplateContact";

			result.itemSize = new primitives.common.Size(220, 120);
			result.minimizedItemSize = new primitives.common.Size(minimizedItemSize, minimizedItemSize);
			result.minimizedItemCornerRadius = minimizedItemCornerRadius;
			result.highlightPadding = new primitives.common.Thickness(highlightPadding, highlightPadding, highlightPadding, highlightPadding);


			var itemTemplate = jQuery(
			  '<div class="bp-item bp-corner-all bt-item-frame">'
				+ '<div name="titleBackground" class="bp-item bp-corner-all bp-title-frame" style="top: 2px; left: 2px; width: 106px; height: 20px;">'
					+ '<div name="title" class="bp-item bp-title" style="top: 3px; left: 6px; width: 100px; height: 18px;">'
					+ '</div>'
				+ '</div>'
				//+ '<div class="bp-item bp-photo-frame" style="top: 26px; left: 2px; width: 50px; height: 60px;">'
				//	+ '<img name="photo" style="height=60px; width=50px;" />'
				//+ '</div>'
				+ '<div name="regdate" class="bp-item" style="top: 26px; left: 3px; width: 106px; height: 18px; font-size: 10px;"></div>'
				+ '<div name="recommend" class="bp-item" style="top: 44px; left: 3px; width: 106px; height: 18px; font-size: 10px;"></div>'
				+ '<div name="support" class="bp-item" style="top: 62px; left: 3px; width: 106px; height: 52px; font-size: 10px;"></div>'
			+ '</div>'
			).css({
				width: result.itemSize.width + "px",
				height: result.itemSize.height + "px"
			}).addClass("bp-item bp-corner-all bt-item-frame");
			result.itemTemplate = itemTemplate.wrap('<div>').parent().html();

			return result;
		}
		function Update(selector, updateMode) {
			selector.orgDiagram("option", GetOrgDiagramConfig());
			selector.orgDiagram("update", updateMode);

			ShowGraphicsType(selector.orgDiagram("option", "actualGraphicsType"));
		}

		function onTemplateRender(event, data) {
			switch (data.renderingMode) {
				case primitives.common.RenderingMode.Create:
					data.element.find("[name=email]").click(function (e) {
						/* Block mouse click propogation in order to avoid layout updates before server postback*/
						primitives.common.stopPropagation(e);
					});
					/* Initialize widgets here */
					break;
				case primitives.common.RenderingMode.Update:
					/* Update widgets here */
					break;
			}

			var itemConfig = data.context,
				itemTitleColor = itemConfig.itemTitleColor != null ? itemConfig.itemTitleColor : primitives.common.Colors.RoyalBlue;

			if (data.templateName == "UserTemplateContact") {
				data.element.find("[name=photo]").attr({ "src": itemConfig.image });
				data.element.find("[name=titleBackground]").css({ "background": itemConfig.itemTitleColor });
				data.element.find("[name=title]").css({ "color": primitives.common.highestContrast(itemConfig.itemTitleColor, "#000080", "#ffffff") });
				data.element.find("[name=regdate]").text(itemConfig.item["RegDate"]);
				data.element.find("[name=recommend]").text(itemConfig.item["Recommend"]);
				data.element.find("[name=support]").text(itemConfig.item["Support"]);
				data.element.find("[name=title]").text(itemConfig.item["Title"]);

				//data.element.find("[name=photo]").attr({ "src": itemConfig.image });
				//data.element.find("[name=titleBackground]").css({ "background": itemTitleColor });
				//data.element.find("[name=email]").attr({ "href": ("mailto:" + itemConfig.email + "?Subject=Hello%20world") });

				//var fields = ["title", "description", "phone", "email"];
				//for (var index = 0; index < fields.length; index += 1) {
				//    var field = fields[index];

				//    var element = data.element.find("[name=" + field + "]");
				//    if (element.text() != itemConfig[field]) {
				//        element.text(itemConfig[field]);
				//    }
				//}
			}
		}

		function onSelectionChanged(e, data) {
			var selectedItems = jQuery("#centerpanel").orgDiagram("option", "selectedItems");
			var message = "";
			for (var index = 0; index < selectedItems.length; index += 1) {
				var itemConfig = treeItems[selectedItems[index]];
				if (message != "") {
					message += ", ";
				}
				message += "<b>'" + itemConfig.title + "'</b>";
			}
			message += (data.parentItem != null ? " Parent item <b>'" + data.parentItem.title + "'" : "");
			jQuery("#southpanel").empty().append("User selected next items: " + message);
		}

		function onHighlightChanging(e, data) {
			var message = (data.context != null) ? "User is hovering mouse over item <b>'" + data.context.title + "'</b>." : "";
			message += (data.parentItem != null ? " Parent item <b>'" + data.parentItem.title + "'" : "");

			jQuery("#southpanel").empty().append(message);
		}

		function onHighlightChanged(e, data) {
			var message = (data.context != null) ? "User hovers mouse over item <b>'" + data.context.title + "'</b>." : "";
			message += (data.parentItem != null ? " Parent item <b>'" + data.parentItem.title + "'" : "");

			jQuery("#southpanel").empty().append(message);
		}

		function onCursorChanging(e, data) {
			var message = "User is clicking on item '" + data.context.title + "'.";
			message += (data.parentItem != null ? " Parent item <b>'" + data.parentItem.title + "'" : "");

			jQuery("#southpanel").empty().append(message);

			data.oldContext.templateName = null;
			data.context.templateName = "contactTemplate";
		}

		function onCursorChanged(e, data) {
			var message = "User clicked on item '" + data.context.title + "'.";
			message += (data.parentItem != null ? " Parent item <b>'" + data.parentItem.title + "'" : "");
			jQuery("#southpanel").empty().append(message);
		}

		function onButtonClick(e, data) {
			var message = "User clicked <b>'" + data.name + "'</b> button for item <b>'" + data.context.title + "'</b>.";
			message += (data.parentItem != null ? " Parent item <b>'" + data.parentItem.title + "'" : "");
			jQuery("#southpanel").empty().append(message);
		}
		function ShowGraphicsType(graphicsType) {
			var result = null;

			switch (graphicsType) {
				case primitives.common.GraphicsType.SVG:
					result = "SVG";
					break;
				case primitives.common.GraphicsType.Canvas:
					result = "Canvas";
					break;
				case primitives.common.GraphicsType.VML:
					result = "VML";
					break;
			}
			jQuery("#actualGraphicsType").empty().append("Graphics Type: " + result);
		}		function getCursorTemplate() {
			var result = new primitives.orgdiagram.TemplateConfig();
			result.name = "CursorTemplate";

			var cursorTemplate = jQuery("<div name='cursorBorder'></div>")
				.css({
					width: (result.itemSize.width + result.cursorPadding.left + result.cursorPadding.right) + "px",
					height: (result.itemSize.height + result.cursorPadding.top + result.cursorPadding.bottom) + "px",
					"border-width": result.cursorBorderWidth + "px",
					"border-style": "solid",
					"border-color": "#ff0000"
				}).addClass("bp-item bp-corner-all bp-cursor-frame");

			result.cursorTemplate = cursorTemplate.wrap('<div>').parent().html();

			return result;
		}

		function onCursorRender(event, data) {
			switch (data.renderingMode) {
				case primitives.common.RenderingMode.Create:
					break;
				case primitives.common.RenderingMode.Update:
					/* Update widgets here */
					break;
			}

			var itemConfig = data.context;

			if (data.templateName == "CursorTemplate") {
				var itemConfig = data.context;

				data.element.css({ "border-color": "red" });
				data.element.css({ "border-color": "red" });
				data.element.animate({ "border-color": "#eb8f00" }, 300, "swing",
					function () {
						data.element.css({ "border-color": "red" });
						data.element.animate({ "border-color": "#eb8f00" }, 300, "swing",
							function () {
								data.element.css({ "border-color": "red" });
								data.element.animate({ "border-color": "#eb8f00" }, 300);
							}
						);
					}
				);

			}
		}	</script>
</head>
<body style="background-color: #ffffff;">
	<form id="form1" runat="server">
	<input type="hidden" id="GraphicsType" value="0" />
	<input type="hidden" id="PageFitMode" value="0" />
	<input type="hidden" id="OrientationType" value="0" />
	<input type="hidden" id="ConnectorType" value="0" />
	<asp:ScriptManager ID="ScriptManager" runat="server">
	</asp:ScriptManager>
	<div id="controlPanel">
		<fieldset>
			<legend>조직도타입</legend>
			<div class="btn-group">
				<button type="button" id="orgType01" class="btn btn-info btn-xs disabled"><i class="fa-yelp"></i>추천</button>
				<button type="button" id="orgType02" class="btn btn-info btn-xs"><i class="fa-yelp"></i>후원</button>
			</div>
		</fieldset>
		<fieldset>
			<legend>페이지 맞춤</legend>
			<div class="btn-group">
				<button type="button" id="pageFit01" class="btn btn-purple btn-xs disabled"><i class="fa-circle-o"></i>없음</button>
				<button type="button" id="pageFit02" class="btn btn-purple btn-xs"><i class="fa-arrows-h"></i>넓이</button>
				<button type="button" id="pageFit03" class="btn btn-purple btn-xs"><i class="fa-arrows-v"></i>높이</button>
				<button type="button" id="pageFit04" class="btn btn-purple btn-xs"><i class="fa-file-o"></i>페이지</button>
			</div>
		</fieldset>
		<fieldset>
			<legend>방향</legend>
			<div class="btn-group">
				<button type="button" id="direction01" class="btn btn-warning btn-xs disabled"><i class="fa-hand-o-down"></i>상하</button>
				<button type="button" id="direction02" class="btn btn-warning btn-xs"><i class="fa-hand-o-right"></i>좌우</button>
			</div>
		</fieldset>
		<fieldset>
			<legend>연결선 종류</legend>
			<div class="btn-group">
				<button type="button" id="lineType01" class="btn btn-red btn-xs disabled"><i class="fa-level-down"></i>꺾은선</button>
				<button type="button" id="lineType02" class="btn btn-red btn-xs"><i class="fa-minus"></i>직선</button>
				<button type="button" id="lineType03" class="btn btn-red btn-xs"><i class="fa-code-fork"></i>곡선</button>
			</div>
		</fieldset>
		<fieldset>
			<legend>그래픽</legend>
			<div class="btn-group">
				<button type="button" id="graph01" class="btn btn-black btn-xs disabled"><i class="fa-hand-o-right"></i>SVG</button>
				<button type="button" id="graph02" class="btn btn-black btn-xs"><i class="fa-hand-o-right"></i>Canvas</button>
				<button type="button" id="graph03" class="btn btn-black btn-xs"><i class="fa-hand-o-right"></i>VML</button>
			</div>
		</fieldset>
		<fieldset>
			<legend>찾기</legend>
			<button type="button" id="search01" class="btn btn-danger btn-xs"><i class="fa-male"></i>최상위</button>
			<input type="text" id="search02" placeholder="성명으로 검색하세요." style="width: 150px; display: inline-block; margin-top: 0px; vertical-align: top; height: 22px;" />
			<button type="button" id="search03" class="btn btn-danger btn-xs"><i class="fa-search"></i>검색</button>
		</fieldset>
	</div>
	<cc1:OrgDiagramServerControl ID="orgDiagram" runat="server"
		BorderColor="#000066" BorderStyle="Solid" BorderWidth="1px" MaximumColumnsInMatrix="5" DotItemsInterval="10" DotLevelShift="10" ChildrenPlacementType="Horizontal" ShowButtons="False" ShowCheckBoxes="False" PageFitMode="None">
	</cc1:OrgDiagramServerControl>
	</form>
	<script type="text/javascript" src="/Common/Scripts/primitives/UserTemplates.js?1029"></script>
	<!-- Bottom Scripts -->
	<script src="/Common/Scripts/bootstrap.min.js"></script>
	<script src="/Common/Scripts/TweenMax.min.js"></script>
	<script src="/Common/Scripts/resizeable.js"></script>
	<script src="/Common/Scripts/joinable.js"></script>
	<script src="/Common/Scripts/xenon-api.js"></script>
	<script src="/Common/Scripts/xenon-toggles.js"></script>

	<!-- JavaScripts initializations and stuff -->
	<script src="/Common/Scripts/xenon-custom.js"></script>
</body>
</html>
