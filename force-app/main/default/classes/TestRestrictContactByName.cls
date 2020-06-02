@isTest
private class TestRestrictContactByName{
    @isTest static void testInvalidContact(){
        
        Contact objContact = new Contact(LastName = 'INVALIDNAME');
        
        Test.startTest();
        Database.SaveResult resultInsert = Database.insert(objContact,false);        
        Database.SaveResult resultUpdate = Database.update(objContact,false);
        Test.stopTest();
            
        system.assertEquals(true,resultInsert.getErrors().size()  > 0);
    }
}