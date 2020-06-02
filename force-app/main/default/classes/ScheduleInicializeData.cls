global class ScheduleInicializeData implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Colaborador__c> listColaboradores = [SELECT Id, Account__c, Opportunity__c, FechaInicio__c, FechaCierre__c, Estatus__c FROM Colaborador__c];
		List<Colaborador__c> listColaboradoresUpdate = new List<Colaborador__c>();      
        
        for (Colaborador__c objColaborador : listColaboradores) {
            if(objColaborador.FechaCierre__c == system.today()) {
                objColaborador.FechaInicio__c = null;
                objColaborador.FechaCierre__c = null;  
                objColaborador.Account__c = null;
                objColaborador.Opportunity__c = null;
                objColaborador.Estatus__c = 'Banca';
                listColaboradoresUpdate.add(objColaborador);
            }
        }
        
        update listColaboradoresUpdate;
    }
}