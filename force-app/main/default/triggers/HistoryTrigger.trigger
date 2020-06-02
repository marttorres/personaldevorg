trigger HistoryTrigger on HistoryColaborador__c (before update) {
    List<HistoryColaborador__c> lstHistCol = Trigger.new;
    for(HistoryColaborador__c objHist : lstHistCol) {
        if ((objHist.Desempeno__c == 'DX Extraordinario') || (objHist.Desempeno__c == 'AD Alto') || (objHist.Desempeno__c == 'DE Esperado') || (objHist.Desempeno__c == 'DA Aceptable') || (objHist.Desempeno__c == 'BD Bajo')) {
            objHist.numCounter__c = objHist.numCounter__c +1;
        }
    } 
}