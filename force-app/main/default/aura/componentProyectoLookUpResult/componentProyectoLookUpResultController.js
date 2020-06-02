/**
* Este archivo genera el evento que dispara el record seleccionado
* <p></p>
* @Giussepe Estrada, Martin Torres y Salvador Zamarron
*/
({
  selectRecord : function(component, event, helper) {
	var getSelectRecord = component.get("v.oRecord");
	var compEvent = component.getEvent("oSelectedRecordEvent");
	compEvent.setParams({"recordByEvent" : getSelectRecord});
	compEvent.fire();
  }
})