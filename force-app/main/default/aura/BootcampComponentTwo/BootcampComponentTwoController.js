({
	fireApplicationEvent : function(component, event, helper) {
        //Get the component event by usinf the name value from aura: registerEvent
		var cmpEvent = component.getEvent("BootcampComponentEvent");
        cmpEvent.setParams({
            "messsage" : "A component event fire me. " +
            "It all happend so fast. Now, I'm here"
        });
        cmpEvent.fire();
	}
})