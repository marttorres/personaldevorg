@isTest
public class RandomContactFactoryTest {
    @isTest static void ingresarContacts() {
        List<Contact> listContacts = RandomContactFactory.generateRandomContacts(2,'INVALIDNAME');
        Test.startTest();
        Database.SaveResult[] results = Database.insert(listContacts, false);
        Test.stopTest();
        for(Database.SaveResult dr : results) {
            System.assertEquals(false, dr.isSuccess());
        }
    }
}