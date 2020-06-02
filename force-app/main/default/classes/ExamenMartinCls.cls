public class ExamenMartinCls {  
    
    public ID selectedMovie {get; set;}
    
    public List<SelectOption> getTitle()
    {
        List<SelectOption> results = new List<SelectOption>();
        for (Movie__c objMovie : [SELECT Id, Title__c FROM Movie__c])
        {
            results.add(new SelectOption(objMovie.Id, objMovie.Title__c));
        }
        return results;
	}
    
    public PageReference movieSelected() {
        this.getListActors();
        return null;
    }
    
    public ExamenMartinCls() {   
        Movie__c objDefecto = new Movie__c();
        objDefecto = [SELECT Id FROM Movie__c LIMIT 1];
        selectedMovie = objDefecto.Id;
        this.getMovieImage();
        this.getListActors();
    }

    public List<Actor__c> getListActors() {        
        List<Actor__c> listActor;
        listActor = [SELECT LastName__c, (SELECT Name__c, Quality__c, Picture__c FROM Personajes__r), Prizes__c FROM Actor__c WHERE Movie__r.Id =:selectedMovie];
        return listActor;
    }
    
    public String getMovieImage() {
        String strImage;
        Movie__c objMovie = new Movie__c();
        objMovie = [SELECT MovieImg__c FROM Movie__c WHERE Id =:selectedMovie LIMIT 1];
        strImage = objMovie.MovieImg__c;
        return strImage;
    }

}