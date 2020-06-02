/**
 * Este archivo contiene la definición de las funciones que son invocadas en el controller del componente actual
 * <p></p>
 * @ Martin Torres
 */
({
    /**
     * Esta función retorna un listado de las viviendas existentes en la BD
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    callHelperListado : function(component, event, helper) {
        var action = component.get("c.listarViviendas");   
        action.setCallback(this, function(response) {
            var strState = response.getState();
            if (strState === "SUCCESS") {
                var listViviendas = response.getReturnValue();
                console.log(listViviendas);
                component.set("v.listViviendas", listViviendas);
            } else {
                console.log('Error al recuperar las viviendas de la BD.');
            }
        }); 
        $A.enqueueAction(action);
	},
    
    /**
     * Esta función almacena un objeto vivienda en la BD
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
	callHelperGuardado : function(component, event, helper) {
        var action = component.get("c.guardarVivienda");        
        action.setParams({
            'objVivienda' : component.get("v.objVivienda")
        });    
        action.setCallback(this, function(response) {
            var strState = response.getState();            
            if (strState === "SUCCESS") {
                component.set("v.isOpen", false);
                component.set("v.objVivienda", {'sobjectType' : 'Vivienda__c',
                                                'strDireccion__c' : '',
                                                'currCostoCasa__c' : '',
                                                'Color__c' : '',
                                                'Tamanio__c' : '',
                                                'numVentanas__c' : '',
                                                'chkboxPatio__c' : false});
            } else {
                component.set("v.isOpen", false);
                component.set("v.objVivienda", {'sobjectType' : 'Vivienda__c',
                                                'strDireccion__c' : '',
                                                'currCostoCasa__c' : '',
                                                'Color__c' : '',
                                                'Tamanio__c' : '',
                                                'numVentanas__c' : '',
                                                'chkboxPatio__c' : false});
                console.log('Error al guardar la vivienda en la BD.');
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
        var tamanio = component.get("v.objVivienda.Tamanio__c");
        var currCostoCasa = component.get("v.objVivienda.currCostoCasa__c");        
        if(tamanio == undefined || currCostoCasa == undefined) {
            component.set("v.errors", true);
        } else {
            if(tamanio.length > 0 && currCostoCasa > 0) {
                component.set("v.errors", false);
            } else {
                component.set("v.errors", true);
            }
        }
	}
})