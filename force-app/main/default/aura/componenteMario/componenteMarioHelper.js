({
    getMovieData: function(component, event, helper) {
      var action = component.get("c.getMovieData");
      action.setCallback(this, function(response) {
          var responseState = response.getState();
          if (responseState == "SUCCESS") {
              var listMovies = response.getReturnValue();
              component.set("v.listMovies", listMovies);
              this.fillHeadersTable(component, event, helper);
          }
          else {
              console.log("Error al obtener la informacion de Movie__c");
          }
      });
      $A.enqueueAction(action);
    },
    
    fillHeadersTable: function(component, event, helper) {
        component.set("v.listHeaders",  [
                {label: 'Name', fieldName: 'Title__c', type: 'text'}
        ]);
    },
    
    callHelperCreateCase : function(component) {
        var caseObj = component.get("v.newCase");
        var action = component.get("c.f_createCase");
        //var caseName = caseObj.name;
        var jsonCase = JSON.stringify(caseObj);
        action.setParams({ 
            "objCase": caseObj
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var name = response.getReturnValue();
                component.set("v.isOpen", true);
            }
        
        	var appEvent = $A.get("e.c:CaseCreated");
            appEvent.setParams({ "message" : "case Created" });
            appEvent.fire();
        });
        $A.enqueueAction(action);
    }
})