public class NewCaseListController {
    public List<Case> getNewCases() {
        List<Case> listResult = [SELECT Id, CaseNumber FROM Case WHERE Status = 'New'];
        return listResult;
    }
}