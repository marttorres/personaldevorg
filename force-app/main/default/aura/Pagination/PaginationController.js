({
	/*
	 * This function defines the column headers and calls getAccounts helper method for column data
	 * inside the component there's an attribute called "columns"
	 * inside the component, in the data table, the column headers are pulled from this attribute
     * editable:'true' will make the column editable
	 * The component and the helper are sent to the getAccounts helper function
     * */
	doInit : function(component, event, helper) {        
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'phone'},
            {label: 'Active', fieldName: 'Active__c', type: 'text'}
        ]);
        helper.getAccounts(component, helper);
    },
	
	/*
	 * This function is called when the user clicks the "next" arrow
	 * Inside the component, there's an attribute called "currentPageNumber"
	 * 		This attribute keeps track of the current page of the list of results
	 * This function retrieves the "currentPageNumber" value, then adds +1 to the value
	 * The component and the helper are sent to the buildData helper function
     * */
    onNext : function(component, event, helper) {        
        var pageNumber = component.get("v.currentPageNumber");
        component.set("v.currentPageNumber", pageNumber+1);
        helper.buildData(component, helper);
    },
	
	/*
	 * This function is called when the user clicks the "previous" arrow
	 * Inside the component, there's an attribute called "currentPageNumber"
	 * 		This attribute keeps track of the current page of the list of results
	 * This function retrieves the "currentPageNumber" value, then substract -1 to the value
	 * The component and the helper are sent to the buildData helper function
     * */
    onPrev : function(component, event, helper) {        
        var pageNumber = component.get("v.currentPageNumber");
        component.set("v.currentPageNumber", pageNumber-1);
        helper.buildData(component, helper);
    },
	
	/*
	 * This function is called when the page "1", page "n" and any number in the number list is clicked 
	 * Inside the component, there's an attribute called "currentPageNumber"
	 * Inside the component, there's an attribute called "totalPages"
	 * Inside the component, there's an attribute called "pageList", "items" after the aura:iteration element
	 * Depending on the element clicked, the "name" in that element is parsed into an Integer
	 * 		If the "1" is clicked, a 1 is parsed
	 * 		If one of the numbers in the page list is clicked, the number of that page is parsed
	 * 		If the last page number is clicked, the last page number is parsed
	 * This function sets the "currentPageNumber" value, to the value parsed
	 * The component and the helper are sent to the buildData helper function
     * */
    processMe : function(component, event, helper) {
        component.set("v.currentPageNumber", parseInt(event.target.name));
        helper.buildData(component, helper);
    },
	
	/*
	 * This function is called when the user clicks the "First" button
	 * Inside the component, there's an attribute called "currentPageNumber"
	 * 		This attribute keeps track of the current page of the list of results
	 * This function sets the "currentPageNumber" value to 1
	 * The component and the helper are sent to the buildData helper function
     * 
    onFirst : function(component, event, helper) {        
        component.set("v.currentPageNumber", 1);
        helper.buildData(component, helper);
    }, */
	
	/*
	 * This function is called when the user clicks the "Last" button
	 * Inside the component, there's an attribute called "currentPageNumber"
	 * 		This attribute keeps track of the current page of the list of results
	 * This function sets the "currentPageNumber" value, to the last page using the total number of pages
	 * The component and the helper are sent to the buildData helper function
     * 
    onLast : function(component, event, helper) {        
        component.set("v.currentPageNumber", component.get("v.totalPages"));
        helper.buildData(component, helper);
    }, */
  
})