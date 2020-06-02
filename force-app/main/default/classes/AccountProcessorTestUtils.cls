public class AccountProcessorTestUtils {
    
    public Account createAccount() {
        Account acc = new Account();
        acc.Name = 'Test Account';
        return acc;
    }
    
    public Contact createContact(Id prAccountId) {
        Contact ct = new Contact();
        ct.LastName = 'Test Contact';
        ct.AccountId = prAccountId;
        return ct;
    }
}