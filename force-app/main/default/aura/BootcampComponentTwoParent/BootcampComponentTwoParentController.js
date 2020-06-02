({
	recogerResultadoEvento : function(component, event, helper) {
		var message = event.getParam("message");
        component.set("v.messageFromEvent", message);
        var numEventHandled = parseInt(component.get("v.numEvents")) + 1;
        component.set("v.numEvents", numEventHandled);
    }
})