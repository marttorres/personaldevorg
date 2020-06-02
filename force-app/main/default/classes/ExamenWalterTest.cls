@isTest
public class ExamenWalterTest {
    
    public Boolean visibleIngresar {set; get;}
    public Boolean visibleTabla {set; get;}
    public Boolean visibleDueno {set; get;}
    
    public String strNombreDueno {set; get;}
    public String strDireccionDueno {set; get;}
    public String strGeneroDueno {set; get;}
    
    public String strRaza {set; get;}    
    public String strMascotaId {set; get;}
    public String strMascotaAdopcion {set; get;}
    public List<Mascota__c> listMascotaBD {set; get;}
    
    public ID IdMascotaSearch {set; get;}
    public String strEspecie {get; set;}
    public Boolean displayPopup {get; set;}
    
    @testSetup static void setup() {
        Profile userProfile = [SELECT Id, Name FROM Profile WHERE Name = 'System Administrator'];
        UserRole userRol = [SELECT Id FROM UserRole WHERE PortalType = 'None' LIMIT 1];
        User userTest = new User(UserRoleId = userRol.Id, 
                                 ProfileId = userProfile.Id,
                                 Username = 'contactAdminw@nissan.com', 
                                 Alias = 'Admin',
                                 Email = 'martin.torres@hotmail.com', 
                                 EmailEncodingKey='UTF-8', 
                                 LastName='Testing', 
                                 LanguageLocaleKey='en_US', 
                                 LocaleSidKey='en_US',
                                 TimeZoneSidKey='America/Los_Angeles');
        insert userTest;
        
        User userTestAdmin = [SELECT Id FROM User WHERE Email = 'martin.torres@hotmail.com' LIMIT 1];
        
        System.runAs(userTestAdmin) {  
            List<Mascota__c> listMascotasRetriever = ExamenWalterHelper.insertarMascotas(5);
            insert listMascotasRetriever;
        }
    }
    
    
    @isTest static void limpiarTest() {    
        Test.startTest();        
        ExamenWalterCls objE2 = new ExamenWalterCls();       
        objE2.strNombreDueno = '';
        objE2.strDireccionDueno = '';
        objE2.strGeneroDueno = '';        
        objE2.strRaza = '';
        objE2.strMascotaId = '';
        objE2.strMascotaAdopcion = '';      
        objE2.limpiar();
        objE2.limpiarDueno();        
        Test.stopTest();         
    }
    
     static testMethod void insertarMascotaErrorTest() {    
        Test.startTest();        
        ExamenWalterCls objExamenWalterCls = new ExamenWalterCls();
        objExamenWalterCls.strRaza = 'Perro';      
        objExamenWalterCls.strRaza = 'Labrador';
        objExamenWalterCls.strMascotaId = '123451';        
        objExamenWalterCls.insertarMascota();
        Test.stopTest();         
    }
    
    static testMethod void insertarMascotaDatosIncompletos() {   
        Test.startTest();        
        ExamenWalterCls objExamenWalterCls = new ExamenWalterCls();
        objExamenWalterCls.strRaza = 'Perro';      
        objExamenWalterCls.strEspecie = '';
        objExamenWalterCls.strMascotaId = '123451';            
        objExamenWalterCls.insertarMascota();
        Test.stopTest();               
    }
    
    static testMethod void insertarMascotaTamanioErroneoTest() {   
        Test.startTest();        
        ExamenWalterCls objExamenWalterCls = new ExamenWalterCls();
        objExamenWalterCls.strRaza = 'Perro';      
        objExamenWalterCls.strEspecie = 'Perro';
        objExamenWalterCls.strMascotaId = '122323451';            
        objExamenWalterCls.insertarMascota();
        Test.stopTest();               
    }
    
    static testMethod void insertarMascotaUniqueTest() {   
        Test.startTest();        
        ExamenWalterCls objExamenWalterCls = new ExamenWalterCls();
        List<Mascota__c> listTest = [SELECT Id FROM Mascota__c WHERE MascotaId__c ='555556'];
        objExamenWalterCls.listMascotaBD = listTest;
        objExamenWalterCls.strRaza = 'Perro';      
        objExamenWalterCls.strEspecie = 'Perro';
        objExamenWalterCls.strMascotaId = '122323451';            
        objExamenWalterCls.insertarMascota();
        Test.stopTest();               
    }
    
    static testMethod void adoptarTest() {   
        Test.startTest();        
        ExamenWalterCls objExamenWalterCls = new ExamenWalterCls();       
        objExamenWalterCls.adoptar();
        Test.stopTest();               
    }
    
    static testMethod void mostrarFalseTest() {   
        Test.startTest();        
        ExamenWalterCls objExamenWalterCls = new ExamenWalterCls();       
        objExamenWalterCls.visibleDueno = false;
        objExamenWalterCls.visibleIngresar = false;
        objExamenWalterCls.visibleTabla = false;
        objExamenWalterCls.mostrarMascota();
        objExamenWalterCls.mostrarTabla();
        Test.stopTest();               
    }
    
    static testMethod void mostrarTrueTest() {   
        Test.startTest();        
        ExamenWalterCls objExamenWalterCls = new ExamenWalterCls();       
        objExamenWalterCls.visibleDueno = true;
        objExamenWalterCls.visibleIngresar = true;
        objExamenWalterCls.visibleTabla = true;
        objExamenWalterCls.mostrarMascota();
        objExamenWalterCls.mostrarTabla();
        Test.stopTest();               
    }
    
    @isTest static void popupTest() {    
        Test.startTest();
        ExamenWalterCls objE5 = new ExamenWalterCls();     
        objE5.displayPopup = false;
        
        objE5.closePopup();
        objE5.showPopup();
        Test.stopTest();         
    }
    
    static testMethod void insertarDuenoTest() {
        Test.startTest();
        ExamenWalterCls objExamenWalterCls = new ExamenWalterCls();
        objExamenWalterCls.strNombreDueno = 'Martin';
    	objExamenWalterCls.strDireccionDueno = 'Zaragoza';
    	objExamenWalterCls.strGeneroDueno = 'H';
        objExamenWalterCls.insertarDueno();
        Test.stopTest();
    }
    
    static testMethod void insertarDuenoIncompletoTest() {
        Test.startTest();
        ExamenWalterCls objExamenWalterCls = new ExamenWalterCls();
        objExamenWalterCls.strNombreDueno = '';
    	objExamenWalterCls.strDireccionDueno = 'Zaragoza';
    	objExamenWalterCls.strGeneroDueno = 'H';
        objExamenWalterCls.insertarDueno();
        Test.stopTest();
    }
    
    static testMethod void insertarDuenoErroneoTest() {
        Test.startTest();
        ExamenWalterCls objExamenWalterCls = new ExamenWalterCls();
        objExamenWalterCls.strNombreDueno = 'Omar';
    	objExamenWalterCls.strDireccionDueno = 'Zaragoza';
    	objExamenWalterCls.strGeneroDueno = 'R';
        objExamenWalterCls.insertarDueno();
        Test.stopTest();
    }
    
    static testMethod void getEspecieTest() {
        Test.startTest();
        ExamenWalterCls objExamenWalterCls = new ExamenWalterCls();
        List<SelectOption> results = new List<SelectOption>();
        results.add(new SelectOption('Perro', 'Perro'));
        results.add(new SelectOption('Gato', 'Gato'));
        objExamenWalterCls.getEspecie();
        Test.stopTest();
    }
}