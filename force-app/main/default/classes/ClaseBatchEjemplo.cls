global class ClaseBatchEjemplo implements Database.Batchable<sObject> {

    global Integer recordUpdate = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bch) {
        String query = 'SELECT Id, LastName FROM Contact LIMIT 1';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<Contact> recordList) {
        for(Contact objContact : recordList) {
            objContact.LastName = objContact.LastName + ' UPDATE';
            recordUpdate = recordUpdate + 1;
        }
        
        update recordList;
    }
    
    global void finish(Database.BatchableContext bc) {
       System.debug(recordUpdate);
    }
}