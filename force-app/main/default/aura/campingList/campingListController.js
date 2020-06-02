({    
    handleAddItem : function (component,event,helper){
        var action = component.get("c.saveItem");
        var Item = event.getParam("item");
        var lstItems = component.get("v.items");
        lstItems.push(Item);
        component.set("v.items",lstItems);
        action.setParams({"item":Item});
        action.setCallback(this,function(response){
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
                var campings = component.get("v.items");
                campings.push(response.getReturnValue());
                component.set("v.items", campings);
            }
        });
        $A.enqueueAction(action);   
    },
    doInit: function(component, event, helper) {
        var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
    
    /*,
    clickCreateItem: function(component, event, helper) {        
        var validItem = component.find('inputFormCamping').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        
        if(validItem){
            var newItem = component.get("v.newItem");
            helper.createItem(component, newItem);
            
          
            var myItems = component.get("v.items");
            var myNewItem = JSON.parse(JSON.stringify(newItem));            
            myItems.push(myNewItem);
            component.set("v.items", myItems);            
            component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c',
                                        'Name': '',
                                        'Quantity__c': 0,
                                        'Price__c': 0,
                                        'Packed__c': false });
        }
    }*/
})