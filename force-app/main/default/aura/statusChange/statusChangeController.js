({
	cancelBtn : function(component, event, helper) {
		var dismissActionPanel = $A.get("e.force:closeQuickAction");
		dismissActionPanel.fire();
	},
	doInit : function(component, event, helper) {
		var idColaborador = component.get("v.idColaborador");
		helper.getListColaboradores(component, event, helper, idColaborador);
	},
 	clickUpdateCol: function(component, event, helper) {
        var objColaborador = component.get("v.objColaborador");        
		helper.updateColaborador(component, objColaborador);
	},
})