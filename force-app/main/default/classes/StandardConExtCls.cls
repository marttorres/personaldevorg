public class StandardConExtCls {
	private Case caseObj;
    
    public StandardConExtCls(ApexPages.StandardController controller) {
        this.caseObj = (Case)controller.getRecord();
        this.caseObj = [SELECT Id, CaseNumber, ContactEmail, Subject, ContactPhone FROM Case ORDER BY CreatedDate ASC LIMIT 1];
        //this.caseObj = [SELECT Id, CaseNumber FROM Case WHERE Id =: caseObj.Id];
    }
    
    public Case getObjCase() {
        return caseObj;
    }
    
    public String getCaseNumberVar() {
        return 'The case number is ' + caseObj.Id;
    }
}