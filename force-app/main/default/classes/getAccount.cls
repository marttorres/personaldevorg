public with sharing class getAccount {
	@AuraEnabled
    public static Account getAccData(Id accountId) {
        Account searchAccount = new Account();
        searchAccount = [SELECT Id, Name FROM Account WHERE Id =: accountId LIMIT 1];
        System.debug('Account: ' + searchAccount);
        return searchAccount;
    }
}