global class ClassBatchExamen implements Database.Batchable<sObject> {

    global Integer recordUpdate = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bch) {
        String querySearch = 'SELECT Id, Name FROM Account LIMIT 3';
        return Database.getQueryLocator(querySearch);
    }
    
    global void execute(Database.BatchableContext bc, List<Account> recordList) {
        for(Account objAccount : recordList) {
            objAccount.Name = objAccount.Name + '  _fin';
            recordUpdate = recordUpdate + 1;
        }
        
        update recordList;
    }
    
    global void finish(Database.BatchableContext bc) {
       System.debug('Finish method');
       System.debug(recordUpdate);
    }
}