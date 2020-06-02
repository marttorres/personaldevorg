public class CustomLabelsv1 {
    public static String printMessage() {
        return System.Label.Branch;
    }
    
    public static CaseInformation__c getFirstCaseInformationRecord() {
        Map<String, CaseInformation__c> myList = CaseInformation__c.getAll();
        return myList.get('Case1');
    }
}