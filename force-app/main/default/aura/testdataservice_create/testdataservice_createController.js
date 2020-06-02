({
	doInit : function(component, event, helper) {
		component.find("contactRecordCreator").getNewRecord(
            "Contact", // sObject type (entityApiName)
            null,      // recordTypeId
            false,     // skip cache?
            $A.getCallback(function() {
                var rec = component.get("v.newContact");
                var error = component.get("v.newContactError");
                if(error || (rec === null)) {
                    console.log("Error initializing record template: " + error);
                    return;
                }
                console.log("Record template initialized: " + rec.sobjectType);
            })
        );
	},
    
    handleChange:function(component, event, helper){
      	var firstName = component.find("contactFieldFirst");
        var lastName =  component.find("contactFieldLast");
        var phone = component.find("contactFieldPhone");
        
        if(firstName.get('v.validity').valid && lastName.get('v.validity').valid && phone.get('v.validity').valid){
            component.set("v.formvalid", true);
        }
        else
        	component.set("v.formvalid", false);
    },
    
    handleSaveContact: function(component, event, helper) {
        component.find("contactRecordCreator").saveRecord(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                console.log("in record saved");
                component.find("contactFieldFirst").set("v.value","");
                component.find("contactFieldLast").set("v.value","");
                component.find("contactFieldTitle").set("v.value","");
                component.set("v.message", "Contact record created successfully");
                var resultsToast = $A.get("e.force:showToast");
                    resultsToast.setParams({
                        "title": "Saved",
                        "message": "The record was saved."
                    });
                    resultsToast.fire();
            }
        })
    }
})