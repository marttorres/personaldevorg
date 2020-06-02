public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String prLastName) {
        List<List<sObject>> listObjectos = [FIND :prLastName IN ALL FIELDS RETURNING Contact(LastName),Lead(LastName)];
        return listObjectos;
    }
}