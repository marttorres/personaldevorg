({
    /**
  	* This function adds the Contact related to the Account.
 	*
  	* @param - component - Represents the instance of the previously used element in the component.
			   idAccount - Represents the Account ID. 
  	*/  
    addContacts : function(component, idAccount) {
        var listContacts = component.get("v.listContacts");
        var listAccountWrapper = component.get("v.items");
        debugger;
        listAccountWrapper.forEach(function(objAccountWrapper) {
            var objAccountWrapperId = objAccountWrapper.name.split(";");
            if(objAccountWrapperId[0] == idAccount) {
                listContacts.forEach(function(objContact) {
                    objContact.label = 'Contact Name : ' + (objContact.firstName || 'N/A') + ' ' + (objContact.lastName || 'N/A') + ' | Role: ' + (objContact.role || 'N/A');  
                    objAccountWrapper.items.push(objContact);
                });
                objAccountWrapper.expanded = true;
            }
        });
        
        component.set("v.items", listAccountWrapper);
    },
    
    /**
  	* This function retrieves the Accounts that meet the search criterias.
 	*
  	* @param - component - Represents the instance of the previously used element in the component. 
  	*/  
    addAccounts : function(component) {
        var listAccounts = component.get("v.items");
        
        listAccounts.forEach(function(objAccount) {
            if (!objAccount.recordTypeName) {
                objAccount.recordTypeName = '';
            }
            objAccount.label = 'Name: ' + objAccount.account + ' | Record Type Name: ' + objAccount.recordTypeName;
        });
        debugger;
        component.set("v.items", listAccounts);
        component.set("v.itemsBackup", listAccounts);
    },
    
    /**
  	* This function updates the Account Wrapper list with the Accounts that can create Cases with the Case Record Type was specified by the user.
 	*
  	* @param - component - Represents the instance of the previously used element in the component. 
    		   listRecordTypeAccount - Represents a list of Account Record Types.
  	*/  
    paintingAccounts : function(component, listRecordTypesAccount) {
        var intEventExecution = component.get("v.eventNumber");
        
        var listFiltered = this.filterResultsbyAccountType(component, listRecordTypesAccount);
        intEventExecution = intEventExecution + 1;
        
        component.set("v.eventNumber", intEventExecution);
        component.set("v.items", listFiltered);
    },
    
    /**
  	* This function retrieves the Accounts that meet the search criterias.
 	*
  	* @param - component - Represents the instance of the previously used element in the component. 
    		   listRecordTypeAccount - Represents a list of Account Record Types.
    * @return - A list of Accounts that can create Case with the Case Record Type was selected by the user. 
  	*/  
    filterResultsbyAccountType : function(component, listRecordTypesAccount) {
        var listAccounts = component.get("v.itemsBackup");
        var listFiltering = component.get("v.itemsBackup");
        var intTrackerNumber = 0;
        var intAuxIndexCtrl = 0;
        
        if (!listAccounts.isEmpty()) {
            listAccounts.forEach(function(objAccount, index) {
                var intAuxIndex = index;
                intTrackerNumber = 0;
                
                listRecordTypesAccount.forEach(function(recordTypeName) {
                    if(objAccount.recordTypeName == recordTypeName) {
                        intTrackerNumber = intTrackerNumber + 1;
                    }
                })
                
                if (intTrackerNumber == 0) {
                    intAuxIndex = intAuxIndex - intAuxIndexCtrl;
                    listFiltering.splice(intAuxIndex, 1);
                    intAuxIndexCtrl = intAuxIndexCtrl + 1;
                }
            })
        }
        
        component.set("v.itemsBackup", component.get("v.itemsBackupPerm"));
        
        return listFiltering;
    }
})