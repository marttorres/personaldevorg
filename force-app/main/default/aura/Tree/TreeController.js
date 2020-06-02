({
    doInit: function (cmp, event, helper) {
        var action = cmp.get("c.getTreeData");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set('v.items', JSON.parse(response.getReturnValue()));
            }
            
        });
        $A.enqueueAction(action);
    }     
})