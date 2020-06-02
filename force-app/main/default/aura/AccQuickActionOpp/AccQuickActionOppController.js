/**
 * Este archivo cumple con diferentes funciones que contiene el modal desplegado a partir del botón “colocar” o cierra la ventana mediante el botón “cancelar”
 * <p></p>
 * @Giussepe Estrada, Martin Torres y Salvador Zamarron
 */
({
    /**
     * Este metodo obtiene el Id del colaborador al entrar a su información desde Salesforce para ser mostrada en el modal (sección de datos no editables)
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica el evento que sera manejado
     * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
     */
	doInit : function(component, event, helper) {
		var idColaborador = component.get("v.idColaborador");
		helper.getListColaboradores(component, event, helper, idColaborador);
	},
	
    /* Este metodo es ejecutado mediante un botón para cerrar el modal y no guardar cambios
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica el evento que sera manejado
     * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
     */
	cancelBtn : function(component, event, helper) {
		var dismissActionPanel = $A.get("e.force:closeQuickAction");
		dismissActionPanel.fire();
	},

    /* Este metodo dispara un evento cuando el usuario de clic en el botón de colocar para comenzar el proceso de actualización de información.
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica el evento que sera manejado
     * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
     */
	clickUpdateCol: function(component, event, helper) {
        var objColaborador = component.get("v.objColaborador");
        
		helper.updateColaborador(component, objColaborador);
	},

    /* Este método borra cualquier valor ingresado por el usuario para forzarlo a seleccionar una fecha con el cuadro interactivo desplegado.
     * 
     * @param component Indica el componente al que el controlador pertenece
     * @param event Indica el evento que sera manejado
     * @param helper Hace referencia al helper, el cual contiene funcione que podran ser reutilizadas
     */
	nullify : function(component, event, helper) {
		var startDate = component.find('startdate');
		var closeDate = component.find('closedate');
		startDate.set('v.value', '');
		closeDate.set('v.value', '');
	}
})