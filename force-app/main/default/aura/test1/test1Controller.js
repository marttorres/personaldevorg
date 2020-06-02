({
	myAction : function(component, event, helper) {
		var getInput = component.get("v.input");
        component.set("v.output",getInput);
	}
})