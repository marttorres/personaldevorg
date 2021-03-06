@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
               ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
               List<String> listParks = new List<String>{'Park1', 'Park2', 'Park3'};
               response_x.return_x = listParks;
               response.put('response_x', response_x); 
           }
}