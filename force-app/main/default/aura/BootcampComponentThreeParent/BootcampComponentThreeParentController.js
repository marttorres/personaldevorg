({
	recogerResultadoEvento : function(component, event, helper) {
		var message = event.getParam("message");
        //set the handler attributes basd on event data
        component.set("v.messageFromEvent", message);
        var numEventHandled = parseInt(component.get("v.numEvents")) + 1;
        component.set("v.numEvents", numEventHandled);
    }
})