@isTest
public class WebServiceControllerTest {
    
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
            Account objAccount = new Account(Name = 'Test');
            insert objAccount;
            Account objAccountInserted = [SELECT Id FROM Account LIMIT 1];
            ApexPages.StandardController objStandardController = new ApexPages.StandardController(objAccountInserted);
            WebServiceController objWebServiceController = new WebServiceController(objStandardController);
            objEndpoint = new getClientes__c(Name='saveAccount', URL__c = 'http://demo1897123.mockable.io/trainingAccount?$filter=clientNumber==');
            insert objEndpoint;
        }
    }
    
    @isTest static void testMock200() {    
        Account objAccountInserted = [SELECT Id FROM Account LIMIT 1];
        ApexPages.StandardController objStandardController = new ApexPages.StandardController(objAccountInserted);
        WebServiceController objWebServiceController = new WebServiceController(objStandardController);
        WebServiceCalloutCls.endpoint = objEndpoint; 
        
        Test.startTest();
        WebServiceClsMock objHttpMock = new WebServiceClsMock('200');
        Test.setMock(HttpCalloutMock.class, objHttpMock);   
        HttpResponse objWebServiceCalloutCls = WebServiceCalloutCls.webServiceGetMethod('D0000001'); 
        objWebServiceController.objDataResponse = objWebServiceCalloutCls;
        objWebServiceController.strClientNumber = 'D0000001';
        objWebServiceController.insertAccount();
        Test.stopTest();         
    }
    
    @isTest static void testMock403() {    
        Account objAccountInserted = [SELECT Id FROM Account LIMIT 1];
        ApexPages.StandardController objStandardController = new ApexPages.StandardController(objAccountInserted);
        WebServiceController objWebServiceController = new WebServiceController(objStandardController);
        WebServiceCalloutCls.endpoint = objEndpoint; 
        
        Test.startTest();
        WebServiceClsMock objHttpMock = new WebServiceClsMock('403');
        Test.setMock(HttpCalloutMock.class, objHttpMock);   
        HttpResponse objWebServiceCalloutCls = WebServiceCalloutCls.webServiceGetMethod('D0000001'); 
        objWebServiceController.objDataResponse = objWebServiceCalloutCls;
        objWebServiceController.strClientNumber = 'D0000001';
        objWebServiceController.insertAccount();
        Test.stopTest();         
    }
    
    @isTest static void testMock503() {    
        Account objAccountInserted = [SELECT Id FROM Account LIMIT 1];
        ApexPages.StandardController objStandardController = new ApexPages.StandardController(objAccountInserted);
        WebServiceController objWebServiceController = new WebServiceController(objStandardController);
        WebServiceCalloutCls.endpoint = objEndpoint; 
        
        Test.startTest();
        WebServiceClsMock objHttpMock = new WebServiceClsMock('503');
        Test.setMock(HttpCalloutMock.class, objHttpMock);   
        HttpResponse objWebServiceCalloutCls = WebServiceCalloutCls.webServiceGetMethod('D0000001'); 
        objWebServiceController.objDataResponse = objWebServiceCalloutCls;
        objWebServiceController.strClientNumber = 'D0000001';
        objWebServiceController.insertAccount();
        Test.stopTest();         
    }
    
    @isTest static void testMock206() {    
        Account objAccountInserted = [SELECT Id FROM Account LIMIT 1];
        ApexPages.StandardController objStandardController = new ApexPages.StandardController(objAccountInserted);
        WebServiceController objWebServiceController = new WebServiceController(objStandardController);
        WebServiceCalloutCls.endpoint = objEndpoint; 
        
        Test.startTest();
        WebServiceClsMock objHttpMock = new WebServiceClsMock('206');
        Test.setMock(HttpCalloutMock.class, objHttpMock);   
        HttpResponse objWebServiceCalloutCls = WebServiceCalloutCls.webServiceGetMethod('D0000001'); 
        objWebServiceController.objDataResponse = objWebServiceCalloutCls;
        objWebServiceController.strClientNumber = 'D0000001';
        objWebServiceController.insertAccount();
        Test.stopTest();         
    }
    
    
    @isTest static void testMockInvalid() {    
        Account objAccountInserted = [SELECT Id FROM Account LIMIT 1];
        ApexPages.StandardController objStandardController = new ApexPages.StandardController(objAccountInserted);
        WebServiceController objWebServiceController = new WebServiceController(objStandardController);
        WebServiceCalloutCls.endpoint = objEndpoint; 
        
        Test.startTest();
        WebServiceClsMock objHttpMock = new WebServiceClsMock('206');
        Test.setMock(HttpCalloutMock.class, objHttpMock);   
        HttpResponse objWebServiceCalloutCls = WebServiceCalloutCls.webServiceGetMethod('D0000S001'); 
        objWebServiceController.objDataResponse = objWebServiceCalloutCls;
        objWebServiceController.strClientNumber = 'D0000S001';
        objWebServiceController.insertAccount();
        Test.stopTest();         
    }
}