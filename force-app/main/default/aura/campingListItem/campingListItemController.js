({
    packItem: function(component, event, helper) {
        var boton= event.getSource();
		var valor =boton.get("v.label");
        component.set("v.item",valor);
        var btnClicked = event.getSource();
        btnClicked.set("v.disabled",true);
    }
})