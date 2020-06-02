public class Apuntes {

}
/*    EJEMPLO DE COLECCION SET
Set<String> setDatos = new Set<String>{'Jon','Quinton','Reid'};
System.debug('Conjunto' + setDatos);
Account objAccount1 = new Account(Name = 'Acme', Type='Customer - Channel');
Account objAccount2 = new Account(Name = 'Acme');
Set<Account> setAccounts = new Set<Account>{objAccount1, objAccount2};
System.debug(setAccounts);
setDatos.add('Sandeep');
setDatos.add('Sandeep');
System.debug('Conjunto' + setDatos);
System.debug('Size ' + setDatos.size());
setDatos.remove('Jon');
System.debug('Conjunto' + setDatos);
System.debug('El conjunto contiene Reid ' + setDatos.contains('Reid'));
IF(setDatos.contains('Reid')){
    System.debug('Lo contine');
}
for(String strDato: setDatos){
    System.debug(strDato);
}
*/


/* LISTAS
List<String> listDatos = new List<String>{'Jon','Quinton','Reid'};
listDatos.add('Acme');
listDatos.add('Acme');
System.debug('Data: ' + listDatos);
System.debug('Size list: ' + listDatos.size());
System.debug('Primer elemento ' + listDatos.get(0));
listDatos.remove(0);
System.debug('Data: ' + listDatos);
System.debug('Is list empty? ' + listDatos.isEmpty());
List<String> listDatos2 = listDatos.clone();
System.debug(listDatos2);
Set<ID> setIds = new Set<ID>{'001f400000JxZxbAAF', '001f400000JxZxcAAF'};
List<Account> listAccount = [SELECT Name FROM Account WHERE Id=:setIds];
System.debug(listAccount);
for(Account objAccount : listAccount){
    System.debug('OBJ: ' + objAccount);
}
System.debug('Segundo FOR');
for(Account objAccount : [SELECT Id, Name FROM Account LIMIT 2]){
    System.debug('Name Account: ' + objAccount.Name);
}
List<Account> listAccount3 = [SELECT Id, Name FROM Account Limit 2];

System.debug('Tercer FOR');
System.debug('Data of List 3' + listAccount3);
for(Integer i=0 ; i<listAccount3.size(); i++) {
    System.debug('Nombre de cuenta: ' + listAccount3.get(i).Name);
}https://martintorres-dev-ed.my.salesforce.com/s.gif
*/


/* MAPAS
Map<Integer,String> mapDatos = new Map<Integer,String>();
mapDatos.put(1,'Jon');
mapDatos.put(6,'Quinton');
mapDatos.put(7,'Reid');

System.debug('Datos mapa: ' + mapDatos);
System.debug('Existe el registro 6: ' + mapDatos.containsKey(6));
System.debug('Valores del Id 6 ' + mapDatos.get(6));
System.debug('El tamano del mapa es: ' + mapDatos.size());
mapDatos.remove(6);
System.debug('Datos después de eliminar el mapa: ' + mapDatos);
System.debug('Is empty? ' + mapDatos.isEmpty());

Map<ID, Account> mapAccount = new Map<ID,Account>(
	[SELECT Id,Name,Phone FROM Account LIMIT 2]
);
System.debug('Datos de los mapas ' + mapAccount);
System.debug('Claves: ' + mapAccount.keySet());
for(Id idAcc : mapAccount.keySet()) {
    System.debug('Nombre de la cuenta ' + mapAccount.get(idAcc).Name);
}


Map<Integer, Map<Integer,String>> mapOfMaps = new Map<Integer, Map<Integer,String>>();
mapOfMaps.put(1,mapDatos);
mapOfMaps.put(8,mapDatos2);

System.debug(mapOfMaps);
*/


 
        /*
        Boolean boolEstatus = false;
        Set<Id> idListObjects = new  Set<Id>();
        
        for(sObject objSObjectColaborador : listObjects) {
            idListObjects.add(objSObjectColaborador.Id);
        }
                
        List<Colaborador__c> listColaboradoresRecibida = [SELECT Id, Opportunity__r.Id, Opportunity__r.numCapacity__c FROM Colaborador__c WHERE Id IN : idListObjects];
        System.debug('Colaboradores recibidos'+listColaboradoresRecibida);
        
        List<Colaborador__c> listColaboradoresBd = [SELECT Id, Opportunity__r.Id FROM Colaborador__c];
        Set<Id> setIds = new Set<Id>();
        
        for(Colaborador__c objColaborador : listColaboradoresBd) {
            if(objColaborador.Opportunity__r.Id != null) {
                setIds.add(objColaborador.Opportunity__r.Id);
            }
        }
        
        List<Colaborador__c> listColaboradoresInSet = [SELECT Opportunity__r.Id FROM Colaborador__c WHERE Opportunity__r.Id IN :setIds];
        Map<Id,Integer> mapOpportunityCapacity = new Map<Id,Integer>();
        
        for (Id idColaboradorInSet : setIds) {		
            Integer intCantidadOpportunities = 0;
            for(Colaborador__c objColaboradorToMap : listColaboradoresInSet){
                if(idColaboradorInSet == objColaboradorToMap.Opportunity__r.Id){
                    intCantidadOpportunities++;
                }
            }
            mapOpportunityCapacity.put(idColaboradorInSet, intCantidadOpportunities);
        }
        
        for(Colaborador__c objNewColaborador : listColaboradoresRecibida) {
            for(Id idActualOfColaborador : mapOpportunityCapacity.keySet()) {
                if(objNewColaborador.Opportunity__r.Id == idActualOfColaborador) {
                    if((mapOpportunityCapacity.get(idActualOfColaborador) + 1) <= objNewColaborador.Opportunity__r.numCapacity__c) {
                        boolEstatus = true;
                    } else {
                        boolEstatus = false;
                    }
                }
            }
        }
        
        return boolEstatus;
        */