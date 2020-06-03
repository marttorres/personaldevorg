public class AccountControllerToTest1 {
    public ID idMovie {set; get;}
    public list<Personaje__c> listActorSelect {get; set;}
    public List<Actor__c> idActores;
    public list<Personaje__c> listSend;
    //Hola
    public AccountControllerToTest1(ApexPages.StandardController controller) {}
    
    public List<SelectOption> getcontactItem() {
        List<SelectOption> movieItems = new List<SelectOption>();
        
        for(Movie__c mov : [SELECT Id, Name FROM Movie__C ]){
            movieItems.add(new SelectOption(mov.Id, mov.Name));
        } 
        
        return movieItems;       
    }
    
    public List<Personaje__c> getQueryRs() {
        String movieQuery = 'SELECT Id FROM Actor__c WHERE Movie__c=:idMovie';
        this.idActores = Database.query(movieQuery);
        System.debug('@@@@@ Debug de los actores'+movieQuery);
                String query = 'SELECT Name,Quality__c,Picture__c,Actor__r.Name,Actor__r.Prizes__c FROM Personaje__c WHERE Actor__c =:idActores';
        this.listSend =  Database.query(query);
        System.debug('@@@@@ Debug de los Personajes'+query);
                return this.listSend;
        }
    
    public void searchInfoMovie() {
        this.listActorSelect=getQueryRs();
    }
}