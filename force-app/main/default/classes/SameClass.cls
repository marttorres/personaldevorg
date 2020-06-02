global class SameClass {
	@future
    public static void someFutureMethod(List<Id> Accounts) {
        List<Account> listAccounts = [SELECT Id, Name FROM Account WHERE Id IN :Accounts];
        List<Account> listAccountsUpdate = new List<Account>();
        System.debug('Esta lista entera: ');
        
        for(Account a : listAccounts) {
            System.debug('Estos son los nombres: ' + a.Name);
            a.Name = a.Name + ' SF';
            listAccountsUpdate.add(a);
        }
        
        update listAccountsUpdate;
    }
}