public class CaseControllerCls {
    public List<Case> listCase {get; set;}
    public CaseControllerCls() {
        listCase = [SELECT Id, Account.Name, CaseNumber, Subject, AccountId, Description, Origin FROM Case Where Origin =: 'Phone'];       
    }
}