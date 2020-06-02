({
	clickCreateItem : function(component, event, helper) {
		var validItem = component.find('inputFormCamping').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);        
        if(validItem){
            var newItem = component.get("v.newItem");
            helper.createItem(component, newItem);
        }
	}
})