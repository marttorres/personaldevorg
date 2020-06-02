/*JS CONTROLLER*/

({
	updateRecord : function(component, event, helper) {
		var recordService = component.find('forceRecordCmpEdit');
        
	},
    
    onChangeMethod: function(component, event, helper){
        var recordService = component.find('forceRecordCmpEdit');
        recordService.saveRecord(function(saveResult){
            if(saveResult.state === "SUCCESS"){
            	console.log("data saved");     
            }
            else if(saveResult.state === "ERROR"){
                console.log("Got Error:"+JSON.stringify(saveResult.error));     
            }
            
        });
    }
})