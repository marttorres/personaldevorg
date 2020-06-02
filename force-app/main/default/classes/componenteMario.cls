public class componenteMario {
	@AuraEnabled
	public static Actor__c saveItem(Actor__c actor) {
		insert actor;
		return actor;
	}
    
	@AuraEnabled
	public static List<Movie__c> getMovieData() {
		return [SELECT Id, Title__c, Rating__c, Gender__c FROM Movie__c];
	}
}