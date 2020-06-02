public class StandardControllerP1 {
    
    private List<Case> caseObj;
    public Account objAccount;
    public String strAccountName {get; set;}
    public List<Contact> listContact;
    
    public StandardControllerP1(ApexPages.StandardController controller) {        
        this.caseObj = [SELECT Id, CaseNumber, ContactEmail, Subject, ContactPhone, AccountId FROM Case ORDER BY CreatedDate ASC LIMIT 10];
        //this.caseObj = [SELECT Id, CaseNumber FROM Case WHERE Id =: caseObj.Id];
    }
    
    public List<Case> getObjCase() {
        return caseObj;
    }
    
    public void dataAccount() {
        this.objAccount = [SELECT Id FROM Account WHERE Name LIKE :strAccountName + '%' LIMIT 1];
        this.listContact = [SELECT Id, LastName FROM Contact WHERE AccountId =:this.objAccount.Id];
    }
    
    public List<Contact> getContacts(){      
        return this.listContact;
    }
    
}