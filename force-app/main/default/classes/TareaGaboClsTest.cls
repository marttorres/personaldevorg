@isTest
public class TareaGaboClsTest {

    @testSetup static void setup() {
        Profile userProfile = [SELECT Id, Name FROM Profile WHERE Name = 'System Administrator'];
        UserRole userRol = [SELECT Id FROM UserRole WHERE PortalType = 'None' LIMIT 1];
        User userTest = new User(UserRoleId = userRol.Id, ProfileId = userProfile.Id,
                                 Username = 'contactAdmin@nissan.com', Alias = 'Admin',
                                 Email = 'martin.torres@hotmail.com', EmailEncodingKey='UTF-8', 
                                 LastName='Testing', LanguageLocaleKey='en_US', LocaleSidKey='en_US',
                                 TimeZoneSidKey='America/Los_Angeles');
        insert userTest;
        User userTestAdmin = [SELECT Id FROM User WHERE Email = 'martin.torres@hotmail.com' LIMIT 1];
        
        System.runAs(userTestAdmin) {
            List<Account> listAccounts = TareaGaboClsHelper.crearAccounts(5,'Test Account'); 
            insert listAccounts;
            Account objA = [SELECT Id,Name FROM Account LIMIT 1];
            List<Contact> listContacts = TareaGaboClsHelper.crearContacts(5,'Test Contact', objA);
            insert listContacts;            
        }
    }
    
    @isTest static void testInsert() {
        List<Account> listAccountsRetriver = [SELECT Id,Name,Phone,Fax,Description FROM Account WHERE Name LIKE 'Test Account%'];
        TareaGaboCls.insertarContact(listAccountsRetriver);
    }
    
    @isTest static void testUpdate() {
        List<Contact> listContactsRetriver = [SELECT Id,AccountId,Phone,Fax,Description FROM Contact WHERE Name LIKE 'Test Contact%'];
        TareaGaboCls.updateAccount(listContactsRetriver);        
    }
    
    @isTest static void testConstructor() {
        TareaGaboCls controller = new TareaGaboCls ();
    }
    
}