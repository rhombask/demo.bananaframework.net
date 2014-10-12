(function($, DX, undefined) {
    DX.framework.aspx.EmptyLayoutController = DX.framework.aspx.DefaultLayoutController.inherit({ctor: function(options) {
            options = options || {};
            options.name = options.name || "empty";
            this.callBase(options)
        }});
    var layoutSets = DX.framework.aspx.layoutSets;
    layoutSets["empty"] = layoutSets["empty"] || [];
    layoutSets["empty"].push({controller: new DX.framework.aspx.EmptyLayoutController})
})(jQuery, DevExpress);