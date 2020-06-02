trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
    List<Task> listTask = new List<Task>();
    for(Opportunity objOpportunity : Trigger.new) {
        
        if(objOpportunity.StageName ==  'Closed Won') {
            listTask.add(new Task(Subject = 'Follow Up Test Task', WhatId = objOpportunity.Id));
        }
        
    }
    
    upsert listTask;
}