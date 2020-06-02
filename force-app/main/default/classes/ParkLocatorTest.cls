@isTest
public class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        List<String> result = new  List<String>();
        List<String> expectedValue = new  List<String>{'Park1', 'Park2', 'Park3'};
        
        result = ParkLocator.country('Germany');
        // Verify that a fake result is returned
        System.assertEquals(expectedValue, result); 
    }
}