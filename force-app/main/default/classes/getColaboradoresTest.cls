/**
* Test Class de la Apex class "getColaboradores.apxc"
* <p /><p />
* @author Martin Torres, Salvador Zamarrón, Giussep Estrada
*/
@isTest
public class getColaboradoresTest {
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
			Colaborador__c objColaborador = new Colaborador__c(Nombre__c = 'Test Colaborador', ApellidoPaterno__c = 'Paterno',
															   ApellidoMaterno__c = 'Materno', Empresa__c = 'Deloitte',
															   Sector__c = 'Digital', Capability__c = 'Salesforce');
			insert objColaborador;
			
			Colaborador__c objColaborador2 = new Colaborador__c(Nombre__c = 'Mario', ApellidoPaterno__c = 'Diez',
																ApellidoMaterno__c = 'Martinez', Estatus__c = 'Por confirmar');
			insert objColaborador2;
			
			Account objAccount = new Account(Name = 'TestName');
			insert objAccount;
			
			Opportunity objOpportunity = new Opportunity(Name = 'TestOportunity', StageName = 'Test', CloseDate = Date.today());
			insert objOpportunity;
		}
	}
	
	@isTest static void getListColaboradores() {
		Colaborador__c objColaborador = [SELECT Id, Nombre__c, ApellidoPaterno__c, ApellidoMaterno__c 
										 FROM Colaborador__c WHERE Nombre__c = 'Test Colaborador'];
		Test.startTest();
		getColaboradores.getCol(objColaborador.Id);
		Test.stopTest();
	}
	
	@isTest static void asignarColaborador() {
		Colaborador__c objColaborador = [SELECT Nombre__c, ApellidoPaterno__c, ApellidoMaterno__c 
										 FROM Colaborador__c WHERE Nombre__c='Mario'];
		
		Account objAccount = [SELECT Id, Name FROM Account LIMIT 1];
		Opportunity objOpportunity = [SELECT Id, Name FROM Opportunity LIMIT 1];
		
		Test.startTest();
		getColaboradores.saveColaborador(objColaborador, objAccount.Id, objOpportunity.Id);
		Test.stopTest();
	}
}