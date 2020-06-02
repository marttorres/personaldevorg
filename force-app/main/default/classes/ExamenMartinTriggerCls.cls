public class ExamenMartinTriggerCls {
    
    public ExamenMartinTriggerCls() {
    }
    
    public static void insertarPersonajes(List<sObject> listSObjects) {
        List<Actor__c> listActors = new List<Actor__c>();
        List<Personaje__c> listPersonajes = new List<Personaje__c>();
        listActors = (List<Actor__c>)listSObjects;
        
        Integer numContador = 0;
        for(Actor__c objActor : listActors){
            Personaje__c objPersonaje = new Personaje__c();
            objPersonaje.Name__c = objActor.Name__c + ' ' + numContador;
            objPersonaje.Actor__c = objActor.Id;
            objPersonaje.Description__c = objActor.Name__c + ' ' + numContador;
                
            listPersonajes.add(objPersonaje);  
            numContador++;
        }  
        insert listPersonajes;
    }
}