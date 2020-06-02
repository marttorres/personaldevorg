public class TareaGaboCls {
    
    public TareaGaboCls(){}
    
    public static void insertarContact(List<sObject> listAccounts) {
        List<Account> listA = new List<Account>();
        List<Contact> listC = new List<Contact>();
        listA = (List<Account>)listAccounts;
        Integer numContador = 0;
        for(Account objAccount : listA) {
            Contact objContact = new Contact();
            objContact.LastName = objAccount.Name + ' ' + numContador;
            objContact.Phone = objAccount.Phone;
            objContact.Fax = objAccount.Fax;
            objContact.Description = objAccount.Description;
            objContact.AccountId = objAccount.Id;
            listC.add(objContact);  
            numContador++;
        }  
        insert listC;
    }
    
    public static void updateAccount(List<sObject> listContacts) {
        List<Contact> listC = new List<Contact>();    
        List<ID> listCIds = new List<ID>();
        List<Account> listA = new List<Account>();
        listC = (List<Contact>)listContacts;
        
        for(Contact objContact : listC) {
            listCIds.add(objContact.AccountId);
        }
        
        List<Account> listAccountRelatedContact = [SELECT Id, Name FROM Account WHERE Id =:listCIds];        
        for(Contact objContact : listC) {
            for(Account objAccount : listAccountRelatedContact) {
                if(objAccount.Id == objContact.AccountId) {
                    objAccount.Phone = objContact.Phone;
                    objAccount.Fax = objContact.Fax;
                    objAccount.Description = objContact.Description;
                    listA.add(objAccount);                    
                }
            }            
        }        
        update listA;
    }
}