@isTest
public class AccountProcessorTest {
  @IsTest
  private static void testAccountProcessor() {
      List<ID> listIds = new List<ID>();
      List<Account> listAccount = new List<Account>();
      List<Contact> listContact = new List<Contact>();
      
      AccountProcessorTestUtils aptu = new AccountProcessorTestUtils();
      listAccount.add(aptu.createAccount());
      insert listAccount;
      
      for(Account acc : listAccount) {
          listContact.add(aptu.createContact(acc.Id));
      }
      insert listContact;
      
      for(Account objA : listAccount) {
          listIds.add(objA.Id);  
      }
      
      Test.startTest();
      AccountProcessor.countContacts(listIds);
      Test.stopTest();
  }
}