/**
 * Este archivo contiene las funciones utilizadas por el componente componentVivienda
 * <p></p>
 * @ Martin Torres
 */
({
    /**
     * Esta función inicializa los picklist fields e invoca la función de listado localizado en el helper
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    loadAttributes : function(component, event, helper) {
        var listColores = [            
            {value: "Azul", label: "Azul"},
            {value: "Amarilla", label: "Amarilla"},
            {value: "Roja", label: "Roja"},
            {value: "Marfil", label: "Marfil"},
            {value: "Crema", label: "Crema"}
         ];      
        var listTamanios = [            
            {value: "Pequenia", label: "Pequenia"},
            {value: "Mediana", label: "Mediana"},
            {value: "Grande", label: "Grande"}
         ];
        
        component.set("v.listColores", listColores);
        component.set("v.listTamanios", listTamanios);
        
        helper.callHelperListado(component, event, helper);
    },

    /**
     * Esta función invoca las funciones localizadas en el helper para guardar un objeto vivienda en la BD
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    registrarVivienda : function(component, event, helper) { 
        helper.callHelperValidar(component, event, helper);
        var errores = component.get("v.errors");
        if(errores == false) {
            helper.callHelperGuardado(component, event, helper);
        }
    },
   
    /**
     * Esta función invoca a una función localizada en el helper para actualizar un objeto vivienda en la BD
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    actualizarVivienda : function(component, event, helper) { 
        var cTarget = event.currentTarget;
        component.set("v.objVivienda", cTarget.dataset.value);
        component.set("v.reRenderForm", false);
        component.set("v.reRenderForm", true);
    },

    /**
     * Esta función modifica el valor del reRender en false e inicializa el objeto
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    cerrarModal : function(component, event, helper) {  
        component.set("v.isOpen", false);        
        component.set("v.objVivienda", {'sobjectType' : 'Vivienda__c',
                                        'strDireccion__c' : '',
                                        'currCostoCasa' : '',        
                                        'Color__c': '',
                                        'Tamanio__c': '',                                                
                                        'numVentanas__c': '',
                                        'chkboxPatio__c': false});
    }
})