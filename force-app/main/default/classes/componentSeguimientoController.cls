/**
 * Apex Class utilizada en el componente "Seguimiento"
 * <p /><p />
 * @author Martin Torres, Salvador Zamarrón, Giussep Estrada
 */
public class componentSeguimientoController { 
  /**
   * Este metodo crea una lista de colaboradores 
   * @return Returns Una lista lista de colaboradores
   */
       
  @AuraEnabled
  public static ColaboradorPagerWrapper getListColaboradores(Decimal pageNumber ,Integer recordToDisplay, String strCapability) {
     Integer pageSize = recordToDisplay;
        Integer offset = ((Integer)pageNumber - 1) * pageSize;
        System.debug(pageSize);
       System.debug(offset);
        // create a instance of wrapper class.
        ColaboradorPagerWrapper obj =  new ColaboradorPagerWrapper();
        // set the pageSize,Page(Number), total records and accounts List(using OFFSET)   
        obj.pageSize = pageSize;
        obj.page = (Integer) pageNumber;
        obj.total = [SELECT count() 
                     FROM Colaborador__c
                    WHERE Empresa__c = 'Deloitte' AND Sector__c = 'Digital' AND Capability__c LIKE :('%' + strCapability + '%')];
       obj.listColaboradores =[SELECT Id, Capability__c, Nombre__c, ApellidoPaterno__c, ApellidoMaterno__c, Estatus__c, Account__r.Name, Opportunity__r.Name, FechaInicio__c, FechaCierre__c
         FROM Colaborador__c
            WHERE Empresa__c = 'Deloitte' AND Sector__c = 'Digital' AND Capability__c LIKE :('%' + strCapability + '%') LIMIT :recordToDisplay OFFSET :offset
           ];
            
      
        return obj;
  }
  
    // create a wrapper class with @AuraEnabled Properties    
    public class ColaboradorPagerWrapper {
        @AuraEnabled public Integer pageSize {get;set;}
        @AuraEnabled public Integer page {get;set;}
        @AuraEnabled public Integer total {get;set;}
        @AuraEnabled public List<Colaborador__c> listColaboradores {get;set;}
    }

  /**
   * Este metodo actualiza el estatus de un colaborador
   * @param Indica el id del objeto colaborador
   */
  @AuraEnabled
  public static void asignarColaborador(Id idColaborador) {
	Colaborador__c objColaborador = [SELECT Id, Name, Estatus__c FROM Colaborador__c WHERE Id =: idColaborador];
	objColaborador.Estatus__c = 'Asignado';
    try {
        update objColaborador;
    }
    catch (Exception e){
        string error = e.getMessage();
        throw new AuraHandledException(error);
    }
  }
    
    
    @AuraEnabled
    public static List<String> getPicklistOptions(String fieldName, String sObjectName)
    {
        List<String> options = new List<String>();

        // Get describe of all the objects
        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
        // Get the SObject Type from the specific object name that is passed in
        Schema.SObjectType sobjType = gd.get(sObjectName);
        // Get the describe result of the passed in object
        Schema.DescribeSObjectResult r = sobjType.getDescribe();
        // Get the fields of the passed in object
        Map<String,Schema.SObjectField> field_map = r.fields.getMap();
        // get the pick list values of the field that was passed in from the field map of the object passed in
        List<Schema.PicklistEntry> pick_list_values = field_map.get(fieldName).getDescribe().getPickListValues();

        for (Schema.PicklistEntry f : pick_list_values) 
        {
            options.add(f.getLabel());
        }

        system.debug('Options: ' + options);
        return options;
    }
}