({
    doInit: function(component, event, helper) {
        var action = component.get("c.getMovies");
        var inputMovies = component.find("InputMovies");
        var opts=[];
        action.setCallback(this, function(a) {
            opts.push({
                class: "optionClass",
                label: "--- Peliculas ---",
                value: ""
            });
            for(var i=0;i< a.getReturnValue().length;i++){
                component.set("v.recordMovie",a.getReturnValue()[i]);
                var x = component.get("v.recordMovie");
                opts.push({"class": "optionClass", label:x.Name, value: x});
            }
            inputMovies.set("v.options", opts);
             
        });
        $A.enqueueAction(action); 
    },
    onPicklistChange: function(component, event, helper) {
        var selected = component.find("InputMovies");
        var valueSelected = selected.get("v.value");
        var movie = component.get("v.recordMovie");
        
        var addItem = component.getEvent("addItem");
        addItem.setParams({ "movie": movie });
        addItem.fire();
    }
})