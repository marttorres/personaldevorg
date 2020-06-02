/**
 * Este archivo contiene las funciones utilizadas por el componente componentLookUpResult
 * <p></p>
 * @ Martin Torres
 */
({
    /**
     * Esta función dispara el evento que envía la información del componente hijo al padre 
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica un evento que se ha de manejar
     * @param helper Hace referencia al helper, el cual contiene funciones que podrán ser reutilizadas
     */
    selectRecord : function(component, event, helper){    
        var getSelectRecord = component.get("v.oRecord");
        var compEvent = component.getEvent("oSelectedRecordEvent");
        compEvent.setParams({"recordByEvent" : getSelectRecord });  
        compEvent.fire();
    }
})