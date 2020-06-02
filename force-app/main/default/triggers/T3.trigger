trigger T3 on Account (before update) {
    System.debug('OLD');
    for(Account a: Trigger.old){
        System.debug(a);
    }
    System.debug('NEW');
    for(Account a: Trigger.new){
        System.debug(a);
    }

}