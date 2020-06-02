@isTest
public class ExamenTest {
  @IsTest
  private static void testAccountProcessor() {
      Contact c1 = new Contact(LastName = 'T');
      Contact c2 = new Contact(LastName = 'O');
      Contact c3 = new Contact(LastName = 'RR');
      Contact c4 = new Contact(LastName = 'E');
      Contact c5 = new Contact(LastName = 'S');
      List<Contact> listC = new List<Contact>{
          c1,c2,c3,c4,c5
      };
      insert listC;
      List<id> ids = new List<id>();
      for(Contact objC: listC) {
          ids.add(objC.Id);
      }
      
      Test.startTest();
      ContactOpportunityFuture.agregarOpportunity(ids);
      Test.stopTest();
  }
}