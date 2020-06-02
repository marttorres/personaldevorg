/*JS COntroller for loading spinner*/
({
	recordLoaded : function(component, event, helper) {
		component.set("v.showSpinner", false);
        console.log("Record Loaded");
	},
    
    doInit : function(component, event, helper) {
        console.log("In doInit");
        component.set("v.showSpinner", true);
    }
})