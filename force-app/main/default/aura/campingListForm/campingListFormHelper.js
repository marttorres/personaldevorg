({
    createItem : function(component, newItem) {
        var addItem = component.getEvent("addItem");
        addItem.setParams({ "item": newItem });
        addItem.fire();
        component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c',
                        'Name': '',
                        'Quantity__c': 0,
                        'Price__c': 0,
                        'Packed__c': false });        
    }
})