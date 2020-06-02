/**
 * Este archivo contiene las funciones utilizadas por el componente componentLookUp
 * <p></p>
 * @ Martin Torres
 */
({  
    /**
     * Esta función retorna 5 records por defecto al accionar el evento onfocus sobre los inputs LookUp
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    onfocus : function(component, event, helper) {
        var forOpen = component.find("searchRes");
        var getInputkeyWord = '';
        var strIdObjetoPadre = component.get("v.strIdObjetoPadre");
                
        $A.util.addClass(component.find("iconoCargando"), "slds-show");
        $A.util.addClass(forOpen, 'slds-is-open');
        $A.util.removeClass(forOpen, 'slds-is-close');
        
        helper.searchHelper(component, event, getInputkeyWord, strIdObjetoPadre);
    },

    /**
     * Esta función es activada cuando se efectua el evento onblur sobre los inputs LookUp
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    onblur : function(component, event, helper) {     
        var forclose = component.find("searchRes");  
        
        component.set("v.listOfSearchRecords", null);
        $A.util.addClass(forclose, 'slds-is-close');
        $A.util.removeClass(forclose, 'slds-is-open');
    },

   /**
     * Esta función retorna los records que coincidan con lo ingresado en los inputs LookUp por el usuario
     *  
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */   
    keyPressController : function(component, event, helper) {
        var getInputkeyWord = component.get("v.strSearchKeyWord");
        var strIdObjetoPadre = component.get("v.strIdObjetoPadre"); 
        
        if(getInputkeyWord.length > 0) {
            var forOpen = component.find("searchRes");
            
            $A.util.addClass(forOpen, 'slds-is-open');
            $A.util.removeClass(forOpen, 'slds-is-close');
            
            helper.searchHelper(component, event, getInputkeyWord, strIdObjetoPadre);
        } else {              
            var forclose = component.find("searchRes");
            
            component.set("v.listOfSearchRecords", null ); 
            $A.util.addClass(forclose, 'slds-is-close');
            $A.util.removeClass(forclose, 'slds-is-open');
        }
    },
    
   /**
     * Esta función inicializa los valores de las variables involucradas en el resultado final
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    clear : function(component, event, helper) {
        var pillTarget = component.find("lookup-pill");
        var lookUpTarget = component.find("lookupField"); 
        
        $A.util.addClass(pillTarget, 'slds-hide');
        $A.util.removeClass(pillTarget, 'slds-show');
        $A.util.addClass(lookUpTarget, 'slds-show');
        $A.util.removeClass(lookUpTarget, 'slds-hide');
        component.set("v.strSearchKeyWord", null);
        component.set("v.listOfSearchRecords", null);
        component.set("v.objObjetoSeleccionado", {});   
    },
    
   /**
     * Esta función se ejecuta cuando el componente componentLookUp dispara su evento
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */  
    handleComponentEvent : function(component, event, helper) { 
        var selectedAccountGetFromEvent = event.getParam("recordByEvent");
        var forclose = component.find("lookup-pill");
        
        component.set("v.objObjetoSeleccionado" , selectedAccountGetFromEvent); 
        $A.util.addClass(forclose, 'slds-show');
        $A.util.removeClass(forclose, 'slds-hide');
        
        var forclose = component.find("searchRes");
        
        $A.util.addClass(forclose, 'slds-is-close');
        $A.util.removeClass(forclose, 'slds-is-open');
        
        var lookUpTarget = component.find("lookupField");
        
        $A.util.addClass(lookUpTarget, 'slds-hide');
        $A.util.removeClass(lookUpTarget, 'slds-show');  
    },
    
    /**
     * Esta función dispara un evento para que envie la variable que hará que se visualice un modal
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    mostrarModal : function(component, event, helper) { 
        var componentEvent = component.getEvent("reRenderEvt");
        componentEvent.setParams({"reRenderModal" : false});  
        componentEvent.fire();
    }
})