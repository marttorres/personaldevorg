@isTest
global class WebServiceClsMock implements HttpCalloutMock{
    
    global String strMockCode {set; get;}
    
    global WebServiceClsMock(String strMock) {
        strMockCode = strMock;
    }
    
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"Error Error": "Error", "Name": "Cliente Prueba 1 SA de CV", "Adress": "Calle Prueba No. 5, Queretaro, Queretaro", "Year Billing": "5000000", "Company Type": "Mediana Empresa"}');        

        if(strMockCode.equals('200')) {
            response.setStatusCode(200);
        }
        else if(strMockCode.equals('403')) {
            response.setStatusCode(403);            
        }
        else if(strMockCode.equals('503')) {
            response.setStatusCode(503);            
        }
        
        return response;
    }  
}