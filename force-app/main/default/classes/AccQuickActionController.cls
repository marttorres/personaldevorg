public with sharing class AccQuickActionController {    
    @AuraEnabled
    public static Colaborador__c getListColaboradores(Id idColaborador) {
        Colaborador__c objColaborador = [SELECT Id, ApellidoPaterno__c, ApellidoMaterno__c, Nombre__c, Empresa__c, Sector__c, Capability__c, Nivel__c, FechaInicio__c, FechaCierre__c, Account__c, Account__r.Name, Opportunity__c, Opportunity__r.Name 
                              FROM Colaborador__c 
                              WHERE Id = : idColaborador];
        return objColaborador;
    }
    
    @AuraEnabled	
	public static void saveColaborador(Colaborador__c objColaborador, Id idAccount, Id idOpportunity) {
		objColaborador.Estatus__c = 'Por confirmar';  
		objColaborador.Account__c = idAccount;
		objColaborador.Opportunity__c = idOpportunity;
        try {
           upsert objColaborador;
        }
        catch (Exception e){
            String error = e.getMessage();
            String errorMsg = error.substringBetween('FIELD_CUSTOM_VALIDATION_EXCEPTION, ', ': ');
            throw new AuraHandledException(errorMsg);
        }
	}
}