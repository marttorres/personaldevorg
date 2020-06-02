public class ContactSearch {
    public static List<Contact> searchForContacts(String prLastName, String prMailingPostalCode){
        List<Contact> objContacts = [SELECT LastName, MailingPostalCode FROM Contact WHERE LastName=:prLastName AND MailingPostalCode=:prMailingPostalCode];
    	return objContacts;
    }
}