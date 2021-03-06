public class AccountListCtrl{
    @AuraEnabled
    public static List<Account> getAccounts(){     
        List<Account> accList = [Select Id, Name, AccountNumber, AccountSource, Site, AnnualRevenue, NumberOfEmployees from Account];
        return accList;
    }
}