({
	doInit : function(component, event, helper) {
    	helper.getAccounts(component);
        component.set('v.listColumns', [
            {label: 'Last Name', fieldName: 'LastName', type: 'text'},
        ]);

	},
    showContacts : function(component, event, helper) {
        var idAccount = event.target.id;
		helper.getContacts(component, idAccount);
	}
})