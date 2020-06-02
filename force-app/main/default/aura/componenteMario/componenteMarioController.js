({
    init: function (component, event, helper) {
        helper.getMovieData(component, event, helper);
    },
    
    getSelectedName: function (cmp, event) {
        var selectedRows = event.getParam('selectedRows');
        for (var i = 0; i < selectedRows.length; i++){
            alert("You selected: " + selectedRows[i].Title__c);
        }
    },
    
    handleAddItem : function (component,event,helper){
        var movie = event.getParam("movie");
        component.set("v.idMovie", movie.Id);
        
        var actor = component.get("v.newActor");
        actor.Movie__c = component.get("v.idMovie");
    },
    
    create : function(component, event, helper) {
        var action = component.get("c.saveItem"); var actor = component.get("v.newActor");        
        action.setParams({"actor":actor});
        action.setCallback(this,function(response){
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
            }
        });
        $A.enqueueAction(action);   
   }
})