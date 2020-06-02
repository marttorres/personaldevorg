({
	fireApplicationEvent : function(component, event, helper) {
        //Get the aplication event by using the e.<namespace>.<event> syntax.
        var cmpEvent = $A.get("e.c:BootcampComponentEventApp");
        cmpEvent.setParams({
            "messsage" : "A component event fire me. " +
            "It all happend so fast. Now, I'm here"
        });
        cmpEvent.fire();
	}
})