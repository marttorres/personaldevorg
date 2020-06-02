public class ListContactCls {
    
    public String query = 'LastName ASC';    
    public ID selectedAcc {get; set;}
    
    public List<SelectOption> getAccOtps()
    {
        List<SelectOption> results=new List<SelectOption>();
        for (Account acc : [SELECT Id, Name from Account])
        {
            results.add(new SelectOption(acc.Id, acc.Name));
        }
        return results;
	}
    
    public PageReference accountSelected() {
        this.getListContacts();
        return null;
    }
    
    public ListContactCls() {   
        this.getListContacts();
    }

    public List<Contact> getListContacts() {        
        List<Contact> listContact;
        listContact = Database.query('SELECT LastName, Phone, Email FROM Contact WHERE AccountId =:selectedAcc ORDER BY ' + this.query);
        return listContact;
    }
    
    public void sortByLastName(){
        if(this.query.equals('LastName ASC')) {
			this.query = 'LastName DESC';            
        }
        else {
            this.query = 'LastName ASC';     
        }
    }
}