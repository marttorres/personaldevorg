/**
 * Este archivo contiene la definición de las funciones que son invocadas en el controller del componente actual
 * <p></p>
 * @ Martin Torres
 */
({
   /**
     * Esta función busca y retorna los records que coincidan con los parametros 
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica el evento que sera manejado
     * @param getInputkeyWord Indica las palabras ingresada por el usuario en el lookup field
     * @param strIdObjetoPadre Indica el Id del objeto master si asi fuese el caso
     */
    searchHelper : function(component, event, getInputkeyWord, strIdObjetoPadre) {
        var action = component.get("c.fetchLookUpValues");
        action.setParams({
            'strSearchKeyWord' : getInputkeyWord,
            'strAPINameObjecto' : component.get("v.strAPINameObjecto"),
            'strIdObjetoPadre' : strIdObjetoPadre 
        });    
        action.setCallback(this, function(response) {
            $A.util.removeClass(component.find("iconoCargando"), "slds-show");
            var state = response.getState();            
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue(); 
                if (storeResponse.length == 0) {
                    component.set("v.strResultadoNombreAccount", 'No hay resultados...');
                } else {
                    component.set("v.strResultadoNombreAccount", '');
                }
                component.set("v.listOfSearchRecords", storeResponse);
            }
        }); 
        $A.enqueueAction(action);
    }
})