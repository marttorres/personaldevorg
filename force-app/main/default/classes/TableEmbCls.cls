public class TableEmbCls {
    
    @AuraEnabled
    public static List<Contact> getContacts(Id idAccount) {        
        List<Contact> listItems = new List<Contact>();
        
        listItems = [SELECT Id, LastName, FirstName FROM Contact WHERE AccountId =: idAccount];
        
        return listItems;
    }
    
    @AuraEnabled
    public static List<Account> getAccounts(String strQuery) {        
        String strFinalQuery = 'SELECT Id, Name, Industry, Phone FROM Account  LIMIT 5';
        List<Account> lis = Database.query(strFinalQuery);
        return lis;
    } 
    
    
}