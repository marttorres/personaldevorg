({
	

	myAction : function(component, event, helper) {
		var action = component.get("c.getAccounts");
		debugger;
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {

				var listAccounts = response.getReturnValue();

				var relationAccountsContactActual = component.get("v.relationAccountsContact");
				

				for(var i = 0; i < listAccounts.length; i++) { 
					var contacts = [];
					var temp = { "key": listAccounts[i], "list": contacts };
					relationAccountsContactActual.push(temp);
					
					
				}	
				component.set("v.relationAccountsContact",  relationAccountsContactActual);
				console.log(JSON.stringify(relationAccountsContactActual));

				var reRender = true;
				component.set("v.isRendered", reRender);
            }
		});
		
        $A.enqueueAction(action);
	},


	contactos : function(component, event, helper) {
		debugger; 
		var cTarget = event.currentTarget;
        var idAccountSelected = cTarget.dataset.value;
        var action = component.get("c.getContacts");
        action.setParams({
            "idAccount" : idAccountSelected
        });
        action.setCallback(this, function(response) {
			var state = response.getState();
            if (state === "SUCCESS") {
				var listContacts = response.getReturnValue();

		
				var relationAccountsContactActual = component.get("v.relationAccountsContact");

				for(var i = 0; i < relationAccountsContactActual.length; i++) { 
					if(relationAccountsContactActual[i].key.Id == idAccountSelected) {
						relationAccountsContactActual[i].list = listContacts;
					}			
					
				}	

				component.set("v.relationAccountsContact",relationAccountsContactActual);

				var reRender = false;
				component.set("v.isRendered", reRender);			
				var reRender = true;
				component.set("v.isRendered", reRender);
            }
			
        });
        $A.enqueueAction(action);
    }
})