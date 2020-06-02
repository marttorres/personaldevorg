public class ChecksCls {
    
    public list<AccountRecord> accRecords {get; set;}
    
    public ChecksCls() {
        getAccounts();
    }
    
    private void getAccounts() {
        accRecords = new list<AccountRecord>();
        for(Account a: [SELECT Id, Name, Type, AccountNumber FROM Account]) {
            accRecords.add(new AccountRecord(false,a));
        }
    }
    
    public class AccountRecord{
        public Boolean isChecked {get;set;}
        public Account acc {get;set;}
        
        public AccountRecord(Boolean isChecked, Account acc) {
            this.isChecked = isChecked;
            this.acc = acc;
        }
    }
    
    public void deleteAccounts() {
        try {
            list<Account> accToDelete = new list<Account>();
            
            for(AccountRecord aRec: accRecords) {
                if(aRec.isChecked) {
                    accToDelete.add(aRec.acc);
                }
            }
            
            if(!accToDelete.isEmpty()) {
                delete accToDelete;
            }
            
            getAccounts();
            
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'Selected records deleted');
            ApexPages.addMessage(myMsg);
        }
        catch(Exception e) {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Selected records deleted');
            ApexPages.addMessage(myMsg);
        }
    }
}