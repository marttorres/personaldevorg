public class GanttChart {
    @AuraEnabled
    public static List<TrainingWrapper> getAccounts(String strQuery) {        
        String strFinalQuery = 'SELECT  Name FROM Account LIMIT 10 ';
        List<TrainingWrapper> listAccountWrapper = new List<TrainingWrapper>();

        for(Account objAccount : Database.query(strFinalQuery)) {
            TrainingWrapper objTrainingWrapper = new TrainingWrapper(); 
            objTrainingWrapper.taskName = objAccount.Name ;
            objTrainingWrapper.start = System.Today() ;
            objTrainingWrapper.ended = System.Today() + 5;
            listAccountWrapper.add(objTrainingWrapper);            
        }

        return listAccountWrapper;
    } 

    public class TrainingWrapper {
        @AuraEnabled
        public String taskName {get;set;}
        @AuraEnabled
        public Date start {get;set;}
        @AuraEnabled
        public Date ended {get;set;}
    }
}