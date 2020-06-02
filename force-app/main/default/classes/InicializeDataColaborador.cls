public class InicializeDataColaborador {
    public static void validarColaboradorUpdate(List<sObject> listObjects) {
        generarHistoricoUpdate(listObjects);
        for(Colaborador__c  objColaborador : (List<Colaborador__c>)listObjects) {
            Integer intIsAvailable = validarCapacity(objColaborador);
            if(intIsAvailable == 1) {
                if(objColaborador.FechaCierre__c == system.today()) {
                    objColaborador.FechaInicio__c = null;
                    objColaborador.FechaCierre__c = null;  
                    objColaborador.Account__c = null;
                    objColaborador.Opportunity__c = null; 
            		objColaborador.TrackerDate__c = Date.today();
                    objColaborador.Estatus__c = 'Banca';
                } else {
                    if(objColaborador.Estatus__c == 'Banca') {
                        objColaborador.FechaInicio__c = null;
                        objColaborador.FechaCierre__c = null;  
                        objColaborador.Account__c = null;
            			objColaborador.TrackerDate__c = Date.today();
                        objColaborador.Opportunity__c = null; 
                    } else {
                        objColaborador.TrackerDate__c = null;
                    }
                }
            } else {
                if(intIsAvailable == 0) {
                     objColaborador.addError('Faltan datos para realizar la asignación.');
                }
                if(intIsAvailable == 2) {
                     objColaborador.addError('El proyecto ya cumple con el total de asignaciones.');
                }
            }
        }    
    }
    
    // Retorna un entero 'Código de error'
    // 1 Success
    // 0 Error campos necesarios para realizar la asignación
    // 2 Ya se cubrió la capacidad máxima
    public static Integer validarCapacity(Colaborador__c objNewColaborador) {
        Integer intCodigoError = 1;
        if(objNewColaborador.Estatus__c == 'Banca') {
            intCodigoError = 1;
        } else {
            if(objNewColaborador.Estatus__c == 'Asignado') {
                if(objNewColaborador.Account__c == null || objNewColaborador.Opportunity__c == null || 
                   objNewColaborador.FechaInicio__c == null || objNewColaborador.FechaCierre__c == null) {
                    intCodigoError = 0; 
                } else {
                    List<AggregateResult> listAggregateResult = [SELECT COUNT(Id) FROM Colaborador__c WHERE Opportunity__c = : objNewColaborador.Opportunity__c AND Estatus__c = 'Asignado'];
                    Integer intCapacity = (Integer) listAggregateResult[0].get('expr0');
                    system.debug('Capacidad col: ' + intCapacity);
                    Opportunity objOpportunity = [SELECT Id, numCapacity__c FROM Opportunity WHERE Id = : objNewColaborador.Opportunity__c];
                       system.debug('Capacidad opp: ' + objOpportunity.numCapacity__c);                
                    if ((intCapacity + 1) <= objOpportunity.numCapacity__c) {
                        intCodigoError = 1;
                    } else {
                        intCodigoError = 2;
                    }
                }
            }
            else {
                intCodigoError = 1;
            }
        } 
        
        return intCodigoError;
    }
    
    public static void validarColaboradorInsert(List<sObject> listObjects) {        
        //generarHistoricoInsert(listObjects);
        
        for(Colaborador__c objColaborador : (List<Colaborador__c>)listObjects) { 
            objColaborador.FechaInicio__c = null;
            objColaborador.FechaCierre__c = null;  
            objColaborador.Account__c = null;
            objColaborador.Opportunity__c = null; 
            objColaborador.TrackerDate__c = Date.today();
            objColaborador.Estatus__c = 'Banca';
        }
    }
    
    /*public static void generarHistoricoInsert(List<sObject> listObjects) {        
        List<HistoryColaborador__c> listHistorial = new List<HistoryColaborador__c>();
        List<Colaborador__c> listColaboradores = (List<Colaborador__c>)listObjects;
        for(Colaborador__c objColaborador : listColaboradores) {
            if(objColaborador.Estatus__c == 'Banca') {
                objColaborador.TrackerDate__c = Date.today();
                
            }
            else {
                objColaborador.TrackerDate__c = null;
            }
        }    
    }*/
    
    public static void generarHistoricoUpdate(List<sObject> listObjects) {
        List<HistoryColaborador__c> listHistorial = new List<HistoryColaborador__c>();
        List<Colaborador__c> lstNew = (List<Colaborador__c>)listObjects;
        for(Colaborador__c objColaborador: lstNew) {
            if(objColaborador.Estatus__c == 'Banca') {
                objColaborador.TrackerDate__c = Date.today();
                
            }
            else {
                objColaborador.TrackerDate__c = null;
            }
        }
        
        List<Colaborador__c> listColab = [SELECT Id, Nombre__c, ApellidoPaterno__c, ApellidoMaterno__c, Estatus__c, Account__c, Opportunity__c, FechaInicio__c, FechaCierre__c, Comentarios__c FROM Colaborador__c WHERE Id IN: lstNew AND Estatus__c = 'Asignado'];		
        for(Colaborador__c objColaboador : listColab) {
            HistoryColaborador__c objHist = new HistoryColaborador__c();
            objHist.Account__c = objColaboador.Account__c ;
            objHist.Opportunity__c = objColaboador.Opportunity__c;
            objHist.FechaInicio__c = objColaboador.FechaInicio__c;
            objHist.FechaCierre__c = objColaboador.FechaCierre__c;
            objHist.Comentarios__c = objColaboador.Comentarios__c;
            objHist.Colaborador__c = objColaboador.Id;
            objHist.Nombre__c = objColaboador.Nombre__c + ' '+ objColaboador.ApellidoPaterno__c + ' '+ objColaboador.ApellidoMaterno__c;
            
            listHistorial.add(objHist);

            upsert listHistorial;
        }
    }
}