({
	getAccounts : function(component) {
        var action = component.get("c.getAccounts");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.listAccounts", response.getReturnValue());
            }
        });
    	$A.enqueueAction(action);
	},
    
    getContacts : function(component, idAccount) {
        var action = component.get("c.getContacts");
        action.setParams({ paramAccountId : idAccount });        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.listContacts", response.getReturnValue());
            }
        });
    	$A.enqueueAction(action);
	}
})