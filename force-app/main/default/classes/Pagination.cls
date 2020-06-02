public  without sharing class Pagination {

    /*
    * This method returns a list of Accounts.
    * It's called by the "getAccounts" function in the helper
    * */
     @AuraEnabled
    public static List<Account> getLimitedAccounts() {
        List<Account> accounts = [SELECT Id, Name, Phone, Rating, Active__c
                                  FROM Account 
                                  ORDER BY CreatedDate 
                                  LIMIT 2000];
        return accounts;
    }
}