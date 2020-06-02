({
    /**
  	* This function receives the parameters to identify the Acccount was selected by the user, then the function looks for Contacts related
    * to the Account and It calls the function "addContact" in the helper file.
 	*
  	* @param - component - Represents the instance of the previously used element in the component. 
			   event - Catchs the events that was fired in the component. 
	           helper - Represents the instance of the helper.
  	*/  
    getItem : function (component, event, helper) {
        var listAccountWrapper = component.get("v.items");
        var idAccount = event.getParam("name");
        var boolHasContacts = true;
        
        listAccountWrapper.forEach(function(objAccountWrapper) {  
            if (objAccountWrapper.name == idAccount) {
                if(objAccountWrapper.items.length >= 1) {
               		boolHasContacts = true;
                } else {
                    boolHasContacts = false;
                }
            }
        });

        if (boolHasContacts == false) {
            var action = component.get("c.getContacts");
            action.setParams({ idAccount : idAccount });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    component.set('v.listContacts', response.getReturnValue());
                    helper.addContacts(component, idAccount);
                }
            });
            $A.enqueueAction(action);
        }
    },
    
    /**
  	* This function receives the parameters to retrieve the Accounts that meet the search criterias were specified by the user and it makes a 
    * backup for the function "mappingAccountType".
 	*
  	* @param - component - Represents the instance of the previously used element in the component. 
			   event - Catchs the events that was fired in the component. 
	           helper - Represents the instance of the helper.
  	*/  
    triggerQuery : function(component, event, helper) {
        var action = component.get("c.getAccounts");
        var strFinalQuery = component.get("v.strQuery");
        
        action.setParams({ strQuery : strFinalQuery });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
                component.set("v.itemsBackupPerm", response.getReturnValue());
                component.set("v.eventNumber", 0);
                helper.addAccounts(component);
            }
        });
        $A.enqueueAction(action);
    },
    
    /**
  	* This function will be fired when the user select an option in the picklist of "Case Record Type".
 	*
  	* @param - component - Represents the instance of the previously used element in the component. 
			   event - Catchs the events that was fired in the component. 
	           helper - Represents the instance of the helper.
  	*/      
    mappingAccountType : function(component, event, helper) {
        var strCaseTypeName =  component.get("v.strCaseTypeName");
        var intEventExecution = component.get("v.eventNumber");
        var listAccounts = component.get("v.items");
        
        if (intEventExecution == 0) {
            var listAccounts = component.get("v.items");
            if(!listAccounts) {
                return;
            }
        }
        if (intEventExecution >= 1) {
            var listAccountsBackup = component.get("v.itemsBackup");
            component.set("v.items", listAccountsBackup);
        }
        
        var action = component.get("c.paintAccounts");
        action.setParams({ strCaseType : strCaseTypeName });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var listRecordTypesAccount = response.getReturnValue();
                helper.paintingAccounts(component, listRecordTypesAccount);
            }
        });
        $A.enqueueAction(action);
    }
})