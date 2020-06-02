public class ContactOpportunityFuture {    
	@future
    public static void agregarOpportunity (List<ID> listIds) {     
        List<Contact> listContacts = new List<Contact>();   
        List<Opportunity> listOpportunities = new List<Opportunity>();
        
        listContacts = [SELECT Id, LastName FROM Contact WHERE Id IN :listIds];
        
        for(Contact objContact : listContacts) {              
            Opportunity objOpportunity = new Opportunity();
            objOpportunity.Name = objContact.LastName;
            objOpportunity.CloseDate = System.today();
            objOpportunity.StageName = 'Prospecting';
            listOpportunities.add(objOpportunity);
        }
        
        insert listOpportunities;  
        
        System.debug('Numero de contactos: ' + listContacts.size());
        System.debug('Numero de oportunidades agregadas: ' + listOpportunities.size());
        System.debug('Lista agregada: ' + listOpportunities);
        
        for(Opportunity objOpportunity : listOpportunities) {
            System.debug('Opportunidad creada: ' + objOpportunity);
        }
    }
}