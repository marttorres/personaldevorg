trigger BulkTriggervsTrigger on Opportunity (before insert) {

}



/*
 * Solo aguanta 150 , 151 truena
for(opportunity opp : Trigger.new) {
    Task t = new Task();
    t.Name = 'Give you hope';
    t.whatId = opp.Id;
    insert t;
}

2000 record
Bulktrigger
List<Task> taskList = new List<Task>();
for(opportunity opp : Trigger.new) {
    Task t = new Task();
    t.Name = 'Give you hope';
    t.whatId = opp.Id;
    taskList.add(t);
}
insert taskList;
*/