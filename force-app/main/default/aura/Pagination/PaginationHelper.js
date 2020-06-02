({
	/*
	 * This function will build the result table data
	 * It calls the Apex controller method "getLimitedAccounts"
     * */
    getAccounts : function(component, helper) {
        var action = component.get("c.getLimitedAccounts");
        action.setStorable();
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
				console.log('Response Time: '+((new Date().getTime())-requestInitiatedTime));
				//PAGE TOTAL (Math.ceil returns the smallest integer) Math.ceil(account list's length / pageSize) NOTE: pageSize = 20 (default)
				component.set("v.totalPages", Math.ceil(response.getReturnValue().length/component.get("v.pageSize")));
				//Stores the account list in the "allData" attribute in the component
				component.set("v.allData", response.getReturnValue());
				//Sets the currentPageNumber to 1 (starting page)
				component.set("v.currentPageNumber",1);
                helper.buildData(component, helper);
            }
        });
        var requestInitiatedTime = new Date().getTime();
        $A.enqueueAction(action);
    },
    
    /*
	 * This function will build the result table data
	 * based on he current page selection
     * */
    buildData : function(component, helper) {
		var data = [];
        var pageNumber = component.get("v.currentPageNumber");
        var pageSize = component.get("v.pageSize");
        var allData = component.get("v.allData");
        var x = (pageNumber-1)*pageSize;
        
        //creating data-table data
        for(; x<=(pageNumber)*pageSize; x++) {
            var y = (pageNumber*pageSize) - x;
            if(y==0) {
            }
            else {
                if(allData[x]) {
                    data.push(allData[x]);
                }
            }
        }

		//Populates the lightning:datatable
        component.set("v.data", data);
        helper.generatePageList(component, pageNumber);
    },
    
    /*
     * This function generates the page list with the numbers depending on the total number of pages and the current
     * */
    generatePageList : function(component, pageNumber) {
        pageNumber = parseInt(pageNumber);
        var pageList = [];
        var totalPage = component.get("v.totalPages");

        if(pageNumber<=7) {
            if(totalPage == 3) {
                pageList.push(2);
            }
            if(totalPage == 4) {
                pageList.push(2,3);
            }
            if(totalPage == 5) {
                pageList.push(2,3,4);
            }
            if(totalPage == 6) {
                pageList.push(2,3,4,5);
            }
            if(totalPage == 7) {
                pageList.push(2,3,4,5,6);
            }
            else {
                if(pageNumber <= 2) {
                    pageList.push(2,3,4,5,6);
                }
                else {
                    pageList.push(3,4,5,6,7);
                }
            }
        } else if(pageNumber>(totalPage-5)) {
            pageList.push(totalPage-5, totalPage-4, totalPage-3, totalPage-2, totalPage-1);
        } else {
            pageList.push(pageNumber-2, pageNumber-1, pageNumber, pageNumber+1, pageNumber+2);
        }
        component.set("v.pageList", pageList);
    }
 })