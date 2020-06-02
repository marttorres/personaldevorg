@isTest
public class RandomContactFactory
{
	public static List<Contact> generateRandomContacts(Integer numContacts, String lastName)
	{
		List<Contact> listContacts = new List<Contact>();
		
		for( Integer i = 0; i < numContacts; i++ )
		{
			Contact objContact = new Contact(FirstName = 'Test ' + i, LastName = lastName);
			listContacts.add(objContact);
		}		
		return listContacts;
	}
}