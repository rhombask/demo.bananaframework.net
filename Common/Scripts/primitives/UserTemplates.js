/**
 * Basic Primitives ASP.NET BPOrgDiagram
 *
 * (c) Basic Primitives Inc
 *
 *
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 */

Type.registerNamespace("OrganizationChart");

OrganizationChart.UserTemplates = {};

OrganizationChart.UserTemplates["UserTemplateContact"] = {
	getTemplate: function () {
		var result = new primitives.orgdiagram.TemplateConfig(),
			itemTemplate;
		result.name = "UserTemplateContact";
		result.itemSize = new primitives.common.Size(110, 80);
		result.minimizedItemSize = new primitives.common.Size(4, 4);
		result.highlightPadding = new primitives.common.Thickness(2, 2, 2, 2);


		itemTemplate = jQuery(
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
		});
		result.itemTemplate = itemTemplate.wrap('<div>').parent().html();

		return result;
	},
	onRender: function (event, data, config) {
		var itemConfig = data.context;

		switch (data.renderingMode) {
			case primitives.common.RenderingMode.Create:
				/* Initialize widgets here */
				break;
			case primitives.common.RenderingMode.Update:
				/* Update widgets here */
				break;
		}

		data.element.find("[name=photo]").attr({ "src": itemConfig.image });
		data.element.find("[name=titleBackground]").css({ "background": itemConfig.itemTitleColor });
		data.element.find("[name=title]").css({ "color": primitives.common.highestContrast(itemConfig.itemTitleColor, config.itemTitleSecondFontColor, config.itemTitleFirstFontColor) });
		data.element.find("[name=regdate]").text(itemConfig.item["RegDate"]);
		data.element.find("[name=recommend]").text(itemConfig.item["Recommend"]);
		data.element.find("[name=support]").text(itemConfig.item["Support"]);
		data.element.find("[name=title]").text(itemConfig.item["Title"]);
	}
};
