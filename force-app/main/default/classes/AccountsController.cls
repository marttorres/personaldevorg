public class AccountsController {

    @AuraEnabled
    public static List<Account> getAccounts(){
        return [SELECT Id, AccountNumber, Name, Industry, Phone, Website FROM Account LIMIT 5];
    }
    
    @AuraEnabled
    public static List<Contact> getContacts(Id paramAccountId){
        return [SELECT Id, LastName FROM Contact WHERE AccountId =: paramAccountId LIMIT 5];
    }
}