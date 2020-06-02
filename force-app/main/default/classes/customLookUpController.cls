/**
* Este clase comunica el metodo en el helper del componente LookUp con salesforce
* <p></p>
* @Giussepe Estrada, Martin Torres y Salvador Zamarron 
*/
public class customLookUpController {  
/**
  * Este metodo se ejecuta con el estado onfocus del lookup
  * 
  * @param strSearchKeyWord Indica lo ingresado por el usuario
  * @param strAPINameObjecto Indica el nombre sobre el cual buscar
  * @param strIdObjetoPadre Indica el Id del objeto master si fuese el caso
  */
  @AuraEnabled
  public static List<sObject> fetchLookUpValues(String strSearchKeyWord, String strAPINameObjecto, String strIdObjetoPadre) {
	String strSearchKey = strSearchKeyWord + '%';
	List<sObject> listReturnList = new List<sObject>();
	String strQuery = ''; 
	
	if(strAPINameObjecto == 'account') {
	  strQuery = 'SELECT Id, Name FROM ' + strAPINameObjecto + ' WHERE Name LIKE : strSearchKey ORDER BY createdDate DESC LIMIT 3';
	} else {
	  strQuery = 'SELECT Id, Name FROM ' + strAPINameObjecto + ' WHERE Name LIKE : strSearchKey AND AccountId =: strIdObjetoPadre ORDER BY createdDate DESC LIMIT 5';
	}
	
	List <sObject> listOfRecords = Database.query(strQuery);
	
	for (sObject obj : listOfRecords) {
	  listReturnList.add(obj);
	}
	
	return listReturnList;
  }
}