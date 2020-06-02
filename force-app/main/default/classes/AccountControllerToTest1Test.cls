@isTest
public class AccountControllerToTest1Test {
    @isTest static void prueba() {
		Movie__c obj = new Movie__c(Title__c ='Test');
        insert obj;
        ApexPages.StandardController sc = new ApexPages.StandardController(obj);
     	AccountControllerToTest1 testAccPlan = new AccountControllerToTest1(sc);
    }
    
     @isTest static void prueba2() {
        Movie__c obj = new Movie__c(Title__c ='Test');
        insert obj;
        ApexPages.StandardController sc = new ApexPages.StandardController(obj);
        AccountControllerToTest1 testAccPlan = new AccountControllerToTest1(sc);
        testAccPlan.getQueryRs(); 
        testAccPlan.searchInfoMovie();
        testAccPlan.getcontactItem();
    }
}