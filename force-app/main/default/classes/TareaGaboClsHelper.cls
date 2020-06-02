@isTest
public class TareaGaboClsHelper {
    public static List<Account> crearAccounts(Integer intNAccount, String strName) {
        List<Account> listAccounts = new List<Account>();
        
        for(Integer i = 0; i < intNAccount; i++) {
            Account objAccount = new Account();
            objAccount.Name = strName + ' ' + i;
            listAccounts.add(objAccount);
        }
        
        return listAccounts;
    }
    
    public static List<Contact> crearContacts(Integer intNAccount, String strName, Account objA) {
        List<Contact> listContacts = new List<Contact>();
        
        for(Integer i = 0; i < intNAccount; i++) {
            Contact objContact = new Contact();
            objContact.LastName = strName + ' ' + i;
            objContact.AccountId = objA.Id;
            objContact.Phone = '4424657472';
            objContact.Fax = '2983456';
            objContact.Description = 'HOLA';
            listContacts.add(objContact);
        }
        
        return listContacts;
    }
}