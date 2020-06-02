@isTest
public class ProyectoAnaClsTest {
	@testSetup static void setup() {
		Profile userProfile = [SELECT Id, Name FROM Profile WHERE Name = 'Custom: Sales Profile'];
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
            List<Account> listAccount = new List<Account>{
                new Account(Name = 'H'),
                new Account(Name = 'O'),
                new Account(Name = 'L'),
                new Account(Name = 'I')
            };
			insert listAccount;
			
		}
	}
    
	static testMethod void test() {
		/*Colaborador__c objColaborador = [SELECT Id, Nombre__c, ApellidoPaterno__c, ApellidoMaterno__c 
										 FROM Colaborador__c WHERE Nombre__c = 'Test Colaborador'];*/
		Test.startTest();
        String searchKeyWord = 'H';
        String ObjectName = 'account';
		ProyectoAnaCls.fetchLookUpValues(searchKeyWord, ObjectName);
		Test.stopTest();
	}
}