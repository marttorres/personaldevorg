public class TriggerShippingCls {
    public static void metodoTriggerInsert(List<sObject> listTrigger) {
        List<Account> listTriggerAccount = new List<Account>();
        listTriggerAccount = (List<Account>)listTrigger;
        for(Account objA : listTriggerAccount) {
            if(objA.Match_Billing_Address__c == true) {
                if(objA.ShippingPostalCode == null && objA.BillingPostalCode != null) {
                    System.debug('ENTRE A C');
                    objA.ShippingPostalCode = objA.BillingPostalCode;
                }
                else if(objA.BillingPostalCode ==  null && objA.ShippingPostalCode != null) {
                    
                    System.debug('ENTRE A B');
                    objA.BillingPostalCode = objA.ShippingPostalCode;
                }
            }
        }
    }
    
    public static void metodoTriggerUpdate(List<sObject> listTrigger) {
        List<Account> listTriggerAccount = new List<Account>();
        listTriggerAccount = (List<Account>)listTrigger;
        for(Account objA : listTriggerAccount) {
            if(objA.Match_Billing_Address__c == false) {
                objA.ShippingPostalCode = null;
            }
            /*  else {
                if(objA.BillingPostalCode != null) {
                    objA.ShippingPostalCode = objA.BillingPostalCode;
                }
            }*/
        }
    }
}