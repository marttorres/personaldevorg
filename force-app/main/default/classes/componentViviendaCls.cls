/**
 * Esta clase contiene los metodos que permitirán hacer trasacciones DML a la BD
 * <p></p>
 * @ Martin Torres
 */
public class componentViviendaCls {
    /**
     * Esta función retorna un listado de las viviendas existentes en la BD
     */
	@AuraEnabled
	public static List<Vivienda__c> listarViviendas() {
        return [SELECT Id, strDireccion__c, currCostoCasa__c, Color__c, Tamanio__c, numVentanas__c, chkboxPatio__c  
                FROM Vivienda__c
               ];
	}

    /**
     * Esta función inserta un objeto vivienda en la BD
     * 
     * @param objVivienda Representa un sObject de tipo vivienda
     */
    @AuraEnabled
	public static void guardarVivienda(Vivienda__c objVivienda) {
        upsert objVivienda;
	}
}