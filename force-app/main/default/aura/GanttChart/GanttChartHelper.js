({
	helperMethod : function(component, event) {
		var action = component.get("c.getAccounts");

        // Create a callback that is executed after 
        // the server-side action returns
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                alert( "From  ser ver : " + response.getReturnValue());
            }
        });
        $A.enqueueAction(action); 
	}
})