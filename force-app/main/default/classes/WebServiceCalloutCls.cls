public class WebServiceCalloutCls {
    
    public static getClientes__c endpoint {set; get;}
    
    public static HttpResponse webServiceGetMethod(String strClientNumber) {
        Http objHttp = new Http();
        HttpRequest objRequest = new HttpRequest();
        endpoint = getClientes__c.getValues('saveAccount'); 
        objRequest.setMethod('GET'); 
        objRequest.setEndpoint(endpoint.URL__c + strClientNumber);
        HttpResponse objResponse = objHttp.send(objRequest);
        return objResponse;
    }
}