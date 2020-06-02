/**
 * Apex Class utilizada en el componente “AccQuickActionController.js”
 * <p /><p />
 * @author Martin Torres, Salvador Zamarrón, Giussep Estrada
*/

public with sharing class getColaboradores {
/**
* Este método recupera la información del colaborador cuyo Id se obtiene del componente “AccQuickActionController”
* @return Retorna la información del colaborador mediante el Id mandado desde el componente
*/
	@AuraEnabled
	public static Colaborador__c getCol(Id colid) {		
		Colaborador__c objColaborador = [SELECT Id, ApellidoPaterno__c, ApellidoMaterno__c, Nombre__c, Empresa__c, 
										 Sector__c, Capability__c, Nivel__c FROM Colaborador__c WHERE Id =: colid];	   
		return objColaborador;
	}
/**
* Este método actualiza la información del objeto Colaborador sobre el cual se trabaje y asocia los Id’s de Account y Opportunity para llenar los campos lookup.
* @return Retorna el objeto actualizado
*/

	@AuraEnabled	
	public static Colaborador__c saveColaborador(Colaborador__c objColaborador, Id idAccount, Id idOpportunity) {
		objColaborador.Estatus__c = 'Por Confirmar';  
		objColaborador.Account__c = idAccount;
		objColaborador.Opportunity__c = idOpportunity;
		upsert objColaborador;
		return objColaborador;
	}
}