/**
 * Helper del componente "Seguimiento"
 * <p /><p />
 * @author Martin Torres, Salvador Zamarrón y Giussep Estrada
 */
({
    callHelperGetPickList: function(component, event, helper, picklistId) {
        var action = component.get("c.getPicklistOptions");
        action.setParams({
            "fieldName": picklistId,
            "sObjectName": 'Colaborador__c'
        });
        action.setCallback(this, function(response) {
            var responseState = response.getState();
            if (responseState == "SUCCESS") {
                var listOptions = response.getReturnValue();
                
                
        var listFinalOptions = [           
            {value: "", label: "All"}
        ];
        
                for (var i = 0; i < listOptions.length; i++) {
                    listFinalOptions.push({
                        label: listOptions[i],
                        value: listOptions[i]
                    });
                }
                  
               /* for(String strOption : listOptions) {
                    listFinalOptions.push({
                    	value: strOption,
                    	label: strOption
                    });
                }*/
                
               if(picklistId == "Capability__c") {
                    component.set("v.listCapability", listFinalOptions);
                } 
                if(picklistId == "Empresa__c") {
                    component.set("v.listEmpresa", listFinalOptions);
                }
                
            }
            else {
                console.log("Error al obtener la informacion del picklist.");
            }
        });
        $A.enqueueAction(action);
    },
    
    
    /**
     * Este metodo despliega una lista de colaboradores
     *
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica el evento que sera manejado
     * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
     */
    callHelperGetColaboradores: function(component, event, helper, page, recordToDisplay) {
        var strCapability = component.get("v.strCapability");
        
        if(strCapability == undefined || strCapability == '' || strCapability == null) {
            strCapability = '';
        }
        
        var action = component.get("c.getListColaboradores");
        action.setParams({
            
         "pageNumber": page,
         "recordToDisplay": recordToDisplay,
            "strCapability" : strCapability
        });
        action.setCallback(this, function(response) {
            var responseState = response.getState();
            if (responseState == "SUCCESS") {
                var listColaboradores = response.getReturnValue();
         component.set("v.page", listColaboradores.page);
         component.set("v.total", listColaboradores.total);
         component.set("v.pages", Math.ceil(listColaboradores.total / recordToDisplay));
                component.set("v.listColaboradores", listColaboradores.listColaboradores);
            }
            else {
                console.log("Error al obtener la informacion de Colaborador__c");
            }
        });
        $A.enqueueAction(action);
    },
    
    /**
     * Este metodo asigna un colaborador a un proyecto
     *
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica el evento que sera manejado
     * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
     */
    callHelperAsignar : function(component, event, helper) {
        var cTarget = event.currentTarget;
        var idColaboradorSeleccionado = cTarget.dataset.value;
        var action = component.get("c.asignarColaborador");
        action.setParams({
            "idColaborador" : idColaboradorSeleccionado
        });
        action.setCallback(this, function(response) {
            var responseState = response.getState();
            if (responseState == "SUCCESS") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title: 'Se ha asignado el colaborador al proyecto',
                    type: 'success',
                    message: 'El colaborador ha sido asignado'
                });
                toastEvent.fire();
                helper.callHelperGetColaboradores(component, event, helper);
            }
            else {
                if(response.getError().length != 0) {
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                         title: '¡Atención!',
                         type: 'error',
                         message: 'El proyecto ya cuenta con las asignaciones requeridas'
                    });
                    toastEvent.fire();
                }    
            }
        });
        $A.enqueueAction(action);
    }
})