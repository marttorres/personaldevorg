({
	updateColaborador: function(component, objColaborador) {
		var action = component.get("c.saveColaborador");
		action.setParams({
			"objColaborador" : objColaborador,
			"idAccount" : component.get("v.objAccount.Id"),
			
		});
		action.setCallback(this, function(response){
			var state = response.getState();
			if (state === "SUCCESS") {
				var returnValue = response.getReturnValue();
                
                
                if(response.getError().length != 0) {
                    var errors = response.getError()[0].message; 
                    component.set("v.errorsMsg", 'Something went wrong updating Collaborator.');
                    component.set("v.errors", true);
                } 
                
                component.set("v.errors", false);
                var dismissActionPanel = $A.get("e.force:closeQuickAction");
                dismissActionPanel.fire();
                $A.get('e.force:refreshView').fire();
                
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title: '¡Saved!',
                    type: 'success',
                    message: 'Updated Colaborator'
                });
                toastEvent.fire();
			}
			else if(state === "ERROR") {
                if(response.getError().length != 0) {
                    var errors = response.getError()[0].message; 
                    component.set("v.errorsMsg", 'Something went wrong updating Collaborator.');
                    component.set("v.errors", true);
                }  
			}
		});
		$A.enqueueAction(action);
	}
})