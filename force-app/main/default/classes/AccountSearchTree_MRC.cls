public class AccountSearchTree_MRC {
    @AuraEnabled
    public static List<Items> getContacts(Id idAccount) {        
        List<Items> listItems = new List<Items>();
        
        for(Contact objContact : [SELECT Id, LastName, FirstName
                                  FROM Contact 
                                  WHERE AccountId =: idAccount]) {

            Items objItem = new Items();
            objItem.name = objContact.Id;                        
            objItem.name += ';' +String.ValueOf(objContact.getSobjectType());
            objItem.name += ';' +objContact.LastName;                          
            objItem.firstName = objContact.FirstName;
            objItem.lastName = objContact.LastName;
            objItem.role = '';
            objItem.expanded = false;
            listItems.add(objItem);
            System.debug('Object Type is ' + objItem.name);
        }
        
        return listItems;
    }
        
    @AuraEnabled
    public static List<AccountWrapper> getAccounts(String strQuery) {        
        String strFinalQuery = 'SELECT Id, Name, Industry, Phone FROM Account';
        List<AccountWrapper> listAccountWrapper = new List<AccountWrapper>();
        
        for(Account objAccount : Database.query(strFinalQuery)) {
            AccountWrapper objAccountWrapper = new AccountWrapper(); 
            objAccountWrapper.name = objAccount.Id ;
            objAccountWrapper.name += ';' + String.ValueOf(objAccount.getSobjectType());
            objAccountWrapper.name += ';' + objAccount.Name;
            objAccountWrapper.account = objAccount.Name ;
            objAccountWrapper.recordTypeName = '';
            objAccountWrapper.expanded = false ;
            List<Items> listItems = new List<Items>();
            objAccountWrapper.items = listItems;
            listAccountWrapper.add(objAccountWrapper);            
        }
        
        return listAccountWrapper;
    } 
    
    public class AccountWrapper {
        @AuraEnabled
        public String name {get;set;}
        @AuraEnabled
        public String identifier {get;set;}
        @AuraEnabled
        public String account {get;set;}
        @AuraEnabled
        public String recordTypeName {get;set;}
        @AuraEnabled
        public Boolean expanded {get;set;}
        @AuraEnabled
        public String label {get;set;}
        @AuraEnabled
        public List<Items> items {get;set;}
    }
    
    public class Items {
        @AuraEnabled
        public String name {get;set;}
        @AuraEnabled
        public String identifier {get;set;}
        @AuraEnabled
        public String firstName {get;set;}
        @AuraEnabled
        public String lastName {get;set;}
        @AuraEnabled
        public String role {get;set;}
        @AuraEnabled
        public String label {get;set;}
        @AuraEnabled
        public Boolean expanded {get;set;}
    }
    
}