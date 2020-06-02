@isTest
public class ExamenTestHelper {
    public static List<Movie__c> crearMovie(Integer intMovies) {
        List<Movie__c> listMovies = new List<Movie__c>();
        for(Integer i = 0; i < intMovies; i++) {            
            Movie__c objMovie = new Movie__c();
            objMovie.Title__c = 'Avengers ' + i;
            listMovies.add(objMovie);
        }
        return listMovies;
    }
    
    public static List<Actor__c> crearActor(Integer intActors, Movie__c objMovie) {  
        List<Actor__c> listActors = new List<Actor__c>();
        for(Integer i = 0; i < intActors; i++) {            
            Actor__c objActor = new Actor__c();
            objActor.Name__c = 'Martin ' + i;
            objActor.LastName__c = 'Torres';
            objActor.Movie__c = objMovie.Id;
            listActors.add(objActor);
        }
        return listActors;
    }
    
    public static Personaje__c crearPersonaje(Actor__c objActor) {        
        Personaje__c objPersonaje = new Personaje__c();
        objPersonaje.Name__c = 'Bob';
        objPersonaje.Actor__c = objActor.Id;
        return objPersonaje;
    }
}