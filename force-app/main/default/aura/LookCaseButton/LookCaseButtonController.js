({
    onTabCreated: function(cmp) {
        debugger;
        console.log('Ejecuto');
        var mysheet = document.styleSheets[1]
        var myrules = mysheet.cssRules ? mysheet.cssRules : mysheet.rules;
        mysheet.crossdelete = mysheet.deleteRule ? mysheet.deleteRule : mysheet.removeRule;
        for (var i = 0; i < myrules.length; i++) {
            if (myrules[i].cssText.includes("oneAnchorHeader")) {
                mysheet.crossdelete(i);                
                mysheet.insertRule(".oneAnchorHeader { display: none;}", 0);
                break;
            }
        }   
       
    },
    
     onTabFocused : function(component, event, helper) {
         debugger;
         
         
         var url = window.location.href;
         if(url.includes('martintorres-dev-ed.lightning.force.com/lightning/o/Case/list')) {
             var mysheet = document.styleSheets[1]
             var myrules = mysheet.cssRules ? mysheet.cssRules : mysheet.rules;
             mysheet.crossdelete = mysheet.deleteRule ? mysheet.deleteRule : mysheet.removeRule;
             for (var i = 0; i < myrules.length; i++) {
                 if (myrules[i].cssText.includes("forceActionsContainer")) {
                   //  mysheet.crossdelete(i);  
                   //  //white-space: nowrap;
                   myrules[i].style.cssText = ".forceActionsContainer.uiButton { display: none; }";
                     //mysheet.insertRule(".forceActionsContainer { display: none;}", 0);
                     //break;
                 }
             } 
         }
        
  	},
    
 
    focusNavigationItem : function(component, event, helper) {
         var url = window.location.href;
         if(url.includes('martintorres-dev-ed.lightning.force.com/lightning/o/Case/list')) {
             var mysheet = document.styleSheets[1]
             var myrules = mysheet.cssRules ? mysheet.cssRules : mysheet.rules;
             mysheet.crossdelete = mysheet.deleteRule ? mysheet.deleteRule : mysheet.removeRule;
             for (var i = 0; i < myrules.length; i++) {
                 if (myrules[i].cssText.includes("forceActionsContainer")) {
                   //  mysheet.crossdelete(i);  
                   //  //white-space: nowrap;
                   myrules[i].style.cssText = ".forceActionsContainer.uiButton { display: none; }";
                     //mysheet.insertRule(".forceActionsContainer { display: none;}", 0);
                     //break;
                 }
             } 
         }
    }

})