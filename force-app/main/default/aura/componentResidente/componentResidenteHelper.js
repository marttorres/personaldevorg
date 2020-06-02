/**
 * Este archivo contiene la definición de las funciones que son invocadas en el controller del componente actual
 * <p></p>
 * @ Martin Torres
 */
({
    /**
     * Esta función retorna un listado de los residentes existentes en la BD
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
	callHelperListado : function(component, event, helper) {
        var action = component.get("c.listarResidentes");   
        action.setCallback(this, function(response) {
            var strState = response.getState();
            if (strState === "SUCCESS") {
                var listResidentes = response.getReturnValue();
                console.log(listResidentes);
                component.set("v.listResidentes", listResidentes);
            } else {
                console.log('Error al recuperar los residentes de la BD.');
            }
        }); 
        $A.enqueueAction(action);
	},
    
    /**
     * Esta inserta un objeto residente en la BD
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
	callHelperGuardado : function(component, event, helper) {
        var action = component.get("c.guardarResidentes");        
        action.setParams({
            'objResidente' : component.get("v.objResidente"),
            'idVivienda' : component.get("v.objViviendaSeleccionada.Id")
        });    
        action.setCallback(this, function(response) {
            var strState = response.getState();            
            if (strState === "SUCCESS") {
                component.set("v.objResidente", {'sobjectType' : 'Residente__c',
                                        'Name' : '',
                                        'numEdad__c' : 18,        
                                        'currSalario__c': 50,
                                        'Sexo__c': ''});
            } else {
                console.log('Error al guardar al residente en la BD.');
                component.set("v.objResidente", {'sobjectType' : 'Residente__c',
                                        'Name' : '',
                                        'numEdad__c' : 18,        
                                        'currSalario__c': 50,
                                        'Sexo__c': ''});
            }
        }); 
        $A.enqueueAction(action);
	},

    /**
     * Esta función actualiza la información de un objeto residente en la BD
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     * @param idResidente Almacena el Id del objeto residente que será actualizado
     */
	callHelperSetResidente : function(component, event, helper, idResidente) {
    	var action = component.get("c.listarResidente"); 
        action.setParams({
            'idResidente' : idResidente
        });
        action.setCallback(this, function(response) {
            var strState = response.getState();
            if (strState === "SUCCESS") {
                var objResidente = response.getReturnValue();
                component.set("v.objResidente", objResidente);
            } else {
                console.log('Error al actualizar el residente en la BD.');
            }
        }); 
        $A.enqueueAction(action);
	},

    /**
     * Esta función valida que los datos insertados por el usuario en el formulario sean los correctos
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    callHelperValidar : function(component, event, helper) {
        var strName = component.get("v.objResidente.Name");
        var numEdad = component.get("v.objResidente.numEdad__c");
        var currSalario = component.get("v.objResidente.currSalario__c");
        
        if(strName == undefined || numEdad == undefined || currSalario == undefined) {
            component.set("v.errors", true);
        } else {
            if(strName.length > 0 && numEdad > 0 && currSalario > 0) {
                component.set("v.errors", false);
            } else {
                component.set("v.errors", true);
            }
        }
	}
})