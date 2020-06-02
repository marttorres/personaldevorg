public class AccountListCtrl{
    @AuraEnabled
    public static List<Account> getAccounts(){     
        List<Account> accList = [SELECT Id, Name, AccountNumber, AccountSource, Site, AnnualRevenue, NumberOfEmployees from Account];
        return accList;
    }
}