(function($, DX, undefined) {
    var layoutSets = DX.framework.aspx.layoutSets;
    layoutSets["desktop"] = layoutSets["desktop"] || [];
    layoutSets["desktop"].push({
        platform: "generic",
        controller: new DX.framework.aspx.DefaultLayoutController({
            name: "desktop",
            disableViewLoadingState: true
        })
    })
})(jQuery, DevExpress);