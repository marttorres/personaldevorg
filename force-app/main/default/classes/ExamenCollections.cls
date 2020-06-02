public class ExamenCollections {

    public static void Parte1(){
        System.debug('PARTE 1');
        Set<String> setNombre = new Set<String>();
        setNombre.add('Juan');
        setNombre.add('Roberto');
        setNombre.add('Martin');
        System.debug('El set contiene: ' + setNombre);
        setNombre.remove('Roberto');
        System.debug('El set contiene: ' + setNombre);
        IF(setNombre.contains('Martin')){
            System.debug('Si se encuentra');
        }
        for(String varNombre : setNombre) {
            System.debug(varNombre);
        }
    }
    
    public static void Parte1B(){        
        Set<Integer> setNumeros = new Set<Integer>();
        setNumeros.add(3);
        setNumeros.add(5);
        setNumeros.add(9);
        System.debug('El set contiene: ' + setNumeros);
        setNumeros.remove(2);
        System.debug('El set contiene: ' + setNumeros);
        if(setNumeros.contains(9)){
            System.debug('Si encontro el numero');
        }
        for(Integer varNumero : setNumeros) {
            System.debug(varNumero);
        }
    }
        
    public static void Parte23(){
        System.debug('PARTE 2');
    	Set<ID> setIds = new Set<ID>();
        List<Account> listAccount = [SELECT Id, Name FROM Account WHERE Name LIKE 'C%' OR Name LIKE 'X%' LIMIT 3];
        
        System.debug('PARTE 3');
        for(Account objAccountNew : listAccount){
            setIds.add(objAccountNew.Id);
        }
    }
    
    public static void Parte4(){        
        System.debug('PARTE 4');
        
    	Set<ID> setIds = new Set<ID>();
        List<Account> listAccount = [SELECT Id, Name FROM Account WHERE Name LIKE 'C%' OR Name LIKE 'X%' LIMIT 3];
        for(Account objAccountNew : listAccount){
            setIds.add(objAccountNew.Id);
        }
        
        System.debug('El set contiene: ' + setIds);
        List<Contact> listC1 = [SELECT LastName FROM Contact WHERE AccountId=:setIds];
        System.debug('Contactos '+ listC1);
    }
    
    public static void Parte5(){        
        List<String> listEmpresas = new List<String>{'Deloitte','Everis','Metlife'};
        listEmpresas.add('Acme');
        System.debug('La lista tiene: ' + listEmpresas);
        listEmpresas.remove(0);
        System.debug('La lista tiene: ' + listEmpresas);
        System.debug('Tamanio de la lista : ' + listEmpresas.size());
        System.debug('El primer elmento de la lista es : ' + listEmpresas.get(0));
        System.debug('Está vacia : ' + listEmpresas.isEmpty());
        List<String> listEmpresas2 = listEmpresas.clone();
        System.debug('Lista clonada de empresa' + listEmpresas2);
        for(String strRecorrer : listEmpresas2){
            System.debug(strRecorrer);
        }
    }
    
    public static void Parte6(){        
        
    	Set<ID> setIds = new Set<ID>();
        List<Account> listAccount = [SELECT Id, Name FROM Account WHERE Name LIKE 'C%' OR Name LIKE 'X%' LIMIT 3];
        for(Account objAccountNew : listAccount){
            setIds.add(objAccountNew.Id);
        }
        
        List<List<Contact>> listAc = new List<List<Contact>>();
        for(ID recordId2: setIds){
            listAc.add([SELECT Name FROM Contact WHERE AccountId =: recordId2]);
        }
        Map<ID,List<Contact>> mapEC = new Map<ID,List<Contact>>();
        Integer i =0;
        for(ID recordId: setIds){
            mapEC.put(recordId,listAc.get(i));
            i++;
        }
        System.debug('Mapa con ID Account y Contactos' + mapEC);
    }
    
    public static void Parte7(){        
        System.debug('PASO 7');
        Map<Integer,String> mapDatos = new Map<Integer,String>();
        mapDatos.put(1,'Jon');
        mapDatos.put(6,'Quinton');
        mapDatos.put(7,'Reid');
        Map<Integer,String> mapDatos2 = new Map<Integer,String>();
        mapDatos2.put(4,'AMLO');
        mapDatos2.put(7,'Margarita');
        mapDatos2.put(1,'Anaya');
        Map<Integer, Map<Integer,String>> mapOfMaps = new Map<Integer, Map<Integer,String>>();
        mapOfMaps.put(1,mapDatos);
        mapOfMaps.put(8,mapDatos2);
        System.debug(mapOfMaps);        
    }
        
    public static void Parte8(){        
        System.debug('PASO 8');
        Account objAcc1 = [SELECT Id FROM Account WHERE Name LIKE 'B%' LIMIT 1];
        ID IdAccountAssociado = objAcc1.Id;
        Contact objContactoNuevo = new Contact(LastName = 'Rendon', AccountId = IdAccountAssociado);
        System.debug('Objecto insertado: ' + objContactoNuevo);
        insert objContactoNuevo;
        ID idContactoInsertado = objContactoNuevo.Id;
        Contact objContactoNuevo2 = [SELECT Id, LastName FROM Contact WHERE Id =: idContactoInsertado];
        objContactoNuevo2.LastName = 'Solorzano';
        update objContactoNuevo2;
        System.debug('Objecto actualizado: ' + objContactoNuevo2);
        delete objContactoNuevo2;
    }
    
    public static void Parte9(){        
        System.debug('PASO 9');        
        Account objAcc1 = [SELECT Id FROM Account WHERE Name LIKE 'B%' LIMIT 1];
        ID IdAccountAssociado = objAcc1.Id;
        Contact objCc1 = new Contact(LastName = 'T', AccountId = IdAccountAssociado);
        Contact objCc2 = new Contact(LastName = 'O', AccountId = IdAccountAssociado);
        Contact objCc3 = new Contact(LastName = 'RR', AccountId = IdAccountAssociado);
        Contact objCc4 = new Contact(LastName = 'E', AccountId = IdAccountAssociado);
        Contact objCc5 = new Contact(LastName = 'S', AccountId = IdAccountAssociado);
        List<Contact> listP9 = new List<Contact>{
            objCc1,
            objCc2,
            objCc3,
            objCc4,
            objCc5
                };
        insert listP9;
        System.debug('Se inserto una lista con' + listP9);
        Integer j = 0;
        for(Contact c : listP9){
            c.LastName = 'A' + j;
            j++;
        }
        update listP9;
        System.debug('Se actualizo una lista con' + listP9);
        delete listP9;
        System.debug('Lista eliminada');
    }
}