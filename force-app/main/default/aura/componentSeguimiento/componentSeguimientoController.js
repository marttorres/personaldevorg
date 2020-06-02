/**
 * Controlador del componente "Seguimiento"
 * <p /><p />
 * @author Martin Torres, Salvador Zamarrón y Giussep Estrada
 */
({
    /**
     * Este metodo inicializa el helper callHelperGetColaboradores
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica el evento que sera manejado
     * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
     */
    init: function (component, event, helper) {
        helper.callHelperGetPickList(component, event, helper, 'Capability__c');
        helper.callHelperGetPickList(component, event, helper, 'Empresa__c');
        
        // this function call on the component load first time 
        // Si no hay numero de pagina, toma el numero por defecto  
        
        var page = component.get("v.page") || 1;
        
        // get the select option (drop-down) values.   
        var recordToDisplay = component.find("recordSize").get("v.value");
        helper.callHelperGetColaboradores(component, event, helper, page, recordToDisplay);
    },
    
    getByCapability: function (component, event, helper) {
        var page = component.get("v.page") || 1;
      
        // get the select option (drop-down) values.   
        var recordToDisplay = component.find("recordSize").get("v.value");
        helper.callHelperGetColaboradores(component, event, helper, page, recordToDisplay);
    },
    
    /**
     * Este inicializa el helper callHelperAsignar
     *
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica el evento que sera manejado
     * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
     */
    asignar: function(component, event, helper) {
        helper.callHelperAsignar(component, event, helper);
    },
    
    navigate: function(component, event, helper) {
       // this function call on click on the previous page button  
       var page = component.get("v.page") || 1;
       // get the previous button label  
       var direction = event.getSource().get("v.label");
       // get the select option (drop-down) values.  
       var recordToDisplay = component.find("recordSize").get("v.value");
       // set the current page,(using ternary operator.)  
       page = direction === "Previous" ? (page - 1) : (page + 1);
       // call the helper function
       helper.callHelperGetColaboradores(component, event, helper, page, recordToDisplay);
   },
 
   onSelectChange: function(component, event, helper) {
      // this function call on the select opetion change,	 
      var page = 1
      var recordToDisplay = component.find("recordSize").get("v.value");
      helper.callHelperGetColaboradores(component, event, helper, page, recordToDisplay);
   }
})