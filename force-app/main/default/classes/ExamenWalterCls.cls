public class ExamenWalterCls {
    
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
    
    public String strEspecie {get; set;}
    public Boolean displayPopup {get; set;}
 
    public void closePopup() {
        displayPopup = false;
    }
 
    public void showPopup() {
        displayPopup = true;
    }    
    
    public List<SelectOption> getEspecie()
    {
        List<SelectOption> results = new List<SelectOption>();
        results.add(new SelectOption('Perro', 'Perro'));
        results.add(new SelectOption('Gato', 'Gato'));
        return results;
	}
    
    public ExamenWalterCls() {
        visibleIngresar = false;
        visibleTabla = false;
        visibleDueno = false;
        getListMascotas();
    }
    
    public void insertarMascota() {
        if(strMascotaId != '' && strEspecie != '' && strRaza != ''){
            if(strMascotaId.length() == 6) {    
       			listMascotaBD = [SELECT Id FROM Mascota__c WHERE MascotaId__c=: strMascotaId LIMIT 1];
                if(listMascotaBD.size() == 1) {
                    ApexPages.Message msgError = new ApexPages.Message(ApexPages.Severity.ERROR, 'El Id ya existe.');
                    ApexPages.addMessage(msgError);
                }
                else {       
                    Mascota__c objMascota = new Mascota__c();
                    objMascota.MascotaId__c = strMascotaId;
                    objMascota.Especie__c = strEspecie;
                    objMascota.Raza__c = strRaza;
                    
                    insert objMascota; 
                        
                    limpiar();
                    
                    ApexPages.Message msgError = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'La mascota ha sido insertada.');
                    ApexPages.addMessage(msgError);
                }    
            }
            else {
                ApexPages.Message msgError = new ApexPages.Message(ApexPages.Severity.ERROR, 'El ID tiene que tener 6 caracteres.');
                ApexPages.addMessage(msgError);
            }   
        }
        else {
            ApexPages.Message msgError = new ApexPages.Message(ApexPages.Severity.ERROR, 'Hay campos requeridos sin completar.');
            ApexPages.addMessage(msgError);
        }          
    }
    
    public void mostrarMascota() {
        if(visibleIngresar == true) {
            visibleIngresar = false;
        }
        else {
            visibleIngresar = true;
        }
    }
    
    public void mostrarTabla() {          
        if(visibleTabla == true) {
            visibleTabla = false;
            visibleDueno = false;
        }
        else {
            visibleTabla = true;
        }
    }
    
    public void adoptar() {
        visibleDueno = true;
        strMascotaAdopcion = apexpages.currentpage().getparameters().get('idAdopcion');
    }
    
    public void limpiar() {
        strRaza = '';
        strMascotaId = '';
    }
    
    public void limpiarDueno() {
        strNombreDueno = '';
        strDireccionDueno = '';
        strGeneroDueno = '';
    }

    public void insertarDueno() { 
        if(strNombreDueno != '' && strDireccionDueno != '' && strGeneroDueno != ''){            
            if(strGeneroDueno == 'H' || strGeneroDueno == 'M') {
                
                Dueno__c objDueno = new Dueno__c();
                objDueno.Nombre__c = strNombreDueno;
                objDueno.Direccion__c = strDireccionDueno;
                objDueno.Genero__c = strGeneroDueno;
                       
                insert objDueno;            
                
                Mascota__c objM = [SELECT Id, Dueno__r.Id FROM Mascota__c WHERE MascotaId__c =:strMascotaAdopcion LIMIT 1];
                objM.Dueno__c = objDueno.Id;
               
                update objM;         
                
                ApexPages.Message msgError = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Tienes un nuevo amigo.');
                ApexPages.addMessage(msgError);
                
                
                if(visibleDueno == true) {
                    visibleDueno = false;
                    visibleTabla = true;
                }    
                
                limpiarDueno();
                
                showPopup();
            }
            else {
                ApexPages.Message msgError = new ApexPages.Message(ApexPages.Severity.ERROR, 'El genero debe ser H o M.');
                ApexPages.addMessage(msgError);
            }
        }
        else {
            ApexPages.Message msgError = new ApexPages.Message(ApexPages.Severity.ERROR, 'Hay campos requeridos sin completar.');
            ApexPages.addMessage(msgError);
        }
    } 
    
    public List<Mascota__c> getListMascotas () {
        List<Mascota__c> listaMascotas = [SELECT Id, MascotaId__c, Especie__c, Raza__c, Estatus__c, Dueno__r.Id, Dueno__r.Nombre__c FROM Mascota__c];
        return listaMascotas;
    }
 }