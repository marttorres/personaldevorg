({
    createCamping: function(component, item) {
        var theitems = component.get("v.items");
 
        var newitem = JSON.parse(JSON.stringify(item));
 
        theitems.push(newitem);
        component.set("v.items", theitems);
        
        component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                    'Price__c': 0,'Packed__c': false });
    },
    createItem: function(component, camping) {
        
        var action = component.get("c.saveItem");
        action.setParams({
            "item": camping
        });
    	action.setCallback(this, function(response){
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            var campings = component.get("v.items");
            campings.push(response.getReturnValue());
            component.set("v.items", campings);
        }
    	});
    	$A.enqueueAction(action);
    }
})