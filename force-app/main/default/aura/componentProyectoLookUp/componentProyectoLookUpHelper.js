/**
* Este archivo administra y despliega la busqueda realizada en los inputs lookups
* <p></p>
* @Giussepe Estrada, Martin Torres y Salvador Zamarron
*/
({
/**
  * Este metodo retorna los records que hacen match con los de la base de datos de salesforce
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