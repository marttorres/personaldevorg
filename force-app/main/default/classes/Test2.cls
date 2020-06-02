public class Test2 {    
    @AuraEnabled
    public static List<Movie__c> getMovies(){
        List<Movie__c> options = [SELECT Id, Name FROM Movie__c];
        return options;
    }
}