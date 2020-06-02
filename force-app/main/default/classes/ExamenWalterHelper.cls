@isTest
public class ExamenWalterHelper {
    public static List<Mascota__c> insertarMascotas(Integer numMascotas) {        
        List<Mascota__c> listMascota = new List<Mascota__c>();
        if(numMascotas < 10) {
            for(Integer i = 0; i < numMascotas; i++) {
                Mascota__c objMascota = new Mascota__c();
                objMascota.MascotaId__c = '12345' + i;
                objMascota.Especie__c = 'Perro';
                objMascota.Raza__c = 'Pastor';
                
                listMascota.add(objMascota);
            }

			return listMascota;
        } 
        else {
            return listMascota;
        }
    } 
}