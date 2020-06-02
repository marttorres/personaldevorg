public class AccountProcessor {
	@future
    public static void countContacts (List<ID> listIds) {
        List<Account> listAccounts = new List<Account>();      
        List<Contact> listContacts = new List<Contact>(); 
        
        listAccounts = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id IN :listIds];  
        listContacts = [SELECT Id FROM Contact WHERE AccountId IN :listIds];
        System.debug(listAccounts);
        for(Account objAccount : listAccounts) {              
        	Integer intContact = 0;          
            for(Contact objContact : listContacts) {
                if(objContact.AccountId == objAccount.Id) {
                    intContact++;
                }
            }
            objAccount.Number_of_Contacts__c = intContact;
        }
        update listAccounts;             
    }
}