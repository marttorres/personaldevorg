/**
 * Esta clase contiene los metodos que permitirán hacer trasacciones DML a la BD
 * <p></p>
 * @ Martin Torres
 */
public class componentResidenteCls {
    /**
     * Esta función retorna un listado de residentes existentes en la BD
     */
	@AuraEnabled
	public static List<Residente__c> listarResidentes() {
        return [SELECT Id, Name, currSalario__c, numEdad__c, Sexo__c, Vivienda__c, Vivienda__r.Name, Vivienda__r.currCostoCasa__c, forPagosHipotecarios__c 
                FROM Residente__c
               ];
	}
    
    /**
     * Esta función retorna un listado del residente existentes en la BD condicionado por un Id
     * 
     * @param idResidente Representa el Id del objeto residente sobre el cual operar
     */
	@AuraEnabled
	public static Residente__c listarResidente(String idResidente) {
        return [SELECT Id, Name, currSalario__c, numEdad__c, Sexo__c, Vivienda__c, Vivienda__r.Name  
                FROM Residente__c
                WHERE Id = : idResidente
               ];
	}

    /**
     * Esta función realiza un upsert de un objeto vivienda en la BD
     * 
     * @param objVivienda Representa un sObject de tipo vivienda
     * @param idVivienda Representa el Id del objeto vivienda sobre el cual operar
     */
    @AuraEnabled
	public static void guardarResidentes(Residente__c objResidente, String idVivienda) {
        objResidente.Vivienda__c = idVivienda;
        upsert objResidente;
	}
}