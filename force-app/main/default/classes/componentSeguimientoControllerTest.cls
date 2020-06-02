/**
 * Test Class de la Apex class "componentSeguimientoController"
 * <p /><p />
 * @author Martin Torres, Salvador Zamarrón, Giussep Estrada
 */
@isTest(SeeAllData = false)
public class componentSeguimientoControllerTest {
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
	}
  }
  
  /**
   * Metodo test para obtener la lista de colaboradores
   */
  @isTest(SeeAllData = false) static void getListColaboradores() {
	Colaborador__c objColaborador = [SELECT Id, Nombre__c, ApellidoPaterno__c, ApellidoMaterno__c
					 FROM Colaborador__c WHERE Nombre__c = 'Test Colaborador'];
	Test.startTest();
	componentSeguimientoController.getListColaboradores();
	Test.stopTest();
  }
  
  /**
   * Metodo test para aprobar la asignacion de un colaborador a un proyecto
   */
  @isTest(SeeAllData = false) static void asignarColaborador() {
	Colaborador__c objColaborador = [SELECT Nombre__c, ApellidoPaterno__c, ApellidoMaterno__c
					 FROM Colaborador__c WHERE Nombre__c='Mario'];
	Test.startTest();
	componentSeguimientoController.asignarColaborador(objColaborador.Id);
	Test.stopTest();
  }
}