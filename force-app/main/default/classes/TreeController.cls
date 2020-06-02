public class TreeController {
 @AuraEnabled
    public static String getTreeData(){
        List<Account> accs = [Select Id , Name,(Select Id , FirstName, LastName from Contacts) from Account];
        
        List<AccountWrapper> aooo = new List<AccountWrapper>();
        for(Account a : accs){
            AccountWrapper aWraper = new AccountWrapper() ; 
            aWraper.name =a.Name ;
            aWraper.label =a.Name ;
            aWraper.expanded =false ;
            List<Items> co = new List<Items>();
            for(Contact c : a.Contacts){
                Items conWrapp = new Items();
                conWrapp.name =c.Name ;
                conWrapp.label =c.Name ;
                conWrapp.expanded =true ;
                
                
                co.add(conWrapp);
            }
            aWraper.items = co;
            aooo.add(aWraper);
            
        }
        return JSON.serializePretty(aooo) ;
    } 
    public Class AccountWrapper{
        @AuraEnabled
        public String name {get;set;}
        @AuraEnabled
        public String label {get;set;}
        @AuraEnabled
        public Boolean expanded {get;set;}
        @AuraEnabled
        public List<Items> items {get;set;}
        
    }
    public Class Items{
        @AuraEnabled
        public String name {get;set;}
        @AuraEnabled
        public String label {get;set;}
        @AuraEnabled
        public Boolean expanded {get;set;}
        @AuraEnabled
        public List<Items> items {get;set;}
    }
    
}