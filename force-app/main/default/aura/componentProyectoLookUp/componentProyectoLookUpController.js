/**
* Este archivo administra y despliega la busqueda realizada en los inputs lookups
* <p></p>
* @Giussepe Estrada, Martin Torres y Salvador Zamarron
*/
({
/**
  * Este metodo se ejecuta con el estado onfocus del lookup
  * 
  * @param component Indica el componente al que el controlador pertenece
  * @param event Indica el evento que sera manejado
  * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
  */
  onfocus : function(component, event, helper){
	var forOpen = component.find("searchRes");
	var getInputkeyWord = '';
	var strIdObjetoPadre = component.get("v.strIdObjetoPadre");
		
	$A.util.addClass(component.find("iconoCargando"), "slds-show");
	$A.util.addClass(forOpen, 'slds-is-open');
	$A.util.removeClass(forOpen, 'slds-is-close');
	
	helper.searchHelper(component, event, getInputkeyWord, strIdObjetoPadre);
  },

/**
  * Este metodo se ejecuta con el estado onblur del lookup
  * 
  * @param component Indica el componente al que el controlador pertenece
  * @param event Indica el evento que sera manejado
  * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
  */
  onblur : function(component, event, helper){
	var forclose = component.find("searchRes");
	
	component.set("v.listOfSearchRecords", null);
	$A.util.addClass(forclose, 'slds-is-close');
	$A.util.removeClass(forclose, 'slds-is-open');
  },

/**
  * Este metodo se ejecuta cuando el usuario presiona una tecla
  * 
  * @param component Indica el componente al que el controlador pertenece
  * @param event Indica el evento que sera manejado
  * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
  */  
  keyPressController : function(component, event, helper) {
	var getInputkeyWord = component.get("v.strSearchKeyWord");
	var strIdObjetoPadre = component.get("v.strIdObjetoPadre");
	
	if(getInputkeyWord.length > 0){
	  var forOpen = component.find("searchRes");
	  
	  $A.util.addClass(forOpen, 'slds-is-open');
	  $A.util.removeClass(forOpen, 'slds-is-close');
	  
	  helper.searchHelper(component, event, getInputkeyWord, strIdObjetoPadre);
	} else{		
	  var forclose = component.find("searchRes");
	  
	  component.set("v.listOfSearchRecords", null );
	  $A.util.addClass(forclose, 'slds-is-close');
	  $A.util.removeClass(forclose, 'slds-is-open');
	}
  },
  
/**
  * Este metodo inicializa los valores del record seleccionado
  * 
  * @param component Indica el componente al que el controlador pertenece
  * @param event Indica el evento que sera manejado
  * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
  */
  clear : function(component, event, helper){
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
  * Este metodo es llamado cuando el usuario selecciona un record del lookup
  * 
  * @param component Indica el componente al que el controlador pertenece
  * @param event Indica el evento que sera manejado
  * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
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
  }
})