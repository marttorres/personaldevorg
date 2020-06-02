@isTest
public class WebServiceMockTest {
    
    public static getClientes__c objEndpoint {set; get;}
    
    @testSetup static void setup() {
        Profile userProfile = [SELECT Id, Name FROM Profile WHERE Name = 'System Administrator'];
        UserRole userRol = [SELECT Id FROM UserRole WHERE PortalType = 'None' LIMIT 1];
        User userTest = new User(UserRoleId = userRol.Id, 
                                 ProfileId = userProfile.Id,
                                 Username = 'contactAdminw@nissan.com', 
                                 Alias = 'Admin',
                                 Email = 'martin.torres@hotmail.com', 
                                 EmailEncodingKey='UTF-8', 
                                 LastName='Testing', 
                                 LanguageLocaleKey='en_US', 
                                 LocaleSidKey='en_US',
                                 TimeZoneSidKey='America/Los_Angeles');
        insert userTest;
        
        User userTestAdmin = [SELECT Id FROM User WHERE Email = 'martin.torres@hotmail.com' LIMIT 1];
        
        System.runAs(userTestAdmin) {  
            objEndpoint = new getClientes__c(Name='saveAccount', URL__c = 'http://demo1897123.mockable.io/trainingAccount?$filter=clientNumber==');
            insert objEndpoint;
        }
    }
    
    @isTest static void testMock200() {    
        WebServiceCalloutCls.endpoint = objEndpoint; 
        
        Test.startTest();
        WebServiceClsMock objHttpMock = new WebServiceClsMock('200');
        Test.setMock(HttpCalloutMock.class, objHttpMock);   
        HttpResponse objWebServiceCalloutCls = WebServiceCalloutCls.webServiceGetMethod('D0000001'); 
        System.assertEquals(200, objWebServiceCalloutCls.getStatusCode());
        Test.stopTest();         
    }

    @isTest static void testMock403() {    
        WebServiceCalloutCls.endpoint = objEndpoint; 
        
        Test.startTest();
        WebServiceClsMock objHttpMock = new WebServiceClsMock('403');
        Test.setMock(HttpCalloutMock.class, objHttpMock);   
        HttpResponse objWebServiceCalloutCls = WebServiceCalloutCls.webServiceGetMethod('D0000001'); 
        System.assertEquals(403, objWebServiceCalloutCls.getStatusCode());
        Test.stopTest();          
    }
    
    @isTest static void testMock503() {    
        WebServiceCalloutCls.endpoint = objEndpoint; 
        
        Test.startTest();
        WebServiceClsMock objHttpMock = new WebServiceClsMock('503');
        Test.setMock(HttpCalloutMock.class, objHttpMock);   
        HttpResponse objWebServiceCalloutCls = WebServiceCalloutCls.webServiceGetMethod('D0000001'); 
        System.assertEquals(503, objWebServiceCalloutCls.getStatusCode());
        Test.stopTest();  
    }

}