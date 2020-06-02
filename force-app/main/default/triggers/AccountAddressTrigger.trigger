trigger AccountAddressTrigger on Account (before insert, before update) {
    for(Account objAccount : Trigger.New) {
        if(objAccount.Match_Billing_Address__c == true) {
            if(objAccount.ShippingPostalCode == null &&  objAccount.BillingPostalCode == null) {
                objAccount.addError('Datos nulos');
            }
            else {
                objAccount.ShippingPostalCode = objAccount.BillingPostalCode;                
            }
        }           
    }
}