public class WebServiceController {
    public List<String> listClientNumbers = new List<String> {'D0000001', 'D0000002', 'D0000003', 'D0000004', 'D0000005'};
    public String strClientNumber {set; get;}
    public HttpResponse objDataResponse {set; get;}
   
    public WebServiceController(ApexPages.StandardController controller) {
    }
    
    public void insertAccount() {
		Boolean isCorrect = validateClientNumber();  
        
        if(isCorrect) {
            Map<String, Object> mapDataClient = (Map<String, Object>) JSON.deserializeUntyped(objDataResponse.getBody());

            Account objAccount = new Account();
            objAccount.Numero_de_Cliente__c = String.valueOf(mapDataClient.get('Client Number'));
            objAccount.Name = String.valueOf(mapDataClient.get('Name'));
            objAccount.Facturacion_Anual__c = Integer.valueOf(mapDataClient.get('Year Billing'));
            objAccount.Direccion__c = String.valueOf(mapDataClient.get('Adress'));
            objAccount.Tipo_de_Empresa__c = String.valueOf(mapDataClient.get('Company Type'));
     	
            insert objAccount;
            
            objDataResponse = null;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Client OK INSERTED'));
        }   
        else {
            objDataResponse = null;
        }
    }
    
    public Boolean validateClientNumber() {
        if(listClientNumbers.contains(strClientNumber)) {
            objDataResponse = WebServiceCalloutCls.webServiceGetMethod(strClientNumber); 
            
            if(objDataResponse.getStatusCode() == 403) {  
                ApexPages.Message msgError = new ApexPages.Message(ApexPages.Severity.WARNING, '403 code in web service');
                ApexPages.addMessage(msgError);
            	objDataResponse = null;
                return false;
            }
            else if(objDataResponse.getStatusCode() == 503) {
                ApexPages.Message msgError = new ApexPages.Message(ApexPages.Severity.ERROR, '503 code in web service');
                ApexPages.addMessage(msgError);
                objDataResponse = null;
                return false;
            }
            else if(objDataResponse.getStatusCode() == 200) { 
                return true;                 
            }
            else {
                ApexPages.Message msgError = new ApexPages.Message(ApexPages.Severity.ERROR, 'Unknow code in web service');
                ApexPages.addMessage(msgError);
            	objDataResponse = null;
                return false;
            }
        }
        else {            
            ApexPages.Message msgError = new ApexPages.Message(ApexPages.Severity.ERROR, 'Invalid client number');
            ApexPages.addMessage(msgError);
            objDataResponse = null;
            return false;
        }
    }
}