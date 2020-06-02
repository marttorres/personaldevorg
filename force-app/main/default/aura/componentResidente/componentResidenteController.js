/**
 * Este archivo contiene las funciones utilizadas por el componente componentResidente
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
        var listSexos = [            
            {value: "Hombre", label: "Hombre"},
            {value: "Mujer", label: "Mujer"}
        ];      
        
        component.set("v.listSexos", listSexos);
        
        helper.callHelperListado(component, event, helper);
    },    
    
    /**
     * Esta función invoca las funciones localizadas en el helper para guardar un residente en la BD
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    registrarResidente : function(component, event, helper) { 
        helper.callHelperValidar(component, event, helper);
        
        var errores = component.get("v.errors");
        
        if(errores == false) {
            helper.callHelperGuardado(component, event, helper);
            helper.callHelperListado(component, event, helper);
        }
    },

    /**
     * Esta función inicializa los valores del formulario
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    limpiarFormulario : function(component, event, helper) {
        component.set("v.objResidente", {'sobjectType' : 'Residente__c',
                                         'Name' : '',
                                         'numEdad__c' : 18,        
                                         'currSalario__c': 50,
                                         'Sexo__c': ''});
    },
    
    /**
     * Esta función establece en true el reRender del modal para que sea visualizado
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    openModalAddItem : function(component, event, helper) { 
        component.set("v.isOpen", true);
    },

    /**
     * Esta función invoca a la funcuión callHelperSetResidente en el helper para actualizar a un residente en la BD
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    actualizarResidente : function(component, event, helper) { 
        var cTarget = event.currentTarget;
        var idResidente = cTarget.dataset.value;
        
        helper.callHelperSetResidente(component, event, helper, idResidente);
    }
})