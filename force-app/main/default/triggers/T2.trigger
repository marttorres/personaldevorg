trigger T2 on Account (before delete) {
    
    List<BlackList__c> objBl = new List<BlackList__c>();
    
    for(Account a : Trigger.old){
        objBl.add(new BlackList__c(Name = a.Name));
    }
    
    insert objBl;
    System.debug(objBl);
}