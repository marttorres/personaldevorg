/**
 * Este archivo hace comunicación con la clase apex getColaboradores.apxc para intercambiar información con salesforce
 * <p></p>
 * @Giussepe Estrada, Martin Torres y Salvador Zamarron
 */
({
    /**	
     * Este método obtiene la información del colaborador para pasarlo al modal
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica el evento que sera manejado
     * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
     * @param idColaborador Hace referencia al Id del colaborador que se obtiene a partir de la página cargada
     */
	getListColaboradores : function(component, event, helper, idColaborador) {
		var action =component.get("c.getListColaboradores");
		action.setParams({
			"idColaborador" : idColaborador
		});
		action.setCallback(this, function(response) {
			var state = response.getState();
			if(state === "SUCCESS") {
				var listColaboradores = response.getReturnValue();
				component.set("v.objColaborador", listColaboradores);
			}
			else if(state === "ERROR") {
				var errors = response.getError();
				if(errors) {
					if(errors[0] && errors[0].message) {
					}
				} 
            }
		});
		$A.enqueueAction(action);
	},

    /* Este método manda la información ingresada por el usuario de los campos evitables del modal para actualizarla en el objeto y el Id de la cuenta y la oportunidad como los campos lookup llamando a los componentes objAccount y objOpportunity.
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica el evento que sera manejado
     * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
     */	
	updateColaborador: function(component, objColaborador) {
		var action = component.get("c.saveColaborador");
		action.setParams({
			"objColaborador" : objColaborador,
			"idAccount" : component.get("v.objAccount.Id"),
			"idOpportunity" : component.get("v.objOpportunity.Id")
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
                    title: 'Saved!',
                    type: 'success',
                    message: 'Collaborator has been saved. Successfully!'
                });
                toastEvent.fire();
			}
			else if(state === "ERROR") {
                if(response.getError().length != 0) {
                    var errors = response.getError()[0].message; 
                    
                    if(errors == "" || errors == null) {
                        errors = "Something went wrong updating Collaborator.";
                    }
                    
                    component.set("v.errorsMsg", errors);
                    component.set("v.errors", true);
                }  
			}
		});
		$A.enqueueAction(action);
	}
})