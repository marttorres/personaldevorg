public class TableEmbSanbox {
    
    @AuraEnabled
    public static List<Contact> getContacts(Id accountId) {        
        List<Contact> contactsList = new List<Contact>();
        String contactQueryStr = 'SELECT Id, LastName, FirstName FROM Contact WHERE AccountId = ' + String.escapeSingleQuotes(accountId) + ' LIMIT 50000'; 
        contactsList = Database.query(contactQueryStr);        
        return contactsList;
    }
    
    @AuraEnabled
    public static List<Account> getAccounts(String accountQueryConditionalsStr) {        
        List<Account> accountsList = new List<Account>();       
        String accountQueryStr = 'SELECT Id, Name, Industry, Phone FROM Account ' + accountQueryConditionalsStr + ' LIMIT 50000';
        accountsList = Database.query(accountQueryStr);
        return accountsList;
    } 
    
    /*
    @AuraEnabled
    public static List<String> getAccountMappingMtd(String caseTypeStr) {
        List<String> recordTypeNamesList = new List<String>();
        for (AccountTypeMapping_MRC__mdt accountTypeMappingObj : [SELECT Id, AccountType_MRC__c, CaseType_MRC__c FROM AccountTypeMapping_MRC__mdt]) {
            if (accountTypeMappingObj.CaseType_MRC__c.Contains(caseTypeStr)) {
                recordTypeNamesList.add(accountTypeMappingObj.AccountType_MRC__c);
            }
        }
        return recordTypeNamesList;
    } */
}