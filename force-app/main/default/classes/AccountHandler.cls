public class AccountHandler {
    public static Account insertNewAccount (String prStrName) {
        Account objAccount = new Account();
        objAccount.Name = prStrName;
        
        try{
            insert objAccount;
            return objAccount;
        }
        catch (DmlException e) {
            return null;
        }
    } 
}