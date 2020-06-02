public class AnimalLocator {

    public static String getAnimalNameById(Integer intIdAnimal) {   
        String nameAnimal = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + intIdAnimal);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animals = (Map<String, Object>) results.get('animal');
            nameAnimal = string.valueOf(animals.get('name'));
        }
        
        return nameAnimal;
    } 
}