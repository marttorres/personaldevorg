@isTest
public class ExamenTestTest {
    @testSetup static void setup() {
        Profile userProfile = [SELECT Id, Name FROM Profile WHERE Name = 'Custom: Sales Profile'];
        																//Partner Community User
        UserRole userRol = [SELECT Id FROM UserRole WHERE PortalType = 'None' LIMIT 1];
        User userTest = new User(UserRoleId = userRol.Id, 
                                 ProfileId = userProfile.Id,
                                 Username = 'contactAdminw@nissan.com', 
                                 Alias = 'Admin',
                                 Email = 'martin.torres@hotmail.com', 
                                 EmailEncodingKey='UTF-8', 
                                 LastName='Testing', 
                                 LanguageLocaleKey='en_US', 
                                 LocaleSidKey='en_US',
                                 TimeZoneSidKey='America/Los_Angeles');
        insert userTest;
        
        User userTestAdmin = [SELECT Id FROM User WHERE Email = 'martin.torres@hotmail.com' LIMIT 1];
        
        System.runAs(userTestAdmin) {  
            List<Movie__c> listObjsMovie = ExamenTestHelper.crearMovie(5);
            insert listObjsMovie;
            system.debug('Las peliculas insertadas son ' + listObjsMovie);
            
            Movie__c objMovieSearch = [SELECT Id, Title__c FROM Movie__c LIMIT 1];
            List<Actor__c> listObjsActor = ExamenTestHelper.crearActor(2, objMovieSearch);
            insert listObjsActor;       
            system.debug('Los actores insertados son ' + listObjsActor);
                    
            ApexPages.StandardController sc = new ApexPages.StandardController(objMovieSearch);
            ExamenTestCls testAccPlan = new ExamenTestCls(sc);
        }
    }
    
     @isTest static void test() {
        Movie__c obj = [SELECT Id FROM Movie__c LIMIT 1];
        ApexPages.StandardController sc = new ApexPages.StandardController(obj);
        ExamenTestCls objexamenClass = new ExamenTestCls(sc);
        List<Personaje__c> listPersonajes =  objexamenClass.getQueryRs(); 
        System.debug('Lista de personajes: ' + listPersonajes);
        objexamenClass.searchInfoMovie();
        objexamenClass.getcontactItem();
    }
}