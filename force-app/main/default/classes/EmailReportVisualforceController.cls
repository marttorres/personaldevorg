public class EmailReportVisualforceController {

    private final List<Opportunity> accounts;
    public String contact {get; set;}

    public EmailReportVisualforceController() {
        accounts = [select Name from Opportunity where Manager__c =:contact ];
    }

    public List<Opportunity> getSmithAccounts() {
        return accounts;
    }
}