public class ExamenTestCls {
	public ID idMovie {set; get;}
    public List<Personaje__c> listActorSelect {get;set;}
    public List<Actor__c> idActores {get;set;}
    public List<Personaje__c> listSend {get;set;}
    
    public ExamenTestCls(ApexPages.StandardController controller) {
        idMovie = controller.getId();
    }
    
    public List<SelectOption> getcontactItem() {
        List<SelectOption> movieItems = new List<SelectOption>();        
        for(Movie__c mov : [SELECT Id, Name FROM Movie__c]){
            movieItems.add(new SelectOption(mov.Id, mov.Name));
        } 
        return movieItems;       
    }
    
    public List<Personaje__c> getQueryRs() {
        String movieQuery = 'SELECT Id FROM Actor__c WHERE Movie__c=:idMovie';
        this.idActores = Database.query(movieQuery);
        String query = 'SELECT Name__c, Quality__c, Picture__c, Actor__r.Name, Actor__r.Prizes__c, Actor__r.Id FROM Personaje__c WHERE Actor__c =:idActores';
        this.listSend =  Database.query(query);
        return this.listSend;
    }
    
    public void searchInfoMovie() {
        this.listActorSelect=getQueryRs();
    }
}