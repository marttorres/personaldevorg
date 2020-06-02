trigger ColaboradorTrigger on Colaborador__c (before insert, before update) {
    if(Trigger.isUpdate) {
        if(Trigger.isBefore) {
           InicializeDataColaborador.validarColaboradorUpdate(Trigger.new); 
        }
    }
    
    if(Trigger.isInsert) {
        if(Trigger.isBefore) {
            InicializeDataColaborador.validarColaboradorInsert(Trigger.new); 
        }
    }

}